GetTrainerEVsDVsAndPersonality:
; Return the EVs, DVs and personality of wOtherTrainerClass in bc
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerClassDVsAndPersonality
rept 6
	add hl, bc
endr

	ld a, [hli]
rept 6
	ld [de], a
	inc de
endr
	ld a, [hli]
	ld [wDVAndPersonalityBuffer], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 1], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 2], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 3], a
	ld a, [wOtherTrainerType]
	bit TRNTYPE_PERSONALITY, a
	ld a, [wCurForm]
	jr nz, .skip_class_gender
	and SPECIESFORM_MASK
	or [hl]
	ld [wCurForm], a
.skip_class_gender
	ld [wDVAndPersonalityBuffer + 4], a
	ret

INCLUDE "data/trainers/dvs.asm"
