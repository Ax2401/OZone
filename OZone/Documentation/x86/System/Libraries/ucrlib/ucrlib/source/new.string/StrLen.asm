		.386
		option	segment:use16, proc:private

		include	strings.a

		echo	StrLen, StrLenCX, StrLenStk, StrLenStkCX
	

$segStrings	segment	para public 'Strings'
		assume	cs:$segStrings, ds:nothing

; strlen- Computes the length of the string which ES:DI points at.
;
; inputs:
;
;	ES:DI- Points at string to compute the length of.
;
; output:
;
;	AX- Length of string.
;
; StrLenStk-	Like strlen except address of string is on stack
;		rather than in ES:DI
;
; StrLenCX,
; StrLenStkCX-	Like the above routines, except they return the
;		length in CX rather than AX.  Convenient for
;		many calls to strlen.


$strlencx	proc	far
		push	eax

		mov	cx, di
LenLp:		mov	eax, es:[di]
		add	di, 4
		cmp	al, 0
		je	Done0
		cmp	ah, 0
		je	Done1
		test	eax, 0FF0000h
		jz	Done2
		test	eax, 0FF000000h
		jne	LenLp

		xchg	cx, di
		sub	cx, di
		dec	cx
		pop	eax
		ret

Done2:		xchg	cx, di
		sub	cx, di
		sub	cx, 2
		pop	eax
		ret

Done1:		xchg	cx, di
		sub	cx, di
		sub	cx, 3
		pop	eax
		ret

Done0:		xchg	cx, di
		sub	cx, di
		sub	cx, 4
		pop	eax
		ret
$strlenCX	endp




$StrLen		proc	far
		push	cx
		call	$strlencx
		mov	ax, cx
		pop	cx
		ret
$StrLen		endp


$StrLenStk	proc	far
		push	bp
		mov	bp, sp
		push	es
		push	di
		les	di, [bp+6]
		call	$strlen
		pop	di
		pop	es
		pop	bp
		ret	4
$StrLenStk	endp

$StrLenStkcx	proc	far
		push	bp
		mov	bp, sp
		push	es
		push	di
		les	di, [bp+6]
		call	$strlencx
		pop	di
		pop	es
		pop	bp
		ret	4
$StrLenStkcx	endp


$SegStrings	ends
		end
