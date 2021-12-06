;
;       opV20
;
;	V20 instructions
;
;       For disassembly in 16 bit mode
;
code2seg	segment
farroutine	proc	far
		mov	ax,4c00H
		int	21H	; if this file is executed, just terminate
farroutine	endp	
;
code2seg	ends
;
dataseg		segment
alpha		dw	0
nearindirect	dw	beta
farindirect	dd	farroutine
dataseg	ends
;
codeseg	segment
;
	assume ds:dataseg
	assume es:nothing
	assume ss:nothing
	assume cs:codeseg
;
beta	proc	near
	ret
	ret	3
beta	endp
;
;	ensure disassembler synchronization
;
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
;
;	80186 & V20 instructions
;
	db	62h,0			;bound
	db	0c8h,33h,44h,5		;enter procedure
	db	69h,0,33h,44h		;imul immediate
	db	69h,0c0h,33h,44h	;imul immediate
	db	6bh,0,33h		;imul immediate
	db	6bh,0c0h,33h		;imul immediate
	db	6ch			;ins dx
	db	0f2h,6ch		;ins dx repeated by count in cx
	db	0c9h			;leave procedure
	db	6eh			;outs dx
	db	0f2h,6eh		;outs dx repeated by count in cx
	db	61h			;popa
	db	68h,33h,44h		;push immediate
	db	6ah,33h			;push immediate
	db	60h			;pusha
	db	0c0h,00h,3		;ROL memory by count
	db	0c0h,08h,3		;ROR memory by count
	db	0c0h,10h,3		;RCL memory by count
	db	0c0h,18h,3		;RCR memory by count
	db	0c0h,20h,3		;SHL/SAL memory by count
	db	0c0h,28h,3		;SHR memory by count
	db	0c0h,38h,3		;SAR memory by count
;
	db 90H,90H,90H,90H,90H,90H,90H,90H,90H		; alignment

;
;	V20 unique instructions
;
	db	0fh,20h			;add4s
	db	0fh,12h,0c0h		;clr1 reg8,cl
	db	0fh,12h,000h		;clr1 mem8,cl
	db	0fh,13h,0c0h		;clr1 reg16,cl
	db	0fh,13h,000h		;clr1 mem16,cl
	db	0fh,1ah,0c0h,3		;clr1 reg8,imm3
	db	0fh,1ah,000h,3		;clr1 mem8,imm3
	db	0fh,1bh,0c0h,3		;clr1 reg16,imm4
	db	0fh,1bh,000h,3		;clr1 mem16,imm4
	db	0fh,26h			;cmp4s
	db	0fh,33h,0c0h		;ext bit field
	db	0fh,3bh,0c0h,3		;ext bit field immediate
	db	66h,0c0h		;fp02
	db	66h,000h		;fp02
	db	0fh,31h,0c0h		;insert bit field
	db	0fh,39h,0c0h,3		;insert bit field immediate
	db	0fh,16h,0c0h		;not1 reg8,cl
	db	0fh,16h,000h		;not1 mem8,cl
	db	0fh,17h,0c0h		;not1 reg16,cl
	db	0fh,17h,000h		;not1 mem16,cl
	db	0fh,1eh,0c0h,3		;not1 reg8,imm3
	db	0fh,1eh,000h,3		;not1 mem8,imm3
	db	0fh,1fh,0c0h,3		;not1 reg16,imm4
	db	0fh,1fh,000h,3		;not1 mem16,imm4
	db	65h			;repc
	db	64h			;repnc
	db	0fh,28h,0c0h		;rol4
	db	0fh,28h,000h		;rol4
	db	0fh,2ah,0c0h		;ror4
	db	0fh,2ah,000h		;ror4
	db	0fh,14h,0c0h		;set1 reg8,cl
	db	0fh,14h,000h		;set1 mem8,cl
	db	0fh,15h,0c0h		;set1 reg16,cl
	db	0fh,15h,000h		;set1 mem16,cl
	db	0fh,1ch,0c0h,3		;set1 reg8,imm3
	db	0fh,1ch,000h,3		;set1 mem8,imm3
	db	0fh,1dh,0c0h,3		;set1 reg16,imm4
	db	0fh,1dh,000h,3		;set1 mem16,imm4
	db	0fh,22h			;sub4s
	db	0fh,10h,0c0h		;test1 reg8,cl
	db	0fh,10h,000h		;test1 mem8,cl
	db	0fh,11h,0c0h		;test1 reg16,cl
	db	0fh,11h,000h		;test1 mem16,cl
	db	0fh,18h,0c0h,3		;test1 reg8,imm3
	db	0fh,18h,000h,3		;test1 mem8,imm3
	db	0fh,19h,0c0h,3		;test1 reg16,imm4
	db	0fh,19h,000h,3		;test1 mem16,imm4
;
codeseg	ends
;

	end
