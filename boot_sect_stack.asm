mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

mov al, [0x7ffe] ; 2 away from 0x8000
int 0x10

;cant access this since the top is 0x7ffe now
mov al, [0x8000]
int 0x10

; pops the top and prints C
pop bx
mov al, bl
int 0x10

; pop and print B
pop bx
mov al, bl
int 0x10

; pop and print A
pop bx
mov al, bl
int 0x10

mov al, [0x8000]
int 0x10

jmp $
times 510-($-$$) db 0
dw 0xaa55




