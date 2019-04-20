"SYNTAX for
			A MIND FOREVER VOYAGING
	(c) Copyright 1985 Infocom, Inc.  All Rights Reserved."

<BUZZ A AN THE IS ARE AM AND OF THEN ALL ONE BUT EXCEPT MINUTES MINUTE
      \. \, \" PRY PLEASE HERE SOME MORE G AGAIN OOPS>

<SYNONYM TO TOWARD>
<SYNONYM WITH USING>
<SYNONYM THROUGH THRU>
<SYNONYM ON ONTO>
<SYNONYM OUT OUTSIDE>
<SYNONYM IN INSIDE INTO>
<SYNONYM UNDER BELOW BENEATH UNDERNEATH>
<SYNONYM AROUND ALONG>
<SYNONYM ALL BOTH>

<SYNONYM NORTH N>
<SYNONYM SOUTH S>
<SYNONYM EAST E>
<SYNONYM WEST W>
<SYNONYM DOWN D>
<SYNONYM UP U>
<SYNONYM NW NORTHWEST>
<SYNONYM NE NORTHEAST>
<SYNONYM SW SOUTHWEST>
<SYNONYM SE SOUTHEAST>

;"game commands"

<SYNTAX VERBOSE = V-VERBOSE>

<SYNTAX BRIEF = V-BRIEF>

<SYNTAX SUPER = V-SUPER-BRIEF>
<SYNONYM SUPER SUPERBRIEF>

<SYNTAX DIAGNOSE = V-DIAGNOSE>

<SYNTAX I = V-INVENTORY>
<SYNONYM I INVENTORY>

<SYNTAX QUIT = V-QUIT>
<SYNONYM QUIT Q>

<SYNTAX RESTART = V-RESTART>

<SYNTAX RESTORE = V-RESTORE>

<SYNTAX SAVE = V-SAVE>

;<SYNTAX SCORE = V-SCORE>

<SYNTAX SCRIPT = V-SCRIPT>

<SYNTAX UNSCRIPT = V-UNSCRIPT>

<SYNTAX VERSION = V-VERSION>

<SYNTAX $VERIFY = V-$VERIFY>
<SYNTAX $VERIFY OBJECT = V-$VERIFY>
<SYNONYM $VERIFY $VER>

<SYNTAX $REFRESH = V-$REFRESH>

<SYNTAX \#RANDOM OBJECT = V-$RANDOM>

<SYNTAX \#COMMAND = V-$COMMAND-FILE>

<SYNTAX \#RECORD = V-$RECORD>

<SYNTAX \#UNRECORD = V-$UNRECORD>

;<SYNTAX $BLOT = INK-BLOT>

;<SYNTAX $CHEAT OBJECT = V-$CHEAT>

;<SYNTAX $DATA = V-$DATA>

;<SYNTAX $DEBUG = V-$DEBUG>

;"subtitle real verbs"

<SYNTAX ABORT = V-ABORT>
<SYNTAX ABORT OBJECT = V-ABORT-OBJECT>

;<SYNTAX AGAIN = V-AGAIN>
;<SYNONYM AGAIN G>

<SYNTAX ANSWER = V-ANSWER>
<SYNTAX ANSWER OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-REPLY>
<SYNTAX ANSWER TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-REPLY>
<SYNONYM ANSWER REPLY>

<SYNTAX APPROACH OBJECT = V-WALK-TO>

<SYNTAX ASK OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM) ABOUT OBJECT
	= V-ASK-ABOUT>
<SYNTAX ASK OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM) ON OBJECT
	= V-ASK-ABOUT>
<SYNTAX ASK FOR OBJECT = V-ASK-NO-ONE-FOR>
<SYNTAX ASK OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM) FOR OBJECT
	= V-ASK-FOR>
<SYNONYM ASK CONSULT QUERY QUIZ INQUIRE QUESTION>

<SYNTAX ATTACK OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KILL>
<SYNTAX ATTACK OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (HELD CARRIED HAVE) = V-KILL>
<SYNONYM ATTACK ASSAULT ASSAIL FIGHT HIT SLAP SLAY SCRAG
	 KILL MURDER STRIKE PUNCH>

<SYNTAX BITE OBJECT = V-BITE>

