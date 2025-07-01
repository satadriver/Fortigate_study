/*
    gcc decrypt_rootfs.c chacha20.c -o decrypt_rootfs -lssl -lcrypto
*/
#include <stdio.h>
#include <stdlib.h>
#include <openssl/evp.h>
#include "chacha20.h"

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "libssl.lib")
#pragma comment(lib, "libcrypto.lib")



//windows rcx,rdx,r8,r9
//linux rdi,rsi,rdx,rcx,r8,r9




extern void AesCryptProc(int* a1, int* a2, int a3);

void printhex(unsigned char* data, int len) {
    int i = 0;
    for(; i < len; i++) {
        printf("%02X", data[i]);
    }
}

int main(int argc, char **argv)
{
    int tag = 0;

    if(argc < 4) {
        fprintf(stderr, "Usage: %s rootfs.tgz rootfs.tgz.decrypted <KEY_HEXA>\n", argv[0]);
        //return 1;

    }
    else {
        if (strlen(argv[3]) != 64) {
            fprintf(stderr, "Key must be 64 (32-bytes) hexa chars string\n");
            return 1;
        }

        tag = 1;
    }

    char g_FirmwareSeed[32] = { 0 };
    //unsigned char cckey[32] = {
    //0x48, 0x8E, 0x32, 0x43, 0x27, 0x08, 0x3F, 0x6F, 0x96, 0xCB, 0xC2, 0x53, 0x85, 0x15, 0x29, 0x5F,
    //0xE9, 0x3B, 0x8D, 0xE0, 0x84, 0xAD, 0x45, 0xC8, 0x47, 0x61, 0x95, 0x24, 0x6F, 0xC8, 0x37, 0x1C
    //};

    unsigned char cckey[32] = {
    0xF0, 0xF3, 0xB7, 0x98, 0x27, 0x52, 0x06, 0xB0, 0x2F, 0xA0, 0x54, 0x86, 0xD7, 0xBA, 0x41, 0x42,
    0x2B, 0xB3, 0x89, 0x19, 0x6E, 0x3D, 0x2C, 0xB8, 0x64, 0xC7, 0x5B, 0x16, 0x52, 0x3A, 0x76, 0x2D
    };

    if (tag) {
        
        char* pos = argv[3];
        for (size_t i = 0; i < sizeof g_FirmwareSeed; i++) {
            sscanf(pos, "%2hhx", &g_FirmwareSeed[i]);
            pos += 2;
        }
    }
    else {
        memcpy(g_FirmwareSeed, cckey, 32);
    }
    

    
    EVP_MD_CTX *mdctx;
    unsigned char *md1 = NULL;
    unsigned char *md2 = NULL;

    if((mdctx = EVP_MD_CTX_new()) == NULL)
        return 1;

    if(EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed + 4, 28) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed, 4) != 1)
        return 1;

    if((md1 = (unsigned char *)OPENSSL_malloc(EVP_MD_size(EVP_sha256()))) == NULL)
        return 1;

    if(EVP_DigestFinal_ex(mdctx, md1, NULL) != 1)
        return 1;

    EVP_MD_CTX_free(mdctx);

    printhex(md1, 32);
    printf("\n");

    if((mdctx = EVP_MD_CTX_new()) == NULL)
        return 1;

    if(EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed + 5, 27) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed, 5) != 1)
        return 1;

    if((md2 = (unsigned char *)OPENSSL_malloc(EVP_MD_size(EVP_sha256()))) == NULL)
        return 1;

    if(EVP_DigestFinal_ex(mdctx, md2, NULL) != 1)
        return 1;

    EVP_MD_CTX_free(mdctx);

    printhex(md2, 32);
    printf("\n");

    //
    // ChaCha20 (custom)
    //

    char* filename = 0;
    if (tag) {
        filename = argv[1];
    }
    else {
        filename = "rootfs_out.gz";
    }
    FILE *f = fopen(filename, "rb");
    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    fseek(f, 0, SEEK_SET);
    // skip trailing signature
    fsize -= 256;
    printf("rootfs size: %u\n", fsize);
    char *data = malloc(fsize);
    fread(data, fsize, 1, f);
    fclose(f);

    printf("Decrypting rootfs...\n");
    struct chacha20_context ctx;
    chacha20_init_context(&ctx, md1, md2);
    chacha20_xor(&ctx, data, fsize);

    // Check if GZ
    uint16_t magic = *(int16_t *)data;
    if (magic != 0x8B1F) {
        fprintf(stderr, "Failed to decrypt (not a GZ, magic=%X)\n", magic);
        return 1;
    }

    printf("Writing to %s...\n", argv[2]);
    FILE *f_out = fopen(argv[2], "wb");
    fwrite(data, fsize, 1, f_out);
    fclose(f_out);

    return 0;
}