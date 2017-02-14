; assignment3.asm - CISC225 Assignment 3 (Fibonacci)
; Don Freiday
; 2/13/2017

INCLUDE Irvine32.inc

ExitProcess proto,dwExitCode:dword

n = 10 ; Size of array (in DWORDs) to fill with Fibonacci numbers

.data
	array DWORD n DUP(0FFFFFFFFh)
	prevVal DWORD 0
	newLine BYTE 13,10,0 ; newline string

.code
main proc
	mov ecx,LENGTHOF array ; ecx = loop counter
	mov edi,OFFSET array ; edi = address of array
			
	mov eax,1
	mov ebx,0

	mov [edi],eax ; first element is 1
	add edi, TYPE array ; edi points to next element
	sub ecx,1 ; one less iteration to account for first element assignment

	L1:
		mov prevVal,eax
		add eax,ebx
		mov [edi],eax
		mov ebx,prevVal
				
		add edi, TYPE array ; edi points to next element
		loop L1;

	; Print array
	mov ecx,LENGTHOF array ; ecx = loop counter
	mov edi,OFFSET array ; edi = address of array
	mov edx,OFFSET newLine ; for Irvine WriteString
	L2:
		mov eax,[edi]
		call WriteInt
		call WriteString ; newline
		add edi, TYPE array
		loop L2

	invoke ExitProcess,0 
main endp
end main