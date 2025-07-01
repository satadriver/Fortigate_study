/*
    gcc decrypt_rsapubkey.c chacha20.c -o decrypt_rsapubkey -lssl -lcrypto
*/

#pragma warning(disable : 4996)  // 屏蔽 C4996 警告
#include <stdio.h>
#include <openssl/evp.h>
#include "chacha20.h"

#include "aesUtils.h"
#include <openssl/modes.h>
#include <openssl/aes.h>
#include <openssl/bn.h>

#include <winsock.h>

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "libssl.lib")
#pragma comment(lib, "libcrypto.lib")

void printhex(unsigned char* data, int len) {
    int i = 0;
    for(; i < len; i++) {
        printf("%02X", data[i]);
    }
}


int str2hex(char* str, char* hex) {
    //char* str = "0001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF005154F28C46F94B7C9F12474DC4D427F02FB6DC181D9B070B2A0B7F42B80811FA407E6BF76503E7B201912847DF1791EE5D485A3942B2699400F2A6975BC1C95C1C99C09BA5BBA268CF635980DEE0B8D5";

    int rrlen = lstrlenA(str);

    int resultlen = 0;
    for (int i = 0; i < rrlen; i += 2) {
        unsigned char high = str[i] - 0x30;
        unsigned char low = str[i + 1] - 0x30;
        if (high > 9) {
            high -= 7;
        }

        if (low > 9) {
            low -= 7;
        }

        unsigned char v = (high << 4) + low;
        hex[resultlen] = v;
        resultlen++;
    }
    return resultlen;
}


