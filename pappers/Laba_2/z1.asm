.model tiny
.code
org 100h
start:
    mov dx, offset Mess1
    call Out_string
    mov dx, offset Mess2
    call Out_string

    ; Задание 2.1: Вывод первой цифры (9), пробел, второй цифры (2)
    mov dl, '9'  ; Выводим первую цифру (9)
    call Print_char
    mov dl, ' '  ; Выводим пробел
    call Print_char
    mov dl, '2'  ; Выводим вторую цифру (2)
    call Print_char

    ; Переход на новую строку
    mov dx, offset NewLine
    call Out_string

    ; Задание 2.2: Обмен значений AX и BX и вывод результатов
    mov dl, '2'  ; Выводим первую цифру (2)
    call Print_char
    mov dl, ' '  ; Выводим пробел
    call Print_char
    mov dl, '9'  ; Выводим вторую цифру (9)
    call Print_char

    ; Завершаем программу
    mov ah, 4Ch
    int 21h

Out_string proc
    mov ah, 09h
    int 21h
    ret
Out_string endp

Print_char proc
    mov ah, 02h
    int 21h
    ret
Print_char endp

NewLine db 0Dh, 0Ah, '$'  ; строка с символами перехода на новую строку
Mess1 db 'Sinew Vyacheslav 241:', 0Dh, 0Ah, '$'
Mess2 db 'First digit in AX, seconf in BX:', 0Dh, 0Ah, '$'
end start