<SYNTAX BOARD OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNONYM BOARD EMBARK>

<SYNTAX BUY OBJECT = V-BUY PRE-BUY>
<SYNTAX BUY OBJECT WITH OBJECT = V-BUY-WITH>
<SYNONYM BUY PURCHASE ORDER PROCURE>

<SYNTAX CALL OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-CALL>
<SYNONYM CALL SUMMON>

<SYNTAX CLIMB OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-FOO>
<SYNTAX CLIMB ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB UP OBJECT (FIND KLUDGEBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX CLIMB DOWN OBJECT (FIND KLUDGEBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX CLIMB OVER OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-OVER>
<SYNTAX CLIMB IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNTAX CLIMB THROUGH OBJECT = V-THROUGH>
<SYNONYM CLIMB MOUNT SCALE ASCEND>

<SYNTAX CLOSE OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-CLOSE>
<SYNTAX CLOSE OFF OBJECT (FIND ONBIT) (ON-GROUND IN-ROOM) = V-OFF>
<SYNTAX CLOSE OFF OBJECT FOR OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX CLOSE OFF OBJECT IN OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX CLOSE OFF OBJECT TO OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX CLOSE OFF OBJECT OBJECT = V-SSHUT-OFF>
<SYNONYM CLOSE SHUT SLAM>

<SYNTAX COMFORT OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-COMFORT>
<SYNONYM COMFORT CONSOLE>

<SYNTAX COUNT OBJECT = V-COUNT>
<SYNONYM COUNT TALLY>

<SYNTAX COVER OBJECT WITH OBJECT (HELD CARRIED MANY) = V-SPUT-ON>

<SYNTAX CROSS OBJECT = V-CROSS>
<SYNONYM CROSS TRAVERSE>

<SYNTAX CRY = V-CRY>
<SYNONYM CRY WEEP SOB BLUBBER BAWL>

<SYNTAX CUT OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<SYNTAX CUT THROUGH OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<SYNONYM CUT SLICE GASH SLASH CLEAVE SEVER>

<SYNTAX DANCE = V-DANCE>

<SYNTAX DATE = V-DATE>

<SYNTAX DEMOLISH OBJECT = V-MUNG>
<SYNTAX DEMOLISH OBJECT WITH OBJECT (HELD CARRIED TAKE) = V-MUNG>
<SYNTAX DEMOLISH DOWN OBJECT = V-MUNG>
<SYNONYM DEMOLISH CRACK DECIMATE ANNIHILATE
	 DESTRO DEVASTATE DAMAGE BREAK SMASH WRECK>

<SYNTAX DESCEND OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>

<SYNTAX DIG IN OBJECT = V-DIG>
<SYNTAX DIG WITH OBJECT = V-DIG>
<SYNTAX DIG THROUGH OBJECT = V-DIG>

<SYNTAX DISEMBARK OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNONYM DISEMBARK DEBARK>

<SYNTAX DRAPE OBJECT IN OBJECT (HELD CARRIED MANY) = V-SPUT-ON>
<SYNTAX DRAPE OBJECT (HELD CARRIED MANY) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX DRAPE OBJECT (HELD CARRIED MANY) AROUND OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX DRAPE OBJECT (HELD CARRIED MANY) OVER OBJECT = V-PUT-ON PRE-PUT>
<SYNONYM DRAPE WRAP>

<SYNTAX DRINK OBJECT (FIND DRINKBIT) (HELD CARRIED ON-GROUND IN-ROOM TAKE)
	= V-DRINK>
<SYNTAX DRINK FROM OBJECT (HELD CARRIED ON-GROUND IN-ROOM TAKE)
	= V-DRINK-FROM>
<SYNONYM DRINK SIP SWALLOW IMBIBE QUAFF GUZZLE SWILL>

<SYNTAX DROP OBJECT (HELD MANY HAVE) = V-DROP PRE-DROP>
<SYNTAX DROP OBJECT (HELD MANY) DOWN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY) ON OBJECT = V-PUT-ON PRE-PUT>

<SYNTAX EAT OBJECT (FIND EATBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-EAT>
<SYNONYM EAT CONSUME DEVOUR INGEST GOBBLE>

<SYNTAX ENTER = V-ENTER>
<SYNTAX ENTER OBJECT = V-THROUGH>

<SYNTAX EXIT = V-EXIT>
<SYNTAX EXIT OBJECT = V-DISEMBARK>
<SYNONYM EXIT SCRAM RETIRE DEPART WITHDRAW>

<SYNTAX EXAMINE OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-EXAMINE ;PRE-READ>
;<SYNTAX EXAMINE OBJECT THROUGH OBJECT = V-EXAMINE-THROUGH PRE-READ>
<SYNTAX EXAMINE IN OBJECT (HELD CARRIED IN-ROOM ON-GROUND) = V-LOOK-INSIDE>
<SYNTAX EXAMINE ON OBJECT (HELD CARRIED IN-ROOM ON-GROUND) = V-LOOK-INSIDE>
<SYNTAX EXAMINE FOR OBJECT = V-FIND>
<SYNONYM EXAMINE SURVEY WATCH VIEW INSPECT DESCRIBE
	 SCRUTINIZE STUDY OBSERVE SEE SCOUR>

<SYNTAX EXHIBIT OBJECT = V-DISPLAY>
<SYNTAX EXHIBIT OBJECT (HELD MANY)
	TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)= V-SHOW>
<SYNTAX EXHIBIT OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM)
	OBJECT (HELD MANY) = V-SSHOW>

