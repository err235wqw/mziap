.model small                 ;������ ������ SMALL ���������� �������� 
                             ;�������� �� ����� 64��
.stack 100h                  ;������� ����� �������� 100h (256 ����)
.data                        ;������ �������� ������
Inform db 'Sinew Vyacheslav 241$'
.code                        ;������ �������� ����
start:                       ;����� ����� � ��������� start 
                             ;���������������� ����� @data ����������
                             ;����� �������� ������ � ������ ������� ���������,
mov AX, @data                ;������� ������� �������� � AX,
mov DS,AX                    ;� ����� ��������� �� AX � DS
mov AH,09h
mov DX,offset Inform
int 21h
mov AX,4C00h
int 21h
end start