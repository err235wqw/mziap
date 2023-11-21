.model tiny
.code

org 100h

start:
    mov bx, 5
    mov cx, 20
	mov si, 0
	mas dw 20 dup (?);
	mov cx, 10
	loop4:
		mov ax, 10
		sub ax, cx
		mov si, ax
		mul bx
		mov ax, si
		mov bx, 2
		mul bx
		mov si, ax
		mov mas[si], ax
	loop loop4
	
	mov cx, 10
	loop5:
		mov ax, 10
		sub ax, cx
		mov si, ax
		dec si
		mov bx, 10
		mul bx
		
		mov mas[si], ax
	loop loop5
	
loopm:
    push cx
	mov ax, 11
	sub ax, cx
	mov si, ax
	mov cx, 0
    mov ax, mas[si]
    div bx

loop1:
	mov cx, si
    inc cx
    mov dx, 0
    div bx
    push dx
    cmp ax, 0
    jne loop1
	
    push cx
    mov bx, 5
    sub bx, cx
    mov cx, bx
	
loop3:
    mov dx, 17
    call print
loop loop3

    pop cx
	
loop2:
    pop dx
    call print
loop loop2

    pop cx
	
begin_if:
    cmp cx, 10
    jne end_if
    mov dx, 0Dh
    int 21h
    mov dx, 0Ah
    int 21h
	
end_if:
    pop cx
    mov bx, 20
	sub bx, cx
	mov si, bx
    loop loopm
mov ax, 4h
int 21h
print proc
    mov ah, 02h
    add dl, 30h
    int 21h
    ret
print endp

.data
end start