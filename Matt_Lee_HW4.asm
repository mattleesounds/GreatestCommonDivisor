; Matt Lee CS_2450
; Greatest Common Divisor 

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	x SDWORD -10
	y SDWORD -26
	n SDWORD 0

.code
	main PROC
		mov edi, x				
		mov esi, y
		call GCD


	INVOKE ExitProcess,0
	main ENDP

	GCD PROC

		mov ebx, edi			; x value to ebx
		mov ecx, esi			; y value to ecx
		test ebx, 80000000h     ; check if x is negative 
		jne N1					; jump if negative
		afterN1:
			mov eax, ebx			; x to eax 
			test ecx, 80000000h		; check if y is negative			
			jne N2					; jump if negative		
			jmp calculateGCD		;jump to GCD for positive case

		N1:					; if x is negative
			sub ebx, 1				; subtract 2
			not ebx					; invert
			mov x, ebx				; update x value
			jmp afterN1					; Now check y sign

		N2:					; if y is negative
			sub ecx, 1				; subtract 2
			not ecx					; invert
			mov y, ecx				; update y value
			

			
		calculateGCD:
			; int n = x % y
				mov edx, 0
				div ecx				; x/y in first iteration
				mov n, edx			; n is remainder
			; x = y
				mov eax, ecx
			; y = n			
				mov ecx, edx		; mov y value to ecx for division operation
			cmp edx, 0				; compare remainder to 0
			jne calculateGCD		; loop GCD if not 0
		mov ebx, x				; mov x back to ebx
		mov ecx, y				; mov y back to ecx
		ret
	GCD ENDP
END main
