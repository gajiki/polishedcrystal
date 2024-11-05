	db 110, 120, 100, 110,  30, 100 ; 570 BST
	;   hp  atk  def  spe  sat  sdf

	db FIGHTING, GHOST ; type
	db 45 ; catch rate
	db 189 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for ANNIHILAPE, VITAL_SPIRIT, ANGER_POINT, DEFIANT
else
	abilities_for ANNIHILAPE, DEFIANT, ANGER_POINT, GORILLA_TACTICS
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 3 Atk

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HONE_CLAWS, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, FOCUS_BLAST, DRAIN_PUNCH, ACROBATICS, SHADOW_CLAW, POISON_JAB, GIGA_IMPACT, U_TURN, STONE_EDGE, STRENGTH, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, PAY_DAY, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH
	; end
