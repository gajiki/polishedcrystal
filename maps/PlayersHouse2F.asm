PlayersHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersHouse2FInitializeRoom
	callback MAPCALLBACK_TILES, PlayersHouse2FSetSpawn

	def_warp_events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePC
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadio
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfElmScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePoster

	def_object_events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsole, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDoll, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL

PlayersHouse2FInitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	endcallback

PlayersHouse2FSetSpawn:
	special ToggleMaptileDecorations
	endcallback

Doll1:
	describedecoration 1

Doll2:
	describedecoration 2

BigDoll:
	describedecoration 3

GameConsole:
	describedecoration 4

PlayersHousePoster:
	dw EVENT_PLAYERS_ROOM_POSTER
	describedecoration 0

PlayersHouseRadio:

if !DEF(DEBUG)

	opentext

	giveitem PP_UP, 99
	giveitem PP_MAX, 99
	giveitem SACRED_ASH, 99
	giveitem ABILITY_CAP, 99
	giveitem LEAF_STONE, 99
	giveitem FIRE_STONE, 99
	giveitem WATER_STONE, 99
	giveitem THUNDERSTONE, 99
	giveitem ICE_STONE, 99
	giveitem MOON_STONE, 99
	giveitem SUN_STONE, 99
	giveitem DUSK_STONE, 99
	giveitem SHINY_STONE, 99
	giveitem ODD_SOUVENIR, 99
	giveitem LINKING_CORD, 99
	giveitem EXP_SHARE, 1
	giveitem MULCH, 99
	giveitem SWEET_HONEY, 99
	giveitem SILVER_LEAF, 99
	giveitem GOLD_LEAF, 99
	giveitem MINT_LEAF, 99
	giveitem BOTTLE_CAP, 99
	giveitem BIG_NUGGET, 99
	giveitem ARMOR_SUIT, 1
	; all decorations except Diploma
for x, EVENT_DECO_BED_1, EVENT_DECO_BIG_LAPRAS_DOLL + 1
	setevent x
endr
	; max money - 999999
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000

	; good party
	givepoke MEWTWO, MEWTWO_ARMORED_FORM, 1, LEFTOVERS
	loadmem wPartyMon1EVs+0, 252
	loadmem wPartyMon1EVs+1, 252
	loadmem wPartyMon1EVs+2, 252
	loadmem wPartyMon1EVs+3, 252
	loadmem wPartyMon1EVs+4, 252
	loadmem wPartyMon1EVs+5, 252
	loadmem wPartyMon1HPAtkDV, $ff
	loadmem wPartyMon1DefSpeDV, $ff
	loadmem wPartyMon1SatSdfDV, $ff
	loadmem wPartyMon1Personality, SHINY_MASK | ABILITY_1 | NAT_SATK_UP_ATK_DOWN

	givepoke MANKEY, PLAIN_FORM, 5, LEFTOVERS
	loadmem wPartyMon2HPAtkDV, $ff
	loadmem wPartyMon2DefSpeDV, $ff
	loadmem wPartyMon2SatSdfDV, $ff
	loadmem wPartyMon2Personality, SHINY_MASK | HIDDEN_ABILITY | NAT_ATK_UP_SATK_DOWN

	closetext
	end

FillPokedex:
	ld hl, wPokedexSeen
	call .Fill
	ld hl, wPokedexCaught
.Fill:
	ld a, %11111111
	ld bc, NUM_UNIQUE_POKEMON / 8
	rst ByteFill
if NUM_UNIQUE_POKEMON % 8
	ld [hl], 2**(NUM_UNIQUE_POKEMON % 8) - 1
endc
	ret

else

	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftruefwd .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftruefwd .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerRadioText1
	pause 45
	writetext PlayerRadioText2
	pause 45
	writetext PlayerRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd radio1

.AbbreviatedRadio:
	opentext
	writetext PlayerRadioText4
	pause 45
	endtext

endc

PokemonJournalProfElmScript:
	setflag ENGINE_READ_PROF_ELM_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "#mon Prof.Elm!"

	para "Prof.Elm was the"
	line "top student of"
	cont "Prof.Oak."

	para "They're said to"
	line "often argue about"
	cont "research."
	done

PlayersHousePC:
	opentext
	special Special_PlayersHousePC
	iftruefwd .Warp
	endtext
.Warp:
	warp NONE, 0, 0
	end

PlayerRadioText1:
	text "Prof.Oak's #mon"
	line "Talk! Please tune"
	cont "in next time!"
	done

PlayerRadioText2:
	text "#mon Channel!"
	done

PlayerRadioText3:
	text "This is DJ Mary,"
	line "your co-host!"
	done

PlayerRadioText4:
	text "#mon!"
	line "#mon Channel…"
	done