<SYNTAX EXTINGUISH OBJECT (FIND ONBIT) (ON-GROUND IN-ROOM) = V-OFF>
<SYNONYM EXTINGUISH DOUSE QUENCH>

<SYNTAX FEED OBJECT = V-FEED>
<SYNTAX FEED OBJECT (HELD CARRIED TAKE)
	TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-GIVE PRE-GIVE>
<SYNTAX FEED OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM)
	OBJECT (HELD CARRIED TAKE) = V-SGIVE>

<SYNTAX FILL OBJECT = V-FILL>

<SYNTAX FIND OBJECT = V-FIND>
<SYNONYM FIND SEEK LOCATE>

<SYNTAX FLUSH OBJECT = V-FLUSH>

<SYNTAX FOLLOW OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-FOLLOW>
<SYNONYM FOLLOW PURSUE CHASE ACCOMPANY>

<SYNTAX HAND OBJECT (MANY HELD HAVE)
	TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-GIVE PRE-GIVE>
<SYNTAX HAND OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM)
	OBJECT (MANY HELD HAVE) = V-SGIVE>
<SYNONYM HAND GIVE SELL DONATE OFFER BESTOW>

<SYNTAX HANG OBJECT (HELD CARRIED TAKE) ON OBJECT (ON-GROUND IN-ROOM)
	= V-HANG>
<SYNTAX HANG OBJECT (HELD CARRIED TAKE) FROM OBJECT (ON-GROUND IN-ROOM)
	= V-HANG>
<SYNTAX HANG OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNONYM HANG DANGLE SUSPEND>

<SYNTAX HEAR = V-LISTEN>
<SYNTAX HEAR OBJECT = V-LISTEN>

<SYNTAX HELLO = V-HELLO>
<SYNTAX HELLO OBJECT = V-HELLO>
<SYNONYM HELLO HI GREETINGS>

<SYNTAX HELP = V-HELP>
<SYNONYM HELP HINT HINTS>

<SYNTAX HIDE = V-HIDE>
<SYNTAX HIDE UNDER OBJECT (ON-GROUND IN-ROOM) = V-HIDE>
<SYNTAX HIDE BEHIND OBJECT (ON-GROUND IN-ROOM) = V-HIDE>

<SYNTAX HOLD OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY) = V-HOLD>
<SYNTAX HOLD ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-HOLD>
<SYNTAX HOLD UP OBJECT = V-ROB>
<SYNONYM HOLD GRASP HUG>

<SYNTAX JUMP = V-LEAP>
<SYNTAX JUMP OVER OBJECT (ON-GROUND IN-ROOM) = V-LEAP>
<SYNTAX JUMP ACROSS OBJECT (ON-GROUND IN-ROOM) = V-LEAP>
<SYNTAX JUMP IN OBJECT = V-THROUGH>
<SYNTAX JUMP FROM OBJECT (ON-GROUND IN-ROOM) = V-LEAP>
<SYNTAX JUMP OFF OBJECT (ON-GROUND IN-ROOM) = V-LEAP>
<SYNTAX JUMP OUT OBJECT = V-THROUGH>
<SYNTAX JUMP THROUGH OBJECT = V-THROUGH>
<SYNONYM JUMP BOUND HURDLE LEAP DIVE VAULT>

