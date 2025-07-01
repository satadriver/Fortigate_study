
;extern unk_FFFFFFFF80818024:DQ;
;extern unk_FFFFFFFF80818038:DQ;
;extern unk_FFFFFFFF80818040:DQ;
;extern unk_FFFFFFFF80818048:DQ;



extern dword_FFFFFFFF80816020:DW;
extern dword_FFFFFFFF80816420:DW;
extern dword_FFFFFFFF80816820:DQ;
extern dword_FFFFFFFF80816C20:DQ;




extern dword_FFFFFFFF80817420:DQ;
extern dword_FFFFFFFF80817020:DQ;
extern dword_FFFFFFFF80817820:DQ;
extern dword_FFFFFFFF80817C20:DW;



ExitProcess PROTO

.data
unk_FFFFFFFF80818020 dd 1
unk_FFFFFFFF80818024 dd 2
dd 4 
dd 8
dd 16
dd 32
unk_FFFFFFFF80818038 dd 64,128
unk_FFFFFFFF80818040 dd 27,54
unk_FFFFFFFF80818048 dd 0,0,0,0,0,0



.code 
MyAesInit PROC
        mov rdi,rcx
        mov rsi,rdx
        mov rdx,r8


        
                 mov     rcx, rsi
                 mov     eax, edx
                 and     eax, 0FFFFFFF7h
                 cmp     eax, 10h
                 jz      short loc_FFFFFFFF8037F720
                 cmp     edx, 20h ; ' '
                 jnz     loc_FFFFFFFF8037FB19

 loc_FFFFFFFF8037F720:                   ; CODE XREF: my_aes_init+B¡üj
                 push    r15
                 push    r14
                 push    r13
                 push    r12
                 push    rbp
                 push    rbx
                 mov     [rdi+1E0h], edx
                 mov     ebp, [rcx]
                 mov     [rdi], ebp
                 lea     r11d, [rdx+18h]
                 mov     r9, r11
                 mov     [rdi+r11*4+0F0h], ebp
                 mov     eax, [rcx+4]
                 mov     [rdi+4], eax
                 lea     r10d, [rdx+19h]
                 mov     [rdi+r10*4+0F0h], eax
                 mov     eax, [rcx+8]
                 mov     [rdi+8], eax
                 lea     r8d, [rdx+1Ah]
                 mov     [rdi+r8*4+0F0h], eax
                 mov     eax, [rcx+0Ch]
                 mov     [rdi+0Ch], eax
                 lea     esi, [rdx+1Bh]
                 mov     [rdi+rsi*4+0F0h], eax
                 cmp     edx, 18h
                 jz      loc_FFFFFFFF8037FA7A
                 cmp     edx, 20h ; ' '
                 jz      loc_FFFFFFFF8037F92A
                 cmp     edx, 10h
                 jz      loc_FFFFFFFF8037F87C
                 mov     eax, [rdi+r11*4]
                 mov     [rdi+0F0h], eax
                 mov     eax, [rdi+r10*4]
                 mov     [rdi+0F4h], eax
                 mov     eax, [rdi+r8*4]
                 mov     [rdi+0F8h], eax
                 mov     eax, [rdi+rsi*4]
                 mov     [rdi+0FCh], eax
                 cmp     r11d, 4
                 jbe     loc_FFFFFFFF8037F86F

 loc_FFFFFFFF8037F7C3:                   ; CODE XREF: my_aes_init+21B¡ýj
                 mov     esi, 4

 loc_FFFFFFFF8037F7C8:                   ; CODE XREF: my_aes_init+15F¡ýj
                 mov     r10d, [rdi+rsi*4]
                 mov     edx, r10d
                 shr     edx, 7
                 and     edx, 1010101h
                 lea     eax, [rdx+rdx*2]
                 lea     eax, [rax+rax*8]
                 lea     edx, [r10+r10]
                 and     edx, 0FEFEFEFEh
                 xor     edx, eax
                 mov     ecx, edx
                 shr     ecx, 7
                 and     ecx, 1010101h
                 lea     eax, [rcx+rcx*2]
                 lea     ecx, [rax+rax*8]
                 lea     eax, [rdx+rdx]
                 and     eax, 0FEFEFEFEh
                 xor     eax, ecx
                 mov     ecx, eax
                 shr     ecx, 7
                 and     ecx, 1010101h
                 lea     ecx, [rcx+rcx*2]
                 lea     ecx, [rcx+rcx*8]
                 lea     r11d, [rax+rax]
                 and     r11d, 0FEFEFEFEh
                 xor     r11d, ecx
                 xor     r10d, r11d
                 mov     r8d, esi
                 and     r8d, 3
                 add     r8d, r9d
                 mov     ecx, esi
                 and     ecx, 0FFFFFFFCh
                 sub     r8d, ecx
                 mov     ecx, edx
                 xor     ecx, eax
                 xor     ecx, r11d
                 mov     r11d, r10d
                 rol     r11d, 8
                 xor     ecx, r11d
                 xor     edx, r10d
                 ror     edx, 8
                 xor     edx, ecx
                 xor     eax, r10d
                 rol     eax, 10h
                 xor     eax, edx
                 mov     [rdi+r8*4+0F0h], eax
                 add     rsi, 1
                 cmp     r9d, esi
                 ja      loc_FFFFFFFF8037F7C8

 loc_FFFFFFFF8037F86F:                   ; CODE XREF: my_aes_init+B3¡üj
                 xor     eax, eax
                 pop     rbx
                 pop     rbp
                 pop     r12
                 pop     r13
                 pop     r14
                 pop     r15
                 ret
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037F87C:                   ; CODE XREF: my_aes_init+82¡üj
                 lea     rdx, [rdi+4]
                 mov     rcx, offset unk_FFFFFFFF80818024
                 mov     r15, offset unk_FFFFFFFF80818048
                 mov     r12d, 1
                 jmp     short loc_FFFFFFFF8037F8A0
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037F896:                   ; CODE XREF: my_aes_init+1F2¡ýj
                 mov     r12d, [rcx]
                 mov     ebp, [rdx-4]
                 add     rcx, 4

 loc_FFFFFFFF8037F8A0:                   ; CODE XREF: my_aes_init+18A¡üj
                 ror     eax, 8
                 mov     r13d, eax
                 movzx   eax, al
                 mov     r14d, r13d
                 shr     r14d, 18h
                 mov     eax, dword ptr dword_FFFFFFFF80816020[rax*4]
                 xor     eax, dword ptr dword_FFFFFFFF80816C20[r14*4]
                 mov     ebx, r13d
                 movzx   ebx, bh
                 xor     eax, dword ptr dword_FFFFFFFF80816420[rbx*4]
                 shr     r13d, 10h
                 movzx   r13d, r13b
                 xor     eax, dword ptr dword_FFFFFFFF80816820[r13*4]
                 xor     eax, r12d
                 xor     eax, ebp
                 mov     [rdx+0Ch], eax
                 xor     eax, [rdx]
                 mov     [rdx+10h], eax
                 xor     eax, [rdx+4]
                 mov     [rdx+14h], eax
                 xor     eax, [rdx+8]
                 mov     [rdx+18h], eax
                 add     rdx, 10h
                 cmp     r15, rcx
                 jnz     short loc_FFFFFFFF8037F896

 loc_FFFFFFFF8037F8FE:                   ; CODE XREF: my_aes_init+36B¡ýj
                                         ; my_aes_init+40A¡ýj
                 mov     eax, [rdi+r11*4]
                 mov     [rdi+0F0h], eax
                 mov     eax, [rdi+r10*4]
                 mov     [rdi+0F4h], eax
                 mov     eax, [rdi+r8*4]
                 mov     [rdi+0F8h], eax
                 mov     eax, [rdi+rsi*4]
                 mov     [rdi+0FCh], eax
                 jmp     loc_FFFFFFFF8037F7C3
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037F92A:                   ; CODE XREF: my_aes_init+79¡üj
                 mov     eax, [rcx+10h]
                 mov     [rdi+10h], eax
                 mov     eax, [rcx+14h]
                 mov     [rdi+14h], eax
                 mov     eax, [rcx+18h]
                 mov     [rdi+18h], eax
                 mov     edx, [rcx+1Ch]
                 mov     [rdi+1Ch], edx
                 lea     rcx, [rdi+4]
                 mov     rbx, offset unk_FFFFFFFF80818024
                 mov     r12, offset unk_FFFFFFFF80818038
                 mov     r13d, 1
                 jmp     short loc_FFFFFFFF8037F966
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037F95C:                   ; CODE XREF: my_aes_init+300¡ýj
                 mov     r13d, [rbx]
                 mov     ebp, [rcx-4]
                 add     rbx, 4

 loc_FFFFFFFF8037F966:                   ; CODE XREF: my_aes_init+250¡üj
                 ror     edx, 8
                 movzx   eax, dl
                 mov     r14d, edx
                 shr     r14d, 18h
                 mov     eax, dword ptr dword_FFFFFFFF80816020[rax*4]
                 xor     eax, dword ptr dword_FFFFFFFF80816C20[r14*4]
                 mov     r15d, eax
                 movzx   eax, dh
                 mov     eax, dword ptr dword_FFFFFFFF80816420[rax*4]
                 xor     eax, r15d
                 shr     edx, 10h
                 movzx   edx, dl
                 xor     eax, dword ptr dword_FFFFFFFF80816820[rdx*4]
                 xor     eax, r13d
                 xor     eax, ebp
                 mov     [rcx+1Ch], eax
                 xor     eax, [rcx]
                 mov     [rcx+20h], eax
                 xor     eax, [rcx+4]
                 mov     [rcx+24h], eax
                 xor     eax, [rcx+8]
                 mov     [rcx+28h], eax
                 mov     ebp, eax
                 shr     ebp, 10h
                 movzx   ebp, bpl
                 movzx   edx, al
                 mov     r13d, eax
                 shr     r13d, 18h
                 mov     edx, dword ptr dword_FFFFFFFF80816020[rdx*4]
                 xor     edx, dword ptr dword_FFFFFFFF80816C20[r13*4]
                 xor     edx, [rcx+0Ch]
                 movzx   eax, ah
                 xor     edx, dword ptr dword_FFFFFFFF80816420[rax*4]
                 xor     edx, dword ptr dword_FFFFFFFF80816820[rbp*4]
                 mov     [rcx+2Ch], edx
                 xor     edx, [rcx+10h]
                 mov     [rcx+30h], edx
                 xor     edx, [rcx+14h]
                 mov     [rcx+34h], edx
                 xor     edx, [rcx+18h]
                 mov     [rcx+38h], edx
                 add     rcx, 20h ; ' '
                 cmp     r12, rbx
                 jnz     loc_FFFFFFFF8037F95C
                 ror     edx, 8
                 mov     eax, edx
                 shr     eax, 10h
                 movzx   eax, al
                 mov     eax, dword ptr dword_FFFFFFFF80816820[rax*4]
                 xor     eax, [rdi+0C0h]
                 movzx   ecx, dl
                 xor     eax, dword ptr dword_FFFFFFFF80816020[rcx*4]
                 mov     ecx, edx
                 shr     ecx, 18h
                 xor     eax, dword ptr dword_FFFFFFFF80816C20[rcx*4]
                 movzx   edx, dh
                 xor     eax, dword ptr dword_FFFFFFFF80816420[rdx*4]
                 xor     eax, 40h
                 mov     [rdi+0E0h], eax
                 xor     eax, [rdi+0C4h]
                 mov     [rdi+0E4h], eax
                 xor     eax, [rdi+0C8h]
                 mov     [rdi+0E8h], eax
                 xor     eax, [rdi+0CCh]
                 mov     [rdi+0ECh], eax
                 jmp     loc_FFFFFFFF8037F8FE
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037FA7A:                   ; CODE XREF: my_aes_init+70¡üj
                 mov     eax, [rcx+10h]
                 mov     [rdi+10h], eax
                 mov     eax, [rcx+14h]
                 mov     [rdi+14h], eax
                 lea     rdx, [rdi+4]
                 mov     rcx, offset unk_FFFFFFFF80818024
                 mov     r15, offset unk_FFFFFFFF80818040
                 mov     r12d, 1
                 jmp     short loc_FFFFFFFF8037FAAA
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037FAA0:                   ; CODE XREF: my_aes_init+408¡ýj
                 mov     r12d, [rcx]
                 mov     ebp, [rdx-4]
                 add     rcx, 4

 loc_FFFFFFFF8037FAAA:                   ; CODE XREF: my_aes_init+394¡üj
                 ror     eax, 8
                 mov     r13d, eax
                 movzx   eax, al
                 mov     r14d, r13d
                 shr     r14d, 18h
                 mov     eax, dword ptr dword_FFFFFFFF80816020[rax*4]
                 xor     eax, dword ptr dword_FFFFFFFF80816C20[r14*4]
                 mov     ebx, r13d
                 movzx   ebx, bh
                 xor     eax, dword ptr dword_FFFFFFFF80816420[rbx*4]
                 shr     r13d, 10h
                 movzx   r13d, r13b
                 xor     eax, dword ptr dword_FFFFFFFF80816820[r13*4]
                 xor     eax, r12d
                 xor     eax, ebp
                 mov     [rdx+14h], eax
                 xor     eax, [rdx]
                 mov     [rdx+18h], eax
                 xor     eax, [rdx+4]
                 mov     [rdx+1Ch], eax
                 xor     eax, [rdx+8]
                 mov     [rdx+20h], eax
                 xor     eax, [rdx+0Ch]
                 mov     [rdx+24h], eax
                 xor     eax, [rdx+10h]
                 mov     [rdx+28h], eax
                 add     rdx, 18h
                 cmp     r15, rcx
                 jnz     short loc_FFFFFFFF8037FAA0
                 jmp     loc_FFFFFFFF8037F8FE
 ; ---------------------------------------------------------------------------

 loc_FFFFFFFF8037FB19:                   ; CODE XREF: my_aes_init+10¡üj
                 mov     eax, 0FFFFFFEAh
                 ret


