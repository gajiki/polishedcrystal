	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
.frame1
	db $00 ; bitmask
	db $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $30, $31
.frame2
	db $01 ; bitmask
	db $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d
	db $3e
.frame3
	db $02 ; bitmask
	db $32, $33, $3f, $40, $41, $42, $36, $43, $44, $45, $46, $47
	db $3a, $48, $49, $4a, $4b, $4c, $3e, $4d, $4e, $4f, $50, $51
	db $52
.frame4
	db $03 ; bitmask
	db $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $39
	db $3a, $5e, $5f, $3b, $3c, $60, $3e, $61, $62, $63, $64, $65
	db $66, $67, $68, $69, $6a, $6b
.frame5
	db $04 ; bitmask
	db $32, $33, $6c, $6d, $6e, $34, $35, $6f, $70, $71, $37, $38
	db $39, $3a, $72, $74, $3b, $3c, $3d, $3e, $75, $76, $77, $78
	db $79, $7a, $7b, $7c, $6b