<SYNTAX KICK OBJECT = V-KICK>

<SYNTAX KISS OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KISS>
<SYNONYM KISS SMOOCH>

<SYNTAX KNOCK AT OBJECT (FIND DOORBIT) (ON-GROUND IN-ROOM) = V-KNOCK>
<SYNTAX KNOCK ON OBJECT (FIND DOORBIT) (ON-GROUND IN-ROOM) = V-KNOCK>
<SYNTAX KNOCK DOWN OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KILL>
<SYNONYM KNOCK RAP>

<SYNTAX LEAVE = V-LEAVE>
<SYNTAX LEAVE OBJECT = V-LEAVE>

<SYNTAX LIE ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-LIE-DOWN>
<SYNTAX LIE IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-LIE-DOWN>
<SYNTAX LIE DOWN OBJECT (FIND KLUDGEBIT) = V-LIE-DOWN>
<SYNONYM LIE RECLINE REPOSE>

<SYNTAX LIGHT OBJECT (FIND LIGHTBIT) = V-ON>
<SYNONYM LIGHT KINDLE IGNITE>

<SYNTAX LIST OBJECT = V-DISPLAY>
<SYNONYM LIST PRINT>

<SYNTAX LISTEN = V-LISTEN>
<SYNTAX LISTEN TO OBJECT = V-LISTEN>

<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) = V-LOCK>
<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (HELD CARRIED TAKE)
	= V-LOCK>
<SYNONYM LOCK LATCH>

<SYNTAX LOOK = V-LOOK>
<SYNTAX LOOK AROUND OBJECT (FIND KLUDGEBIT) = V-LOOK>
<SYNTAX LOOK DOWN OBJECT (FIND KLUDGEBIT) = V-LOOK-DOWN>
<SYNTAX LOOK UP OBJECT (FIND KLUDGEBIT) = V-LOOK-UP>
<SYNTAX LOOK AT OBJECT = V-EXAMINE ;PRE-READ>
;<SYNTAX LOOK AT OBJECT THROUGH OBJECT (HELD CARRIED TAKE)
	= V-EXAMINE-THROUGH PRE-READ>
<SYNTAX LOOK THROUGH OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK OUT OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK UNDER OBJECT (ON-GROUND IN-ROOM) = V-LOOK-UNDER ;PRE-READ>
<SYNTAX LOOK BEHIND OBJECT (ON-GROUND IN-ROOM) = V-LOOK-BEHIND ;PRE-READ>
<SYNTAX LOOK IN OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK ON OBJECT = V-EXAMINE ;PRE-READ>
<SYNTAX LOOK FOR OBJECT = V-FIND>
<SYNTAX LOOK OBJECT = V-CHASTISE>
<SYNONYM LOOK L STARE GAZE>

<SYNTAX LOWER OBJECT = V-LOWER>

<SYNTAX MACO = V-MACO>

<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) = V-MOVE>
<SYNTAX MOVE OBJECT TO OBJECT = V-SET>
<SYNONYM MOVE DISLOCATE PULL>

<SYNTAX NAP = V-SLEEP>
<SYNTAX NAP IN OBJECT (FIND VEHBIT) (IN-ROOM ON-GROUND) = V-BOARD>
<SYNTAX NAP ON OBJECT (FIND VEHBIT) (IN-ROOM ON-GROUND) = V-BOARD>
<SYNONYM NAP DOZE SNOOZE SLUMBER>

<SYNTAX NO = V-NO>
<SYNONYM NO NEGATIVE NAY>