MyAesInit ENDP








MyAesEncrypt proc

        mov rdi,rcx
        mov rsi,rdx
        mov rdx,r8

 mov     r8, rbx
 mov     r9, rbp
 lea     r10, [rdi+30h]
 mov     r11, rsi
 mov     eax, [rdx]
 mov     ebx, [rdx+4]
 mov     ecx, [rdx+8]
 mov     edx, [rdx+0Ch]
 mov     esi, [rdi+1E0h]
 xor     eax, [r10-30h]
 xor     ebx, [r10-2Ch]
 xor     ecx, [r10-28h]
 xor     edx, [r10-24h]
 cmp     esi, 18h
 jb      enc128
 lea     r10, [r10+20h]
 jz      enc192
 lea     r10, [r10+20h]
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10-60h]
 xor     edi, [r10-5Ch]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10-58h]
 xor     edx, [r10-54h]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10-50h]
 xor     edi, [r10-4Ch]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10-48h]
 xor     edx, [r10-44h]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi


enc192:

 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10-40h]
 xor     edi, [r10-3Ch]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10-38h]
 xor     edx, [r10-34h]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10-30h]
 xor     edi, [r10-2Ch]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10-28h]
 xor     edx, [r10-24h]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi


enc128:

 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10-20h]
 xor     edi, [r10-1Ch]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10-18h]
 xor     edx, [r10-14h]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10-10h]
 xor     edi, [r10-0Ch]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10-8]
 xor     edx, [r10-4]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10]
 xor     edi, [r10+4]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+8]
 xor     edx, [r10+0Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+10h]
 xor     edi, [r10+14h]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+18h]
 xor     edx, [r10+1Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+20h]
 xor     edi, [r10+24h]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+28h]
 xor     edx, [r10+2Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+30h]
 xor     edi, [r10+34h]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+38h]
 xor     edx, [r10+3Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+40h]
 xor     edi, [r10+44h]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+48h]
 xor     edx, [r10+4Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+50h]
 xor     edi, [r10+54h]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+58h]
 xor     edx, [r10+5Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80817420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80817020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+60h]
 xor     edi, [r10+64h]
 xor     esi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80817820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80817420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80817020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80817C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80817820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80817420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80817020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80817C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+68h]
 xor     edx, [r10+6Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80817420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80817020[rbx*4]
 mov     eax, esi
 mov     ebx, edi
 movzx   esi, bh
 movzx   edi, bl
 mov     esi, dword ptr dword_FFFFFFFF80816420[rsi*4]
 mov     bx, dx
 mov     edi, dword ptr dword_FFFFFFFF80816020[rdi*4]
 rol     ebx, 10h
 shr     edx, 10h
 movzx   ebp, dh
 movzx   edx, dl
 xor     esi, [r10+70h]
 xor     edi, [r10+74h]
 xor     esi, dword ptr dword_FFFFFFFF80816C20[rbp*4]
 xor     edi, dword ptr dword_FFFFFFFF80816820[rdx*4]
 movzx   ebp, al
 movzx   edx, ah
 mov     edx, dword ptr dword_FFFFFFFF80816420[rdx*4]
 mov     ax, cx
 rol     eax, 10h
 shr     ecx, 10h
 xor     esi, dword ptr dword_FFFFFFFF80816020[rbp*4]
 movzx   ebp, ch
 movzx   ecx, cl
 xor     edx, dword ptr dword_FFFFFFFF80816C20[rbp*4]
 xor     esi, dword ptr dword_FFFFFFFF80816820[rcx*4]
 movzx   ebp, ah
 movzx   ecx, al
 shr     eax, 10h
 xor     edi, dword ptr dword_FFFFFFFF80816C20[rbp*4]
 mov     ecx, dword ptr dword_FFFFFFFF80816820[rcx*4]
 movzx   ebp, ah
 movzx   eax, al
 xor     edi, dword ptr dword_FFFFFFFF80816420[rbp*4]
 xor     ecx, dword ptr dword_FFFFFFFF80816020[rax*4]
 movzx   eax, bh
 movzx   ebp, bl
 shr     ebx, 10h
 xor     ecx, dword ptr dword_FFFFFFFF80816C20[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80816820[rbp*4]
 movzx   eax, bh
 movzx   ebx, bl
 xor     ecx, [r10+78h]
 xor     edx, [r10+7Ch]
 xor     ecx, dword ptr dword_FFFFFFFF80816420[rax*4]
 xor     edx, dword ptr dword_FFFFFFFF80816020[rbx*4]
 mov     rbx, r8
 mov     rbp, r9
 mov     [r11], esi
 mov     [r11+4], edi
 mov     [r11+8], ecx
 mov     [r11+0Ch], edx
 ret



MyAesEncrypt endp





END