int main(int argc, char **argv)
{
    int tag = 0;

    int ret = 0;

    WSADATA wsa;
    WSAStartup(0x0202, &wsa);

    if(argc < 3) {
        fprintf(stderr, "Usage: %s <KEY_HEXA> <ENC_RSAPUBKEY_HEXA>\n", argv[0]);
        //return 1;
    }
    else {
        if (strlen(argv[1]) != 64) {
            fprintf(stderr, "Key must be 64 (32-bytes) hexa chars string\n");
            return 1;
        }

        if (strlen(argv[2]) != 540) {
            fprintf(stderr, "RSA pubkey must be 540 (270 bytes) hexa chars string\n");
            return 1;
        }

        tag = 1;
    }

    unsigned char cckey[32] =  {
    0x48, 0x8E, 0x32, 0x43, 0x27, 0x08, 0x3F, 0x6F, 0x96, 0xCB, 0xC2, 0x53, 0x85, 0x15, 0x29, 0x5F,
    0xE9, 0x3B, 0x8D, 0xE0, 0x84, 0xAD, 0x45, 0xC8, 0x47, 0x61, 0x95, 0x24, 0x6F, 0xC8, 0x37, 0x1C
    };


    unsigned char rsakey[270] = {
    0xE6, 0x19, 0x43, 0x6A, 0x79, 0x15, 0xA3, 0xAA, 0x7C, 0x8E, 0x86, 0xB6, 0xE2, 0x5F, 0xC2, 0x17,
    0x94, 0x89, 0xC4, 0x3F, 0x5A, 0xFF, 0x0F, 0xC3, 0x4C, 0xC8, 0x24, 0x00, 0x8B, 0x27, 0xAD, 0xF5,
    0x2C, 0x76, 0x09, 0xBF, 0x0C, 0x28, 0x67, 0x8E, 0x82, 0x6E, 0xB8, 0xE5, 0x7A, 0x1E, 0x84, 0x7C,
    0xE8, 0xB2, 0xA8, 0x7C, 0x3E, 0xA8, 0xE1, 0x71, 0x23, 0x4B, 0x40, 0xEA, 0xB1, 0x1F, 0x9A, 0xEB,
    0x7B, 0x5C, 0xA2, 0xA0, 0xB3, 0x01, 0x43, 0xC9, 0x50, 0x81, 0xC1, 0x2C, 0xA9, 0x04, 0xA4, 0x39,
    0xA0, 0xAD, 0x74, 0x25, 0xED, 0xEA, 0x1F, 0x25, 0x7A, 0xE6, 0xCF, 0x67, 0x6E, 0x08, 0xF3, 0xD2,
    0xB9, 0xAB, 0x42, 0x30, 0x8D, 0xE2, 0xA3, 0xA6, 0x59, 0x80, 0xC6, 0x08, 0x0E, 0x95, 0x7D, 0x49,
    0xDE, 0xA3, 0xF1, 0x5C, 0xF2, 0xBB, 0xBD, 0xA7, 0x88, 0x26, 0xF3, 0x57, 0x1D, 0xEB, 0x55, 0xCB,
    0xBF, 0x34, 0xD2, 0x4E, 0x1E, 0xB3, 0x48, 0x52, 0xD1, 0x4D, 0xD2, 0x7B, 0x5C, 0xB2, 0x14, 0x41,
    0x08, 0xC0, 0x60, 0xC8, 0xB5, 0x65, 0x6C, 0x99, 0xBE, 0xF8, 0x82, 0xE6, 0xDE, 0x6A, 0x8D, 0x25,
    0xD3, 0xEC, 0x4A, 0xBE, 0xE7, 0x5A, 0x9F, 0x16, 0x95, 0x40, 0x11, 0x09, 0x43, 0xDC, 0xD5, 0xAE,
    0xCF, 0x1D, 0x0A, 0x4A, 0xE0, 0x45, 0x7F, 0x46, 0x47, 0x63, 0x50, 0xF2, 0x70, 0xA5, 0xC7, 0x1E,
    0x19, 0x08, 0x80, 0x06, 0xE8, 0x97, 0x35, 0x0D, 0x3C, 0x96, 0xC1, 0x61, 0x0B, 0xC0, 0x13, 0x03,
    0x85, 0x65, 0x0F, 0x9C, 0x2A, 0x6D, 0xDC, 0xD6, 0xED, 0x29, 0x97, 0x51, 0xE5, 0x37, 0x5C, 0xC9,
    0x2C, 0x39, 0x6D, 0x9E, 0x58, 0x81, 0x05, 0x2B, 0x5A, 0x7F, 0xB3, 0x47, 0x7D, 0x19, 0x5D, 0xF0,
    0xFA, 0x5B, 0x13, 0xE3, 0xDA, 0x2D, 0x3C, 0x57, 0x57, 0x84, 0x78, 0x6D, 0xD8, 0x1E, 0x57, 0x8E,
    0x53, 0xF5, 0xBC, 0x84, 0xA6, 0x07, 0x22, 0x18, 0xEA, 0x97, 0x27, 0x3B, 0x4F, 0xCD
    };

    
    char g_FirmwareSeed[32] = {0};
    char g_RSA_PubKey[270] = {0};
    char* pos = 0;
    if (tag) {
        pos = argv[1];
        for (size_t i = 0; i < sizeof g_FirmwareSeed; i++) {
            sscanf(pos, "%2hhx", &g_FirmwareSeed[i]);
            pos += 2;
        }
    }
    else {
        pos = cckey;
        memcpy(g_FirmwareSeed, cckey, 32);
    }

    if (tag) {
        pos = argv[2];
        for (size_t i = 0; i < sizeof g_RSA_PubKey; i++) {
            sscanf(pos, "%2hhx", &g_RSA_PubKey[i]);
            pos += 2;
        }
    }
    else {

        pos = rsakey;
        memcpy(g_RSA_PubKey, rsakey,270);
    }

    
    EVP_MD_CTX *mdctx;
    unsigned char *md1 = NULL;
    unsigned char *md2 = NULL;
    
    if((mdctx = EVP_MD_CTX_new()) == NULL)
        return 1;

    if(EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed + 3, 29) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed, 3) != 1)
        return 1;

    if((md1 = (unsigned char *)OPENSSL_malloc(EVP_MD_size(EVP_sha256()))) == NULL)
        return 1;

    if(EVP_DigestFinal_ex(mdctx, md1, NULL) != 1)
        return 1;

    unsigned char outbuf[64];
    //memcpy(outbuf, md1, 32);

    EVP_MD_CTX_free(mdctx);

    printhex(md1, 32);
    printf("\n");

    if((mdctx = EVP_MD_CTX_new()) == NULL)
        return 1;

    if(EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed + 1, 31) != 1)
        return 1;

    if(EVP_DigestUpdate(mdctx, (unsigned char*)g_FirmwareSeed, 1) != 1)
        return 1;

    if((md2 = (unsigned char *)OPENSSL_malloc(EVP_MD_size(EVP_sha256()))) == NULL)
        return 1;

    if(EVP_DigestFinal_ex(mdctx, md2, NULL) != 1)
        return 1;

    EVP_MD_CTX_free(mdctx);

    printhex(md2, 32);
    printf("\n");

    //
    // ChaCha20
    //

    struct chacha20_context ctx;
    chacha20_init_context(&ctx, md1, md2);
    chacha20_xor(&ctx, g_RSA_PubKey, 270);

    printf("BER-encoded pub key:\n");
    printhex(g_RSA_PubKey, 270);
    printf("\n");

    FILE* frsa = fopen("rsa.dat", "wb");
    fwrite(g_RSA_PubKey,270, 1, frsa);
    fclose(frsa);


    char* filename = 0;
    if (tag) {
        filename = argv[4];
    }
    else {
        filename = "rootfs7017.gz";
    }
    FILE* fin = fopen(filename, "rb");
    if (fin == 0) {
        return 0;
    }
    fseek(fin, 0, SEEK_END);
    unsigned long fsize = ftell(fin);
    fseek(fin, 0, SEEK_SET);
    // skip trailing signature
    //fsize -= 256;
    printf("rootfs size: %u\n", fsize);
    unsigned char* data = malloc(fsize + 1024);
    fread(data, fsize, 1, fin);
    fclose(fin);

    unsigned char* md3 = NULL;

    if ((mdctx = EVP_MD_CTX_new()) == NULL)
        return 1;

    if (EVP_DigestInit_ex(mdctx, EVP_sha256(), NULL) != 1)
        return 1;

    if (EVP_DigestUpdate(mdctx, (unsigned char*)data , fsize - 256) != 1)
        return 1;

    if ((md3 = (unsigned char*)OPENSSL_malloc(EVP_MD_size(EVP_sha256()))) == NULL)
        return 1;

    if (EVP_DigestFinal_ex(mdctx, md3, NULL) != 1)
        return 1;

    EVP_MD_CTX_free(mdctx);


    BN_CTX* bnctx = BN_CTX_new(); 
    BIGNUM* bnmod = BN_new();
    bnmod = BN_bin2bn((unsigned char*)g_RSA_PubKey + 8, 257, bnmod);
    BIGNUM* bnexp = BN_new();
    int bexp = ntohl(0x10001);
    bnexp = BN_bin2bn((unsigned char*)&bexp,sizeof(int), bnexp);
    BIGNUM* bnbase = BN_new();
    //bnbase = BN_bin2bn(md3, 32, bnbase);
    unsigned char* binbase = (unsigned char*)data + fsize - 256;
    bnbase = BN_bin2bn(binbase, 256, bnbase);
    BIGNUM* bnresult = BN_new();
    ret = BN_mod_exp(bnresult, bnbase, bnexp, bnmod, bnctx);
    unsigned char binresult[1024];
    int binlen = BN_bn2bin(bnresult, binresult);
    memcpy(data + fsize - 256, binresult, binlen);
    binresult[binlen] = 0;
    char* strresult = *(char**)bnresult;
    int top = *(int*)((char*)bnresult + sizeof(char*));
    int max = *(int*)((char*)bnresult + sizeof(char*) + sizeof(int));
    int flag = *(int*)((char*)bnresult + sizeof(char*) + sizeof(int) + sizeof(int));
    //struct bignum_st {
    //BN_ULONG *d;        /* 指向数据数组的指针（小端序存储） */
    //int top;            /* 已使用的d数组元素个数（有效长度） */
    //int dmax;           /* d数组的总容量 */
    //int neg;            /* 符号标志：1=负数，0=正数 */
    //int flags;          /* 标志位（内存管理、安全控制等） */
    //};

    /*
    char intbuf[1024];
    for (int i= 0; i < 512; i++) {
        intbuf[i] = i;
        int v = intbuf[i];
        if (v == 0) {
            v = 1;
            intbuf[i] = v;
        }       
    }
    BIGNUM* bntest = BN_new();
    bntest = BN_bin2bn(intbuf , 260, bntest);
    */

    char* sig = data + fsize - 256;
    char* aes_init_key = sig + 175;
    char* aes_data = sig + 207;
    unsigned __int64* randomv = (unsigned __int64*)(aes_data + 8);