<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-OPEN>
<SYNTAX OPEN UP	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN>
<SYNTAX OPEN OBJECT ;(FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH OBJECT (ON-GROUND IN-ROOM HELD CARRIED HAVE) = V-OPEN>
<SYNONYM OPEN PART>

<SYNTAX PAY FOR OBJECT = V-PAY-FOR>
<SYNTAX PAY FOR OBJECT WITH OBJECT = V-BUY-WITH>

<SYNTAX PCAF = V-PCAF>

<SYNTAX PEOF = V-PEOF>

<SYNTAX PICK OBJECT = V-PICK>
<SYNTAX PICK OBJECT WITH OBJECT (HELD CARRIED TAKE) = V-PICK>
<SYNTAX PICK UP OBJECT (FIND TAKEBIT) (ON-GROUND MANY) = V-TAKE PRE-TAKE>

<SYNTAX PLAY OBJECT = V-PLAY>
<SYNTAX PLAY WITH OBJECT = V-PLAY-WITH>

<SYNTAX POINT AT OBJECT (ON-GROUND IN-ROOM) = V-POINT>
<SYNTAX POINT TO OBJECT (ON-GROUND IN-ROOM) = V-POINT>

<SYNTAX POUR OBJECT (HELD CARRIED) = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) IN OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) ON OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) OVER OBJECT = V-POUR>
<SYNONYM POUR SPILL SPRINKLE>

<SYNTAX PPCC = V-PPCC>

<SYNTAX PRAY = V-PRAY>

<SYNTAX PUSH OBJECT (ON-GROUND IN-ROOM) = V-PUSH>
<SYNTAX PUSH ON OBJECT (IN-ROOM ON-GROUND) = V-PUSH>
<SYNTAX PUSH OBJECT UNDER OBJECT (ON-GROUND IN-ROOM) = V-PUT-UNDER>
<SYNONYM PUSH PRESS RING SHOVE>

<SYNTAX PUT OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX PUT OBJECT (HELD MANY) DOWN OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT OBJECT (HELD MANY) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT OBJECT (HELD MANY) AROUND OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT OBJECT (HELD MANY) OVER OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT OBJECT (HELD MANY) ACROSS OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT AWAY OBJECT (HELD MANY HAVE) = V-PUT-AWAY>
<SYNTAX PUT DOWN OBJECT (HELD MANY HAVE) = V-DROP PRE-DROP>
<SYNTAX PUT OBJECT UNDER OBJECT (ON-GROUND IN-ROOM) = V-PUT-UNDER> 
<SYNTAX PUT ON OBJECT (FIND WEARBIT) (HELD CARRIED TAKE) = V-WEAR>
<SYNTAX PUT OBJECT BEHIND OBJECT (ON-GROUND IN-ROOM) = V-PUT-BEHIND>
<SYNONYM PUT STUFF INSERT PLACE LAY>

<SYNTAX RAISE OBJECT = V-RAISE>
<SYNTAX RAISE UP OBJECT = V-RAISE>
<SYNONYM RAISE LIFT ELEVATE HOIST>

<SYNTAX RAPE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-RAPE>
<SYNONYM RAPE MOLEST RAVISH>

<SYNTAX RCRO = V-RCRO>

<SYNTAX REACH IN OBJECT (ON-GROUND IN-ROOM) = V-REACH-IN>

