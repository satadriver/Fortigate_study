#pragma once



//windows rcx,rdx,r8,r9
//linux rdi,rsi,rdx,rcx,r8,r9

#define USE_IDA_EXTRACT_CODE

#define USE_OPENSSL_AES_CODE


extern int MyAesEncrypt(char* a1, char* a2, char* a3);

extern int MyAesInit(char* a1, char* a2, __int64 a3);