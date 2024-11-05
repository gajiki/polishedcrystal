EcruteakCherishBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 16
	warp_event  4,  7, ECRUTEAK_CITY, 16

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCherishBallHouseGrampsScript, -1
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCherishBallHouseGrannyText, -1

EcruteakCherishBallHouseGrampsScript:
	checkevent EVENT_GOT_DUSK_STONE_FROM_ECRUTEAK
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem DUSK_STONE
	iffalse_endtext
	setevent EVENT_GOT_DUSK_STONE_FROM_ECRUTEAK
	jumpthisopenedtext

.Text2:
	text "I wonder what"
	line "Professor Elm"

	para "learned about"
	line "Quilava and"
	cont "these stones?"
	done

.Text1:
	text "Our Murkrow is"
	line "always bringing us"
	cont "these dark stones."

	para "We think he finds"
	line "them by the towers"
	cont "around the city."

	para "I even gave one"
	line "to Professor"
	cont "Elm last week!"

	para "He told me"
	line "they make some"
	cont "Pokemon evolve."

	para "He was studying"
	line "how it affects"
	cont "Quilava."

	para "Take this one"
	line "our Murkrow found"
	cont "this morning."

	para "I've got too"
	line "many already!"

	done

EcruteakCherishBallHouseGrannyText:
	text "Fashions change"
	line "over the years,"

	para "but Ecruteak re-"
	line "mains as trad-"
	cont "itional as ever."
	done