<SYNTAX READ OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-READ PRE-READ>
<SYNTAX READ OBJECT ;(FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	THROUGH OBJECT = V-READ PRE-READ>
<SYNTAX READ OBJECT ;(FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH OBJECT = V-READ PRE-READ>
<SYNONYM READ SKIM>

<SYNTAX RECORD = V-RECORD-ON>
<SYNTAX RECORD ON OBJECT (FIND KLUDGEBIT) = V-RECORD-ON>
<SYNTAX RECORD OFF OBJECT (FIND KLUDGEBIT) = V-RECORD-OFF>

<SYNTAX REMOVE OBJECT (FIND WORNBIT) (HELD CARRIED) = V-REMOVE>
<SYNTAX REMOVE OBJECT ;(FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	FROM OBJECT = V-TAKE PRE-TAKE>
<SYNONYM REMOVE DOFF SHED>

<SYNTAX REPORT OBJECT
	TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-REPORT>

<SYNTAX ROB OBJECT = V-ROB>

<SYNTAX ROFF = V-ROFF>

<SYNTAX RON = V-RECORD-ON>

<SYNTAX SAY TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-TELL>
<SYNTAX SAY = V-SAY>
<SYNONYM SAY TALK SPEAK UTTER>

<SYNTAX SEARCH OBJECT = V-SEARCH>
<SYNTAX SEARCH IN OBJECT = V-SEARCH>
<SYNTAX SEARCH FOR OBJECT = V-FIND>
<SYNONYM SEARCH RUMMAGE FRISK RANSACK>

<SYNTAX SET OBJECT TO OBJECT = V-SET>
<SYNTAX SET OBJECT FOR OBJECT = V-SET>
<SYNTAX SET OBJECT AT OBJECT = V-SET>
<SYNONYM SET CHANGE INCREASE DECREASE ALTER>

<SYNTAX SHAKE OBJECT = V-SHAKE>
<SYNTAX SHAKE OBJECT WITH OBJECT = V-SHAKE-WITH>
<SYNONYM SHAKE JIGGLE JOGGLE JOSTLE JAR RATTLE AGITATE ROCK>

<SYNTAX SHOOT OBJECT = V-SHOOT>
<SYNTAX SHOOT OBJECT WITH OBJECT (HAVE) = V-SHOOT>
<SYNTAX SHOOT OBJECT (HAVE) AT OBJECT = V-SSHOOT>
<SYNONYM SHOOT FIRE BLAST DISCHARGE>

<SYNTAX SHOW OBJECT = V-DISPLAY>
<SYNTAX SHOW OBJECT (HELD CARRIED MANY)
	TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-SHOW>
<SYNTAX SHOW OBJECT ;(FIND ACTORBIT) (ON-GROUND IN-ROOM)
	OBJECT (HELD CARRIED MANY) = V-SSHOW>
<SYNONYM SHOW DISPLAY>

<SYNTAX SIT ON OBJECT (FIND FURNITUREBIT) (ON-GROUND IN-ROOM) = V-SIT>
<SYNTAX SIT DOWN OBJECT (FIND KLUDGEBIT) (ON-GROUND IN-ROOM) = V-SIT>
<SYNTAX SIT AT OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNTAX SIT IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNTAX SIT NEXT OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-SIT-NEXT-TO>
<SYNONYM SIT REST SQUAT PERCH>

<SYNTAX SKIP = V-SKIP>
<SYNONYM SKIP HOP CAVORT GAMBOL>

<SYNTAX SLEEP = V-SLEEP>
<SYNTAX SLEEP IN OBJECT (IN-ROOM ON-GROUND) = V-BOARD>
<SYNTAX SLEEP ON OBJECT (IN-ROOM ON-GROUND) = V-BOARD>

<SYNTAX SLIDE OBJECT = V-PUSH>
<SYNTAX SLIDE OBJECT UNDER OBJECT (ON-GROUND IN-ROOM) = V-PUT-UNDER>
<SYNTAX SLIDE OBJECT (HELD CARRIED MANY) THROUGH OBJECT = V-PUT PRE-PUT>

<SYNTAX SMELL = V-SMELL>
<SYNTAX SMELL OBJECT = V-SMELL>
<SYNONYM SMELL SNIFF WHIFF>

<SYNTAX SMILE = V-SMILE>
<SYNTAX SMILE AT OBJECT = V-SMILE>

<SYNTAX SQUEEZE OBJECT = V-SQUEEZE>

<SYNTAX STAND = V-STAND>
<SYNTAX STAND UP OBJECT (FIND KLUDGEBIT) = V-STAND>
<SYNTAX STAND ON OBJECT (ON-GROUND IN-ROOM) = V-STAND-ON>
<SYNTAX STAND IN OBJECT (ON-GROUND IN-ROOM) = V-STAND-ON>
<SYNONYM STAND RISE>

<SYNTAX START OBJECT (FIND LIGHTBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-ON>
<SYNTAX START OBJECT FOR OBJECT (MANY ON-GROUND) = V-TURN-ON>
<SYNTAX START OBJECT IN OBJECT (MANY ON-GROUND) = V-TURN-ON>
<SYNTAX START OBJECT TO OBJECT (MANY ON-GROUND) = V-TURN-ON>
<SYNTAX START OBJECT OBJECT = V-STURN-ON>
<SYNONYM START ACTIVATE BEGIN>

<SYNTAX STATUS = V-STATUS>

<SYNTAX SWIM = V-SWIM>
<SYNTAX SWIM IN OBJECT (ON-GROUND IN-ROOM) = V-SWIM>

<SYNTAX SWITCH OBJECT = V-TURN>
<SYNTAX SWITCH AROUND OBJECT (FIND KLUDGEBIT) = V-TURN>
<SYNTAX SWITCH OBJECT TO OBJECT = V-SET>
<SYNTAX SWITCH OBJECT WITH OBJECT (HAVE) = V-SET>
<SYNTAX SWITCH ON OBJECT (FIND LIGHTBIT) (ON-GROUND IN-ROOM) = V-ON>
<SYNTAX SWITCH ON OBJECT FOR OBJECT (MANY ON-GROUND) = V-TURN-ON>
<SYNTAX SWITCH ON OBJECT IN OBJECT (MANY ON-GROUND) = V-TURN-ON>
<SYNTAX SWITCH ON OBJECT TO OBJECT (MANY ON-GROUND) = V-TURN-ON>
<SYNTAX SWITCH OBJECT ON OBJECT (MANY ON-GROUND)
	= V-TURN-ON> ;"turn heat on in X sector"
<SYNTAX SWITCH ON OBJECT OBJECT = V-STURN-ON>
<SYNTAX SWITCH OFF OBJECT (FIND LIGHTBIT) (ON-GROUND IN-ROOM) = V-OFF>
<SYNTAX SWITCH OFF OBJECT FOR OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX SWITCH OFF OBJECT TO OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX SWITCH OFF OBJECT IN OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX SWITCH OBJECT OFF OBJECT (MANY ON-GROUND) = V-SHUT-OFF>
<SYNTAX SWITCH OFF OBJECT OBJECT = V-SSHUT-OFF>
<SYNONYM SWITCH TURN FLIP FLICK TOGGLE>

<SYNTAX TAKE OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY) = V-TAKE PRE-TAKE>
<SYNTAX TAKE IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNTAX TAKE OUT OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX TAKE ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX TAKE UP OBJECT (FIND KLUDGEBIT) = V-STAND>
<SYNTAX TAKE OBJECT ;(FIND TAKEBIT) (CARRIED IN-ROOM MANY)
	OUT OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT ;(FIND TAKEBIT) (CARRIED IN-ROOM MANY)
	OFF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT ;(FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	FROM OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT ;(FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	ON OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT ;(FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	IN OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OFF OBJECT (FIND WORNBIT) (HELD CARRIED) = V-TAKE-OFF>
<SYNONYM TAKE GRAB SEIZE CATCH GET CARRY OBTAIN>

<SYNTAX TELL OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-TELL>
<SYNTAX TELL OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	ABOUT OBJECT = V-TELL-ABOUT>

<SYNTAX THANK OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-THANK>
<SYNONYM THANK THANKS>

<SYNTAX THROW OBJECT (HELD CARRIED) = V-THROW PRE-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED) UP OBJECT (FIND KLUDGEBIT)
	= V-THROW PRE-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED) AT OBJECT (ON-GROUND IN-ROOM)
	= V-THROW PRE-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED) TO OBJECT (ON-GROUND IN-ROOM)
	= V-THROW PRE-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED) OFF OBJECT = V-THROW-OFF>
<SYNTAX THROW OBJECT (HELD CARRIED) OVER OBJECT = V-THROW-OFF>
<SYNTAX THROW OBJECT (HELD CARRIED) THROUGH OBJECT = V-THROW PRE-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED) IN OBJECT = V-THROW PRE-THROW>
<SYNONYM THROW FLING HEAVE PITCH SLING HURL TOSS>

<SYNTAX TIE OBJECT = V-TIE>
<SYNTAX TIE OBJECT (HELD MANY) AROUND OBJECT = V-PUT-ON PRE-PUT>
<SYNONYM TIE FASTEN SECURE ATTACH HITCH>

<SYNTAX TIME = V-TIME>
<SYNONYM TIME T>

<SYNTAX TOUCH OBJECT = V-TOUCH>
<SYNTAX TOUCH OBJECT WITH OBJECT (HELD CARRIED) = V-TOUCH>
<SYNONYM TOUCH TICKLE FEEL PAT PET RUB CARESS FONDLE STROKE>

<SYNTAX TRANSMIT OBJECT = V-TRANSMIT>
<SYNONYM TRANSMIT SEND BROADCAST>

<SYNTAX UNLOCK OBJECT ;(FIND DOORBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (FIND KEYBIT) (HELD CARRIED HAVE) = V-UNLOCK>

<SYNTAX UNTIE OBJECT (ON-GROUND IN-ROOM HELD CARRIED) = V-UNTIE>
<SYNONYM UNTIE FREE UNFASTEN UNATTACH DETACH UNKNOT>

<SYNTAX WAIT = V-WAIT>
<SYNTAX WAIT OBJECT = V-WAIT-FOR>
<SYNTAX WAIT FOR OBJECT = V-WAIT-FOR>
<SYNTAX WAIT UNTIL OBJECT = V-WAIT-UNTIL>
<SYNONYM WAIT Z STAY LINGER>

<SYNTAX WAKE OBJECT (FIND KLUDGEBIT) = V-ALARM>
<SYNTAX WAKE UP OBJECT (FIND KLUDGEBIT) = V-ALARM>
<SYNONYM WAKE AWAKE AWAKEN ROUSE>

<SYNTAX WALK = V-WALK-AROUND>
<SYNTAX WALK OBJECT = V-WALK>
<SYNTAX WALK IN OBJECT = V-THROUGH>
<SYNTAX WALK OUT OBJECT = V-WALK-OUT>
<SYNTAX WALK ON OBJECT = V-WALK-AROUND>
<SYNTAX WALK OVER OBJECT = V-CROSS>
<SYNTAX WALK ACROSS OBJECT = V-CROSS>
<SYNTAX WALK THROUGH OBJECT = V-THROUGH>
<SYNTAX WALK AROUND OBJECT = V-WALK-AROUND>
<SYNTAX WALK BEHIND OBJECT = V-WALK-AROUND>
<SYNTAX WALK UP OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX WALK DOWN OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX WALK TO OBJECT = V-WALK-TO>
<SYNTAX WALK AWAY OBJECT (FIND KLUDGEBIT) = V-LEAVE>
<SYNTAX WALK UNDER OBJECT = V-WALK-UNDER>
<SYNONYM WALK GO RUN PROCEED STEP TREAD TROOP TRAMP HIKE STRIDE TRUDGE>

<SYNTAX WASH OBJECT = V-WASH>
<SYNTAX WASH UP OBJECT = V-WASH>
<SYNONYM WASH CLEAN LAUNDER>

<SYNTAX WAVE OBJECT (HELD CARRIED) = V-WAVE>
<SYNTAX WAVE = V-WAVE-AT>
<SYNTAX WAVE AT OBJECT = V-WAVE-AT>
<SYNTAX WAVE TO OBJECT = V-WAVE-AT>

<SYNTAX WEAR OBJECT (FIND WEARBIT) (HELD CARRIED TAKE) = V-WEAR>
<SYNONYM WEAR DON>

<SYNTAX WHAT = V-INCOMPLETE-QUESTION>
<SYNTAX WHAT OBJECT = V-WHAT>
<SYNONYM WHAT WHATS WHAT\'S>

<SYNTAX WHERE = V-INCOMPLETE-QUESTION>
<SYNTAX WHERE OBJECT = V-WHERE>
<SYNONYM WHERE WHERES WHERE\'S>

<SYNTAX WHO = V-INCOMPLETE-QUESTION>
<SYNTAX WHO OBJECT = V-WHO>
<SYNONYM WHO WHOS WHO\'S>

<SYNTAX WNNF = V-WNNF>

<SYNTAX WRITE AT OBJECT = V-WRITE>
<SYNTAX WRITE ON OBJECT = V-WRITE>
<SYNONYM WRITE TYPE>

<SYNTAX YELL = V-YELL>
<SYNTAX YELL AT OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-YELL>
<SYNTAX YELL TO OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-YELL>
<SYNONYM YELL SCREAM SHOUT HOWL WHOOP WAIL>

<SYNTAX YES = V-YES>
<SYNONYM YES Y OK OKAY SURE AFFIRMATI AYE YEA YEAH YUP YEP>