#ifdef USE_IDA_EXTRACT_CODE
    char aesCtx[0x1000] = { 0 };
    ret = MyAesInit((char*)aesCtx, aes_init_key, 32);
#else
    AES_KEY aeskey = { 0 };
    int ret = AES_set_decrypt_key(aes_init_key, 256, &aeskey);
#endif
    unsigned char * v28 = (char*)aes_data;
    unsigned char v29 = 0;
    for(int i = 0;i < 16;i++)
    {
        v29 ^= (v28[i] & 0xF);
        v29 ^=  ((v28[i] >> 4) & 0xf);

    } 
    if (!v29) {
        v29 = 1;
    }

#define OPENSSL_VERSION_MAJOR

    int block = ( fsize - 256 ) / 16;
    memset(outbuf, 0, 32);
    for (int i = 0; i < block; i++) {

#ifdef USE_IDA_EXTRACT_CODE
        ret = MyAesEncrypt(aesCtx, outbuf, aes_data);
#else
        AES_ecb_encrypt((const unsigned char*)aes_data, (unsigned char*)outbuf , &aeskey, AES_DECRYPT);
#endif
        for (int j = 0; j < 16; j++) {
            data[i * 16 + j] = data[i * 16 + j] ^ outbuf[j];
        }
        unsigned __int64 nk = *randomv ;
        *randomv = nk + v29;
    }
    
    FILE* fout = fopen("rootfs7017_out.gz", "wb");
    fwrite(data, fsize - 256, 1, fout);
    fclose(fout);
    return 0;
}





//error1: big num sequence
//error2: IDA disassembly meaning understanding error or too be lazy?