"PLACES for SEASTALKER
Copyright (C) 1984 Infocom, Inc.  All rights reserved."

"Directions"

<GLOBAL DIR-STRINGS
	<PTABLE  P?NORTH "north" P?SOUTH "south"
		P?EAST "east" P?WEST "west"
		P?NW "northwest" P?NE "northeast"
		P?SW "southwest" P?SE "southeast"
		P?DOWN "downstairs" P?UP "upstairs"
		P?IN "in" P?OUT "out">>

<ROUTINE DIR-PRINT (DIR "OPTIONAL" (THE? T) "AUX" (CNT 0))
	 #DECL ((DIR CNT) FIX)
	 <REPEAT ()
		 <COND (<==? <GET ,DIR-STRINGS .CNT> .DIR>
			<COND (.THE? ;<NOT <EQUAL? .DIR ,P?UP ,P?DOWN>>
			       <TELL "the ">)>
			<PRINT <GET ,DIR-STRINGS <+ .CNT 1>>>
			<RTRUE>)>
		 <SET CNT <+ .CNT 1>>>>

"The usual globals"

<OBJECT ROOMS
	(DESC "that")
	(FLAGS NARTICLEBIT)>

"Kludge"

;<ROOM XXX
	(IN ROOMS)
	(DESC "[X]")
	(FDESC "FROB")
	(SIZE 10)
	(CAPACITY 10)>

<ROUTINE NULL-F ("OPTIONAL" A1 A2)
	<RFALSE>>

<ROUTINE DOOR-ROOM (RM DR "AUX" (P 0) TBL)
	 #DECL ((RM DR) OBJECT (P) FIX)
	 <REPEAT ()
		 <COND (<OR <0? <SET P <NEXTP .RM .P>>>
			    <L? .P ,LOW-DIRECTION>>
			<RFALSE>)
		       (<AND <==? ,DEXIT <PTSIZE <SET TBL <GETPT .RM .P>>>>
			     <==? .DR <GETB .TBL ,DEXITOBJ>>>
			<RETURN <GETB .TBL ,REXIT>>)>>>

<ROUTINE FIND-FLAG (RM FLAG "OPTIONAL" (EXCLUDED <>) "AUX" (O <FIRST? .RM>))
	<REPEAT ()
	 <COND (<NOT .O> <RETURN <>>)
	       (<AND <FSET? .O .FLAG> <NOT <==? .O .EXCLUDED>>>
		<RETURN .O>)
	       (T <SET O <NEXT? .O>>)>>>

<ROUTINE META-LOC (OBJ "AUX" L)
	<SET L <LOC .OBJ>>
	<REPEAT ()
		<COND (<NOT .L>
		       <RFALSE>)
		      (<EQUAL? .L ,LOCAL-GLOBALS ,GLOBAL-OBJECTS>
		       <RETURN .L>)
		      (<IN? .OBJ ,ROOMS>
		       <RETURN .OBJ>)
		      (T
		       <SET OBJ .L>
		       <SET L <LOC .OBJ>>)>>>

<ROUTINE IN-LAB-AREA? (RM)
 <COND (<AND ,SUB-IN-TANK <EQUAL? .RM ,SUB ,CRAWL-SPACE>> <RTRUE>)
       (<EQUAL? .RM ,HALLWAY ,LAB-STORAGE ,OFFICE> <RTRUE>)
       (<IN-LAB? .RM> <RTRUE>)
       (<IN-TANK-AREA? .RM> <RTRUE>)>>

<ROUTINE IN-LAB? (RM)
	<OR <EQUAL? .RM ,NORTH-WALL ,EAST-WALL ,SOUTH-WALL>
	    <EQUAL? .RM ,WEST-WALL ,CENTER-OF-LAB>>>

<ROUTINE IN-TANK-AREA? (RM)
	<EQUAL? .RM ,SOUTH-TANK-AREA ,WEST-TANK-AREA ,NORTH-TANK-AREA>>

<ROUTINE SHARON-PASSES-YOU? (L)
	;"<SET L <META-LOC ,SHARON>>"
	<COND (<EQUAL? ,HERE ,OFFICE>
	       <RTRUE>)
	      (<OR <EQUAL? ,HERE ,HALLWAY>
		   <AND <EQUAL? ,HERE ,LAB-STORAGE>
			<FSET? ,STORAGE-DOOR ,OPENBIT>>>
	       <NOT <EQUAL? .L ,OFFICE>>)
	      (<EQUAL? ,HERE ,LAB-STORAGE>
	       <EQUAL? .L ,LAB-STORAGE>)
	      (<IN-LAB? ,HERE>
	       <NOT <EQUAL? .L ,OFFICE ,HALLWAY ,LAB-STORAGE>>)
	      (<IN-TANK-AREA? ,HERE>
	       <OR <IN-TANK-AREA? .L> <EQUAL? .L ,SUB ,CRAWL-SPACE>>)
	      (<EQUAL? ,HERE ,SUB>
	       <EQUAL? .L ,SUB ,CRAWL-SPACE>)
	      (T <EQUAL? .L ,CRAWL-SPACE>)>>

;<ROUTINE OUTSIDE? (RM) <RFALSE>>
	"<EQUAL? .RM ,GROUNDS>"

"The Research Lab"

<ROUTINE RESEARCH-LAB () <TELL " the "LN" Research Lab">>

[
<ROOM NORTH-WALL
	(IN ROOMS)
	(DESC "north part")
	(ADJECTIVE NORTH)
	(SYNONYM PART SECTION AREA ROOM)
	(FLAGS RLANDBIT ONBIT)
	(EAST	TO EAST-WALL)
	(WEST	TO WEST-WALL)
	;(NORTH	TO GROUNDS IF NORTH-DOORWAY IS OPEN)
	;(OUT	TO GROUNDS IF NORTH-DOORWAY IS OPEN)
	(SOUTH	TO CENTER-OF-LAB)
	(GLOBAL ;NORTH-DOORWAY TEST-BUTTON ALARM)
	(CORRIDOR %<+ 32 4 2>)
	;(LINE 1)
	;(STATION EAST-WALL)
	(ACTION NORTH-WALL-F)>

<ROUTINE NORTH-WALL-F ("OPTIONAL" (RARG <>))
 <COND (<==? .RARG ,M-LOOK>
	<TELL
"You're in the " D ,NORTH-WALL " of " D ,YOUR-LABORATORY ". A " D
,COMPUTESTOR " stands here to help test your inventions." CR>)
       (<AND <==? .RARG ,M-ENTER> <VIDEOPHONE-WORKING>>
	<RTRUE>)>>

<OBJECT COMPUTESTOR
	(IN NORTH-WALL)
	(SYNONYM COMPUTESTOR TESTOR TESTER)
	(DESC "Computestor")
	(ACTION COMPUTESTOR-F)
	(TEXT "(You'll find that information in your SEASTALKER package.)")
	(FLAGS NDESCBIT ON?BIT)>

<ROUTINE COMPUTESTOR-F ()
 <COND (<VERB? TAKE WALK-TO LOOK-BEHIND LOOK-INSIDE LOOK-ON LOOK-UNDER>
	<RFALSE>)
       (<VERB? EXAMINE>
	<TELL "The " D ,COMPUTESTOR " is o"
	      <COND (<FSET? ,COMPUTESTOR ,ONBIT> "n") (T "ff")>
	      "." CR>)
       ;(<OR <VERB? FIND>
	    <AND <VERB? SHOW TELL-ABOUT> <DOBJ? PLAYER>>>
	<TELL
"The " D ,COMPUTESTOR " is located in the north part of " D ,YOUR-LABORATORY
". For more information, look in your Logbook." CR>)
       (<VERB? LAMP-ON>
	<COND (<NOT <FSET? ,COMPUTESTOR ,ONBIT>>
	       <FSET ,COMPUTESTOR ,ONBIT>
	       <TELL "The " D ,COMPUTESTOR " is ready for questions." CR>)>)
       (<AND <REMOTE-VERB?>
	     <OR <NOT <VERB? ASK-ABOUT>>
		 <NOT <DOBJ? COMPUTESTOR>>>>
	<RFALSE>)
       (<NOT <FSET? ,COMPUTESTOR ,ONBIT>>
	<TELL "The " D ,COMPUTESTOR " is off!" CR>)
       ;(<VERB? TELL>
	<TELL
"Ask the " D ,COMPUTESTOR " about something specific." CR>)
       (<VERB? ASK USE>
	<COND (<FSET? ,VIDEOPHONE ,MUNGBIT>
	       <PERFORM ,V?ASK-ABOUT ,COMPUTESTOR ,VIDEOPHONE>
	       <RTRUE>)
	      (<NOT <IN? ,CATALYST-CAPSULE ,REACTOR>>
	       <PERFORM ,V?ASK-ABOUT ,COMPUTESTOR ,GLOBAL-SUB>
	       <RTRUE>)
	      (T <RFALSE>)>)
       (<AND <VERB? ASK-ABOUT> <DOBJ? COMPUTESTOR>>
	<COND (<AND <IOBJ? CIRCUIT-BREAKER> <FSET? ,CIRCUIT-BREAKER ,OPENBIT>>
	       <TELL "\"A " D ,CIRCUIT-BREAKER " is open.\"" CR>)
	      (<AND <IOBJ? VIDEOPHONE> <FSET? ,VIDEOPHONE ,MUNGBIT>>
	       <SETG TIP-SAYS-1 32 ;4>
	       <SETG TIP-SAYS-2 ,VIDEOPHONE>
	       <ENABLE <QUEUE I-TIP-SAYS 3>>
	       <TELL
"\"Symptoms: no picture, no sound.|
Possible causes:|
1) Failure of the " D ,VIDEOPHONE-TRANSMITTER " at source.|
2) A short in the " D ,VIDEOPHONE-CABLE " linking " D ,VIDEOPHONE-TRANSMITTER
" to">
	       <RESEARCH-LAB>
	       <TELL
", if signal is coming from " D ,AQUADOME ".|
3) Sunspot interference or " D ,VIDEOPHONE-SATELLITE " malfunction if "
D ,VIDEOPHONE-TRANSMITTER " is at earth's surface.|
4) Failure of the video receiver.|
5) Overload in the " D ,ELECTRICAL-CONTROL-PANEL " (" D ,CIRCUIT-BREAKER
" popped).|
6) Sabotage (" D ,CIRCUIT-BREAKER " open).\"" CR>)
	      (<AND <IOBJ? VIDEOPHONE-TRANSMITTER>
		    <FSET? ,VIDEOPHONE ,MUNGBIT>>
	       <TELL
"Impossible. It's located " D ,UNDERWATER " at the " D ,AQUADOME ",
beyond your control. Right now you have no communication with the " D
,AQUADOME "." CR>)
	      (<IOBJ? VIDEOPHONE-CABLE>
	       <TELL "This can be done only by submarine." CR>)
	      (<IOBJ? VIDEOPHONE-SATELLITE>
	       <TELL
"You're goofing off, " FN ". Video signals from the " D ,AQUADOME " to">
	       <RESEARCH-LAB>
	       <TELL
" are NOT relayed by a space " D ,VIDEOPHONE-SATELLITE "." CR>)
	      (<IOBJ? VIDEOPHONE-RECEIVER>
	       <TELL
"You can do this by pushing the " D ,TEST-BUTTON " on the " D
,VIDEOPHONE "." CR>)
	      (<AND <IOBJ? GLOBAL-SUB REACTOR>
		    <NOT <IN? ,CATALYST-CAPSULE ,REACTOR>>>
	       <TELL
"\"Symptom: " D ,ENGINE " won't start.|
Possible causes:|
1) The " D ,CATALYST-CAPSULE " is not inserted in the " D ,REACTOR ".|
2) The " D ,REACTOR " is not turned on.|
3) The " D ,TEST-TANK " is not filled.\"" CR>)
	      (T <TELL
"\"This device is designed only to troubleshoot operating problems.\"|
(Maybe you can find information about" THE-PRSI " in your SEASTALKER
package.)" CR>)>)>>

<OBJECT VIDEOPHONE-RECEIVER
	(IN NORTH-WALL)
	(ADJECTIVE VIDEO)
	(SYNONYM RECEIVER)
	(DESC "receiver")
	(FLAGS NDESCBIT)
	(ACTION VIDEOPHONE-TEST-F)>

<ROUTINE VIDEOPHONE-TEST-F ()
 <COND (<VERB? ANALYZE>
	<PERFORM ,V?ASK-ABOUT ,COMPUTESTOR ,PRSO>
	<RTRUE>)>>
][
<ROOM EAST-WALL
	(IN ROOMS)
	(DESC "east part")
	(ADJECTIVE EAST)
	(SYNONYM PART SECTION AREA ROOM)
	(FLAGS VOWELBIT RLANDBIT ONBIT)
	(NORTH	TO NORTH-WALL)
	(SOUTH	TO SOUTH-WALL)
	(EAST	TO HALLWAY IF EAST-DOORWAY IS OPEN)
	(OUT	TO HALLWAY IF EAST-DOORWAY IS OPEN)
	(WEST	TO CENTER-OF-LAB)
	(GLOBAL EAST-DOORWAY ;TELEPHONE INTERCOM CONTROLS
		VIDEOPHONE TEST-BUTTON ALARM)
	(CORRIDOR %<+ 8 2 1>)
	(ACTION EAST-WALL-F)
	;(LINE 1)
	;(STATION EAST-WALL)>

<ROUTINE EAST-WALL-F ("OPTIONAL" (RARG <>))
 <COND (<==? .RARG ,M-LOOK>
	<TELL
"You're in the " D ,EAST-WALL " of " D ,YOUR-LABORATORY ". A doorway
leads out through a " D ,HALLWAY " to the office of your " D
,LAB-ASSISTANT ", " D ,GLOBAL-SHARON ". A " D
,MICROWAVE-SECURITY-SCANNER " stands against the wall. An " D ,INTERCOM " sits
on the " D ,DESK "." CR>)
       (<AND <==? .RARG ,M-ENTER> <VIDEOPHONE-WORKING>>
	<RTRUE>)>>

<ROUTINE VIDEOPHONE-WORKING ()
 <COND (<AND ,BREAKER-JUST-FIXED
	     <NOT <FSET? ,CIRCUIT-BREAKER ,OPENBIT>>>
	<SETG BREAKER-JUST-FIXED <>>
	<TELL "As you re-enter the lab, ">
	<TIP-SAYS>
	<TELL
"Look, " FN "! The " D ,VIDEOPHONE
"'s working again! There's a normal test pattern on the screen!\"" CR>)>>

<OBJECT MICROWAVE-SECURITY-SCANNER
	(IN EAST-WALL)
	(ADJECTIVE MICROWAVE SECURITY)
	(SYNONYM SCANNER)
	(DESC "Microwave Security Scanner")
	(TEXT "(You'll find that information in your SEASTALKER package.)")
	(FLAGS NDESCBIT)
	(ACTION MICROWAVE-SECURITY-SCANNER-F)>

<ROUTINE MICROWAVE-SECURITY-SCANNER-F ()
 <COND ;(<OR <VERB? FIND>
	    <AND <VERB? SHOW TELL-ABOUT> <DOBJ? PLAYER>>>
	<TELL
"The " D ,MICROWAVE-SECURITY-SCANNER " is located in the east part of "
D ,YOUR-LABORATORY ".
For more information, look in your Logbook." CR>)
       (<VERB? LAMP-ON>
	<TELL
"No beep occurs. Scanner displays: \"NO INTRUDER PRESENT ON GROUNDS.\"" CR>)>>

<OBJECT DESK
	(IN EAST-WALL)
	(ADJECTIVE MY ;YOUR LAB LABORATORY)
	(SYNONYM DESK)
	(DESC "lab desk")
	(FLAGS CONTBIT SEARCHBIT SURFACEBIT OPENBIT NDESCBIT)
	(CAPACITY 33)
	(GENERIC GENERIC-DESK-F)
	(ACTION DESK-F)>

<ROUTINE DESK-F () <COMMON-DESK-F ,DESK>>

<ROUTINE COMMON-DESK-F (OBJ)
 <COND (<VERB? OPEN> <TELL "It has no drawers." CR>)
       (<AND <VERB? EXAMINE LOOK-INSIDE LOOK-ON> <EQUAL? ,PRSO .OBJ>>
	<TELL "An " D ,INTERCOM " is on the desk">
	<COND (<FIRST? .OBJ>
	       <TELL ", as well as ">
	       <PRINT-CONTENTS .OBJ>)>
	<TELL "." CR>)>>

<ROUTINE GENERIC-DESK-F (OBJ)
 <COND (<IN-LAB? ,HERE> ,DESK)
       (<EQUAL? ,HERE ,OFFICE> ,KEMP-DESK)
       (,SUB-IN-DOME ,BLY-DESK)>>
]
<OBJECT EAST-DOORWAY
	(ADJECTIVE LAB LABORATORY ;EAST SLIDING)
	(SYNONYM DOOR DOORWAY)
	(DESC "lab door" ;"way")
	(IN LOCAL-GLOBALS)
	(FLAGS VOWELBIT DOORBIT OPENBIT)>
[
<ROOM HALLWAY
	(IN ROOMS)
	(DESC "corridor")
	(SYNONYM CORRIDOR HALL HALLWAY)
	(FLAGS RLANDBIT ONBIT)
	(EAST	TO OFFICE)
	(WEST	TO EAST-WALL IF EAST-DOORWAY IS OPEN)
	(SOUTH	TO LAB-STORAGE IF STORAGE-DOOR IS OPEN)
	(GLOBAL EAST-DOORWAY STORAGE-DOOR CONTROLS)
	(ACTION HALLWAY-F)
	;(LINE 1)
	;(STATION HALLWAY)>

<ROUTINE HALLWAY-F ("OPTIONAL" (RARG <>))
 <COND (<==? .RARG ,M-LOOK>
	<TELL
"You're in a " D ,HALLWAY ", with " D ,YOUR-LABORATORY " to the west, a
" D ,LAB-STORAGE " to the south, and " D ,OFFICE " to the east. An "
D ,ELECTRICAL-CONTROL-PANEL " fills most of the north wall." CR>)
       (<==? .RARG ,M-ENTER>
	<COND (<FSET? ,CIRCUIT-BREAKER ,MUNGBIT>
	       ;<FCLEAR ,CIRCUIT-BREAKER ,NDESCBIT>
	       ;<THIS-IS-IT ,CIRCUIT-BREAKER>
	       <TELL-HINT 31 ;3 ,ELECTRICAL-CONTROL-PANEL <>>)>)>>

<OBJECT ELECTRICAL-CONTROL-PANEL
	(IN HALLWAY)
	(ADJECTIVE	ELECTR ;POWER SUPPLY)
	(SYNONYM	SUPPLY PANEL)
	(DESC "Electrical Panel" ;" Power")
	(FLAGS VOWELBIT ONBIT NDESCBIT)
	(TEXT "(You'll find that information in your SEASTALKER package.)")
	(ACTION ELECTRICAL-CONTROL-PANEL-F)>

<ROUTINE ELECTRICAL-CONTROL-PANEL-F ()
	<COND (<AND <VERB? ANALYZE EXAMINE> <FSET? ,CIRCUIT-BREAKER ,OPENBIT>>
	       <THIS-IS-IT ,CIRCUIT-BREAKER>
	       <TELL
"A " D ,CIRCUIT-BREAKER ;" has popped open" " on the " D
,ELECTRICAL-CONTROL-PANEL " is open. This " D ,CIRCUIT-BREAKER" controls the "
D ,POWER-SUPPLY " to the " D ,VIDEOPHONE " and other equipment in the
private " D ,VIDEOPHONE " network." CR>
	       <COND (<IN? ,TIP ,HERE>
		      <TIP-SAYS>
		      <TELL
"How did that happen? You didn't overload the circuit.\"" CR>)>
	       <RTRUE>)
	      (<VERB? OPEN>
	       <TELL
"You don't need to open the " D ,ELECTRICAL-CONTROL-PANEL "." CR>)>>

<GLOBAL BREAKER-JUST-FIXED <>>
<OBJECT CIRCUIT-BREAKER
	(IN HALLWAY)
	(ADJECTIVE THIS CIRCUIT OPEN)
	(SYNONYM BREAKER CIRCUIT SWITCH)
	(DESC "circuit breaker")
	;(FDESC
"A circuit breaker is open on the Electrical Panel.")
	(FLAGS CONTBIT NDESCBIT TOUCHBIT)
	(CAPACITY 0)
	(TEXT "(You'll find that information in your SEASTALKER package.)")
	(VALUE 3)
	(ACTION CIRCUIT-BREAKER-F)>

<ROUTINE CIRCUIT-BREAKER-F ("AUX" V)
 <COND (<AND <VERB? ANALYZE EXAMINE> <FSET? ,PRSO ,OPENBIT>>
	<TELL-HINT 31 ,ELECTRICAL-CONTROL-PANEL <>>)
       (<VERB? CLOSE PUSH FIX MOVE TURN LAMP-ON>
	<COND (<FSET? ,PRSO ,OPENBIT>
	       <FSET ,PRSO ,NDESCBIT>
	       <OKAY ,CIRCUIT-BREAKER "closed">
	       <COND (<FSET? ,PRSO ,MUNGBIT>
		      <SETG BREAKER-JUST-FIXED T>
		      <FCLEAR ,PRSO ,MUNGBIT>
		      <FCLEAR ,VIDEOPHONE ,MUNGBIT>
		      <FSET ,VIDEOPHONE ,ONBIT>
		      <SCORE-OBJ ,CIRCUIT-BREAKER>)>
	       <RTRUE>)
	      (T <ALREADY ,CIRCUIT-BREAKER "closed">)>)
       (<VERB? OPEN LAMP-OFF>
	<COND (<FSET? ,PRSO ,OPENBIT> <ALREADY ,CIRCUIT-BREAKER "open">)
	      (T
	       <TELL "You shouldn't do that." CR>)>)>>
]
<ROOM LAB-STORAGE
	(IN ROOMS)
	(DESC "storage closet")
	(ADJECTIVE STORAGE SUPPLY)
	(SYNONYM CLOSET ROOM AREA)
	(FLAGS RLANDBIT ONBIT)
	(LDESC
"There's so much junk in here that there's barely enough room for you.")
	(NORTH	TO HALLWAY IF STORAGE-DOOR IS OPEN)
	(OUT	TO HALLWAY IF STORAGE-DOOR IS OPEN)
	(PSEUDO "JUNK" RANDOM-PSEUDO)
	(GLOBAL STORAGE-DOOR)
	(GENERIC GENERIC-STORAGE-ROOM-F)>

<ROUTINE GENERIC-STORAGE-ROOM-F (OBJ)
	<COND (,SUB-IN-DOME ,DOME-STORAGE)
	      (,SUB-IN-TANK ,LAB-STORAGE)
	      ;(<EQUAL? ,HERE ,SUB ,CRAWL-SPACE> ,NOT-HERE-OBJECT)>>

<OBJECT STORAGE-DOOR
	(ADJECTIVE STORAGE SUPPLY ROOM CLOSET)
	(SYNONYM DOOR DOORWAY)
	(DESC "storage door")
	(IN LOCAL-GLOBALS)
	(FLAGS DOORBIT ;OPENBIT)>
[
<ROOM OFFICE
	(IN ROOMS)
	(DESC "Kemp's office")
	(ADJECTIVE SHARON KEMP\'S)
	(SYNONYM OFFICE)
	(FLAGS VOWELBIT RLANDBIT ONBIT NARTICLEBIT)
	(WEST	TO HALLWAY)
	(NORTH	TO LIMBO IF OFFICE-DOOR IS OPEN)
	(GLOBAL ;TELEPHONE CHAIR INTERCOM)
	(GENERIC GENERIC-OFFICE-F)
	(ACTION OFFICE-F)
	;(LINE 1)
	;(STATION OFFICE)>

<ROUTINE GENERIC-OFFICE-F (OBJ)
	<COND (,SUB-IN-DOME ,BLY-OFFICE)
	      (,SUB-IN-TANK ,OFFICE)
	      ;(<EQUAL? ,HERE ,SUB ,CRAWL-SPACE> ,NOT-HERE-OBJECT)>>	

<ROUTINE OFFICE-F ("OPTIONAL" (ARG <>))
 <COND (<==? .ARG ,M-LOOK>
	<TELL
"You're in the office of your " D ,LAB-ASSISTANT ", " D ,GLOBAL-SHARON
". There is a desk and chair here, and the " D ,OFFICE-DOOR " leading
out to the parking lot. To the west, a " D ,HALLWAY " leads back to " D
,YOUR-LABORATORY "." CR>)
       (<AND <IN? ,SHARON ,OFFICE> <==? .ARG ,M-BEG> <EXIT-VERB?>>
	<FSET ,SHARON ,NDESCBIT>
	<FSET ,FILE-DRAWER ,NDESCBIT>
	<FSET ,PAPERS ,NDESCBIT>
	<RFALSE>)
       (<==? .ARG ,M-ENTER>
	<FCLEAR ,SHARON ,NDESCBIT>
	<FCLEAR ,FILE-DRAWER ,NDESCBIT>
	<FCLEAR ,PAPERS ,NDESCBIT>
	<COND (<IN? ,SHARON ,OFFICE>
	       <THIS-IS-IT ,SHARON>
	       <THIS-IS-IT ,FILE-DRAWER>
	       <TELL
"As you enter, Sharon is hastily going through the contents of an open
" D ,FILE-DRAWER ". She turns with a startled expression as you
appear in the doorway. Her face is flushed and her manner seems
slightly emotional." CR>)>)>>

<OBJECT OFFICE-DOOR
	(ADJECTIVE OFFICE SHARON KEMP\'S)
	(SYNONYM DOOR DOORWAY)
	(DESC "office door")
	(IN OFFICE)
	(FLAGS DOORBIT NDESCBIT VOWELBIT)
	(ACTION OFFICE-DOOR-F)>

<ROUTINE OFFICE-DOOR-F ()
 <COND (<VERB? OPEN>
	<TELL "There's nothing outside to help your mission!" CR>)>>

<OBJECT FILE-DRAWER
	(IN OFFICE)
	(ADJECTIVE FILE SHARON KEMP\'S)
	(SYNONYM DRAWER FILE FILES CABINET)
	(DESC "file drawer")
	(FLAGS CONTBIT SEARCHBIT OPENBIT NDESCBIT)
	(CAPACITY 33)
	(ACTION PAPERS-F)>

<OBJECT PAPERS
	(IN FILE-DRAWER)
	(DESC "lot of business papers")
	(FDESC "The file drawer is filled with a lot of business papers.")
	(ADJECTIVE BUSINESS OFFICE SHARON KEMP\'S)
	(SYNONYM LOT PAPERS PAPER)
	(FLAGS TRYTAKEBIT READBIT ;BURNBIT NDESCBIT)
	(ACTION PAPERS-F)>

<ROUTINE PAPERS-F ("AUX" X)
 <COND (<AND <VERB? LOOK-UP> <IOBJ? FILE-DRAWER PAPERS>>
	<COND (<FSET? ,PRSO ,PERSON>
	       <TELL <GETP ,LOCAL-SUB ,P?TEXT> CR>)
	      (T <TELL
"There's no information in the drawer about that.">)>
	<CRLF>)
       (<AND <VERB? CLOSE> <IN? ,SHARON ,OFFICE>>
	<TELL
"Sharon stops you from closing it. \"Hey, " FN "! I can't do my job here
if you interfere!\"" CR>)
       (<VERB? ;BURN EXAMINE LOOK-INSIDE READ TAKE SEARCH SEARCH-FOR>
	<COND (<NOT <FSET? ,FILE-DRAWER ,OPENBIT>>
	       <TOO-BAD-BUT ,FILE-DRAWER "closed">
	       <RTRUE>)>
	<FSET ,PAPERS ,TOUCHBIT>
	<TELL "You look ">
	<COND (<==? ,P-ADVERB ,W?CAREFULLY>
	       <TELL "more thoroughly through the drawer and still">)
	      (T <TELL "quickly through the drawer but">)>
	<TELL
" find nothing suspicious, so you decide to leave the papers alone." CR>)>>

<OBJECT KEMP-DESK
	(IN OFFICE)
	(ADJECTIVE SHARON KEMP\'S)
	(SYNONYM DESK)
	(DESC "Kemp's desk")
	(FLAGS CONTBIT SEARCHBIT SURFACEBIT OPENBIT NDESCBIT NARTICLEBIT)
	(CAPACITY 33)
	(GENERIC GENERIC-DESK-F)
	(ACTION KEMP-DESK-F)>

<ROUTINE KEMP-DESK-F () <COMMON-DESK-F ,KEMP-DESK>>

]
<ROOM LIMBO
	(IN ROOMS)
	(DESC "limbo")
	(FLAGS RLANDBIT ONBIT)
	(WEST	TO OFFICE)
	;(LINE 1)
	;(STATION OFFICE)>
[
<ROOM SOUTH-WALL
	(IN ROOMS)
	(DESC "south part")
	(ADJECTIVE SOUTH)
	(SYNONYM PART SECTION AREA ROOM)
	(FLAGS RLANDBIT ONBIT)
	(EAST	TO EAST-WALL)
	(WEST	TO WEST-WALL)
	(SOUTH	TO NORTH-TANK-AREA IF SOUTH-DOORWAY IS OPEN)
	(OUT	TO NORTH-TANK-AREA IF SOUTH-DOORWAY IS OPEN)
	(NORTH	TO CENTER-OF-LAB)
	(GLOBAL SOUTH-DOORWAY ALARM)
	(CORRIDOR %<+ 16 4 1>)
	;(LINE 1)
	;(STATION SOUTH-WALL)
	(ACTION SOUTH-WALL-F)>

<ROUTINE SOUTH-WALL-F ("OPTIONAL" (RARG <>))
 <COND (<==? .RARG ,M-LOOK>
	<TELL
"You're in the " D ,SOUTH-WALL " of " D ,YOUR-LABORATORY ", next to
shelves full of chemical and electronic supplies. A door leads south to
the " D ,TEST-TANK "." CR>)
       (<AND <==? .RARG ,M-ENTER> <VIDEOPHONE-WORKING>>
	<RTRUE>)>>

<OBJECT CHEMICAL-SUPPLY-SHELVES
	(IN SOUTH-WALL)
	(ADJECTIVE CHEMICAL SUPPLY)
	(SYNONYM SHELF SHELVES)
	(DESC "chemical supply shelf")
	(FLAGS CONTBIT SEARCHBIT OPENBIT SURFACEBIT NDESCBIT)
	(CAPACITY 15)
	(ACTION CHEMICAL-SUPPLY-SHELVES-F)>

<ROUTINE CHEMICAL-SUPPLY-SHELVES-F ()
	<COND (<VERB? EXAMINE LOOK-INSIDE LOOK-ON PUT>
	       <FCLEAR ,CHEMICALS ,NDESCBIT>
	       <RFALSE>)>>

<OBJECT CHEMICALS
	(IN CHEMICAL-SUPPLY-SHELVES)
	(ADJECTIVE CHEMICAL)
	(SYNONYM BUNCH CHEMICAL SUPPLY SUPPLIES)
	(DESC "bunch of chemicals")
	(FLAGS NDESCBIT)>

<OBJECT ELECTRONIC-SUPPLY-SHELVES
	(IN SOUTH-WALL)
	(ADJECTIVE ELECTR SUPPLY)
	(SYNONYM SHELF SHELVES)
	(DESC "electronic supply shelf")
	(FLAGS CONTBIT SEARCHBIT OPENBIT SURFACEBIT VOWELBIT NDESCBIT)
	(CAPACITY 15)
	(ACTION ELECTRONIC-SUPPLY-SHELVES-F)>

<ROUTINE ELECTRONIC-SUPPLY-SHELVES-F ()
	<COND (<VERB? EXAMINE LOOK-INSIDE LOOK-ON PUT>
	       <FCLEAR ,ELECTRONICS ,NDESCBIT>
	       <RFALSE>)>>

<OBJECT ELECTRONICS
	(IN ELECTRONIC-SUPPLY-SHELVES)
	(ADJECTIVE ELECTR)
	(SYNONYM BUNCH ELECTR SUPPLY SUPPLIES)
	(DESC "bunch of electronic supplies")
	(FLAGS NDESCBIT)>
][
<ROOM WEST-WALL
	(IN ROOMS)
	(DESC "west part")
	(ADJECTIVE WEST)
	(SYNONYM PART SECTION AREA ROOM)
	(FLAGS RLANDBIT ONBIT)
	(NORTH	TO NORTH-WALL)
	(SOUTH	TO SOUTH-WALL)
	(EAST	TO CENTER-OF-LAB)
	(CORRIDOR %<+ 32 16 8>)
	(GLOBAL ALARM)
	;(LINE 1)
	;(STATION SOUTH-WALL)
	(ACTION WEST-WALL-F)>

<ROUTINE WEST-WALL-F ("OPTIONAL" (RARG <>))
 <COND (<==? .RARG ,M-LOOK>
	<TELL
"You're in the " D ,WEST-WALL " of " D ,YOUR-LABORATORY ", next to a
shelf full of mechanical supplies." CR>)
       (<AND <==? .RARG ,M-ENTER> <VIDEOPHONE-WORKING>>
	<RTRUE>)>>

<OBJECT MECHANICAL-SUPPLY-SHELVES
	(IN WEST-WALL)
	(ADJECTIVE MECHANICAL SUPPLY)
	(SYNONYM SHELF SHELVES)
	(DESC "mechanical supply shelf")
	(FLAGS CONTBIT SEARCHBIT OPENBIT SURFACEBIT NDESCBIT)
	(CAPACITY 15)
	(ACTION MECHANICAL-SUPPLY-SHELVES-F)>

<ROUTINE MECHANICAL-SUPPLY-SHELVES-F ()
	<COND (<VERB? EXAMINE LOOK-INSIDE LOOK-ON PUT>
	       <FCLEAR ,MECHANICALS ,NDESCBIT>
	       <RFALSE>)>>

<OBJECT MECHANICALS
	(IN MECHANICAL-SUPPLY-SHELVES)
	(ADJECTIVE MECHANICAL)
	(SYNONYM BUNCH MECHANICAL SUPPLY SUPPLIES)
	(DESC "bunch of mechanical supplies")
	(FLAGS NDESCBIT)>
][
<ROOM CENTER-OF-LAB
	(IN ROOMS)
	(DESC "lab center")
	(ADJECTIVE LAB LABORATORY)
	(SYNONYM CENTER CENTRE)
	(FLAGS RLANDBIT ONBIT)
	(EAST	TO EAST-WALL)
	(WEST	TO WEST-WALL)
	(NORTH	TO NORTH-WALL)
	(SOUTH	TO SOUTH-WALL)
	(GLOBAL TEST-BUTTON CONTROLS VIDEOPHONE VIDEOPHONE-2 ALARM)
	(CORRIDOR %<+ 8 4>)
	(GENERIC GENERIC-CENTER-F)
	(ACTION CENTER-OF-LAB-F)>

<ROUTINE GENERIC-CENTER-F (OBJ)
 <COND (,SUB-IN-TANK ,CENTER-OF-LAB)
       (,SUB-IN-DOME ,CENTER-OF-DOME)>>

<ROUTINE CENTER-OF-LAB-F ("OPTIONAL" (RARG <>))
 <COND (<AND <==? .RARG ,M-BEG>
	     ;<EQUAL? <LOC ,MICROPHONE> ,PLAYER ,TIP>
	     <EQUAL? <LOC ,MICROPHONE> ,WINNER>
	     <EXIT-VERB?>>
	<THIS-IS-IT ,MICROPHONE>
	<HE-SHE-IT ,WINNER T>
	<TELL " can't walk away while ">
	<HE-SHE-IT ,WINNER <> "is">
	<TELL " holding the " D ,MICROPHONE "!" CR>	;"[YOU-CANT?]")
       (<==? .RARG ,M-LOOK>
	<TELL
"You're at your workbench in the center of " D ,YOUR-LABORATORY ",
a small part of">
	<RESEARCH-LAB>
	<TELL
" in the town of Frobton. The " D ,VIDEOPHONE " screen looms overhead">
	<COND (,ALARM-RINGING <TELL ", with its " D ,ALARM " ringing">)>
	<TELL "." CR>)
       (<AND <==? .RARG ,M-ENTER> <VIDEOPHONE-WORKING>>
	<RTRUE>)>>

<OBJECT WORKBENCH
	(IN CENTER-OF-LAB)
	(ADJECTIVE WORK)
	(SYNONYM WORKBENCH BENCH TABLE ;DESK)
	(DESC "workbench")
	(FLAGS NDESCBIT CONTBIT SEARCHBIT OPENBIT SURFACEBIT)
	(CAPACITY 99)
	(GENERIC GENERIC-FURNITURE-F)
	(ACTION WORKBENCH-F)>

<ROUTINE WORKBENCH-F ()
 <COND (<VERB? ANALYZE EXAMINE READ LOOK-INSIDE LOOK-ON PUT>
	<FCLEAR ,SUB-PLANS ,NDESCBIT>
	<RFALSE>)>>

<OBJECT SUB-PLANS
	(IN WORKBENCH)
	(ADJECTIVE CIRCUIT ;BLUE)
	(SYNONYM ;BUNCH DIAGRAM ;PRINTS BLUEPRINTS PLAN PLANS)
	(DESC "diagram" ;"bunch of plans")
	(FLAGS NDESCBIT)
	(ACTION SUB-PLANS-F)>

<ROUTINE SCREENPLAY () <TELL "Screenplay by Jim Lawrence" CR>>

<ROUTINE SUB-PLANS-F ("AUX" X)
 <COND (<VERB? ANALYZE EXAMINE READ>
	<TELL
"Written in one corner is the legend:|
|
">
	<SET X <RANDOM 2>>
	<COND (<1? .X> <SCREENPLAY>)>
	<TELL "  Directed by Stu Galley|
">
	<COND (<NOT <1? .X>> <SCREENPLAY>)>
	<CRLF>
	<V-VERSION>)>>

<OBJECT MICROPHONE
	(IN WORKBENCH)
	(ADJECTIVE ;VIDEO ;YOUR MY HAND)
	(SYNONYM MIKE ;VIDEOPHONE ;PHONE MICROPHONE)
	(DESC "microphone" ;"hand mike")
	(FDESC "A microphone is sitting on your workbench.")
	(FLAGS TAKEBIT ON?BIT)
	(VALUE 1)
	(GENERIC GENERIC-MICROPHONE-F)
	(ACTION MICROPHONE-F)>

<ROUTINE GENERIC-MICROPHONE-F (OBJ)
 <COND (,SUB-IN-TANK ,MICROPHONE)
       (,SUB-IN-DOME ,MICROPHONE-DOME)>>

<ROUTINE MICROPHONE-F ("OPTIONAL" (DOME? <>))
 <COND (<VERB? EXAMINE>
	<TELL
"The " D ,MICROPHONE " is connected to the " D ,VIDEOPHONE " by a coiled
cord. At the moment, it is turned o">
	<COND (<OR <AND .DOME? <FSET? ,MICROPHONE-DOME ,ONBIT>>
		   <AND <NOT .DOME?> <FSET? ,MICROPHONE ,ONBIT>>>
	       <TELL "n." CR>)
	      (T <TELL "ff." CR>)>)
       (<AND <OR <VERB? LAMP-OFF>
		 <DIVESTMENT? ,MICROPHONE>
		 <DIVESTMENT? ,MICROPHONE-DOME>>
	     <DOBJ? MICROPHONE MICROPHONE-DOME>
	     <EQUAL? ,VIDEOPHONE ,REMOTE-PERSON-ON>>
	<TELL
"You'd better say \"Good-bye\" to " D ,REMOTE-PERSON " first." CR>)
       (<AND <VERB? REPLY SAY-INTO> <NOT <FSET? ,VIDEOPHONE ,ONBIT>>>
	<TELL
"That won't do any good while the " D ,VIDEOPHONE " is off." CR>)
       (<VERB? SAY-INTO>
	<COND (<EQUAL? ,REMOTE-PERSON-ON ,VIDEOPHONE>
	       <TELL D ,REMOTE-PERSON " nods at you." CR>)
	      (,WOMAN-ON-SCREEN
	       <TELL
"That won't do any good while the sound is fuzzy." CR>)
	      (T <TELL "It's not clear whom you're talking to." CR>)>)
       (<AND <VERB? LAMP-ON>
	     <OR <IN? ,MICROPHONE ,PLAYER> <IN? ,MICROPHONE-DOME ,PLAYER>>>
	<COND (<OR <AND .DOME? <FSET? ,MICROPHONE-DOME ,ONBIT>>
		   <AND <NOT .DOME?> <FSET? ,MICROPHONE ,ONBIT>>>
	       <ALREADY ,MICROPHONE "on">
	       <RTRUE>)>
	<COND (.DOME? <OKAY ,MICROPHONE-DOME "on">)
	      (T <OKAY ,MICROPHONE "on">)>)>>

<OBJECT GLOBAL-TECHNICIAN
	(IN CENTER-OF-LAB ;GLOBAL-OBJECTS)
	(DESC "technician")
	(SYNONYM TECHNICIAN)
	(FLAGS NDESCBIT ;PERSON)
	(ACTION TECHNICIAN-F)>

<ROUTINE TECHNICIAN-F ()
 <COND (<VERB? FIND PHONE TAKE $CALL>
	<TELL
"How can you do that? By telepathy or carrier pigeon? ">
	<COND (<IN? ,SHARON ,OFFICE>
	       <TELL
"Seriously, your " D ,LAB-ASSISTANT ", " D ,SHARON ", is in her office,
which is through a doorway to the east. Or, you could summon her by the
" D ,INTERCOM " on your desk.">)>
	<CRLF>)>>
]
<OBJECT SOUTH-DOORWAY
	(ADJECTIVE SOUTH SLIDING)
	(SYNONYM DOOR DOORWAY)
	(DESC "south doorway")
	(IN LOCAL-GLOBALS)
	(FLAGS DOORBIT OPENBIT)>
[
<ROOM NORTH-TANK-AREA
	(IN ROOMS)
	(DESC "north walkway" ;" tank area")
	(ADJECTIVE NORTH TANK WORK)
	(SYNONYM WALKWAY AREA ROOM)
	(FLAGS RLANDBIT ONBIT)
	(GENERIC GENERIC-TANK-AREA-F)
	(ACTION TANK-AREA-F)
	(NORTH	TO SOUTH-WALL IF SOUTH-DOORWAY IS OPEN)
	(OUT	TO SOUTH-WALL IF SOUTH-DOORWAY IS OPEN)
	(WEST	TO WEST-TANK-AREA)
	(SW	TO WEST-TANK-AREA)
	(DOWN	TO SUB IF SUB-DOOR IS OPEN)
	(IN	TO SUB IF SUB-DOOR IS OPEN)
	(SOUTH	TO SUB IF SUB-DOOR IS OPEN)
	(GLOBAL LOCAL-SUB SOUTH-DOORWAY SUB-DOOR ;TANK-GATE)
	(CORRIDOR 64)
	;(LINE 1)
	;(STATION NORTH-TANK-AREA)>

<OBJECT GANGPLANK
	(IN NORTH-TANK-AREA)
	(DESC "gangplank")
	(ADJECTIVE TEMPORARY)
	(SYNONYM GANGPLANK RUNWAY)
	(FLAGS NDESCBIT)
	(ACTION GANGPLANK-F)>

<ROUTINE GANGPLANK-F ()
 <COND (<AND <VERB? BOARD CLIMB-DOWN CLIMB-ON> ;<EQUAL? ,HERE ,AIRLOCK-WALL>>
	<DO-WALK ,P?SOUTH>
	<RTRUE>)
       ;(<AND <VERB? BOARD CLIMB-UP CLIMB-ON> <EQUAL? ,HERE ,AIRLOCK>>
	<DO-WALK ,P?NORTH>
	<RTRUE>)>>
][
<ROOM WEST-TANK-AREA
	(IN ROOMS)
	(DESC "west walkway" ;" tank area")
	(ADJECTIVE WEST TANK)
	(SYNONYM WALKWAY AREA ROOM)
	(FLAGS RLANDBIT ONBIT ;TOUCHBIT)
	(GENERIC GENERIC-TANK-AREA-F)
	(ACTION TANK-AREA-F)
	(NORTH	TO NORTH-TANK-AREA)
	(NE	TO NORTH-TANK-AREA)
	(DOWN	"You have to go north to board the SCIMITAR.")
	(EAST	"You have to go north to board the SCIMITAR.")
	;(IN	"You have to go north to board the SCIMITAR.")
	(SE	TO SOUTH-TANK-AREA)
	(SOUTH	TO SOUTH-TANK-AREA)
	(GLOBAL LOCAL-SUB SOUTH-DOORWAY SUB-DOOR
		FILL-TANK-BUTTON OPEN-GATE-BUTTON)
	(CORRIDOR 64)
	;(LINE 1)
	;(STATION WEST-TANK-AREA)>

<OBJECT WORK-COUNTER
	(IN WEST-TANK-AREA)
	(ADJECTIVE WORK)
	(SYNONYM COUNTER WORKCOUNTER)
	(DESC "work counter")
	(FLAGS CONTBIT SEARCHBIT OPENBIT SURFACEBIT)
	(CAPACITY 99)
	(FLAGS NDESCBIT)>

<OBJECT TANK-CONTROL-GEAR-1
	(IN WEST-TANK-AREA ;LOCAL-GLOBALS)
	(DESC "control gear")
	(ADJECTIVE CONTROL WALL REMOTE)
	(SYNONYM GEAR CONTROL WALL)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-TANK-CONTROL-GEAR-F)
	(ACTION CONTROLS-F)>

<OBJECT TANK-CONTROL-GEAR-2
	(IN WEST-TANK-AREA ;LOCAL-GLOBALS)
	(DESC "control gear")
	(ADJECTIVE CONTROL WALL REMOTE)
	(SYNONYM VALVE VALVES GAUGE GAUGES)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-TANK-CONTROL-GEAR-F)
	(ACTION CONTROLS-F)>

<ROUTINE GENERIC-TANK-CONTROL-GEAR-F (OBJ) ,TANK-CONTROL-GEAR-1>
]
<ROOM SOUTH-TANK-AREA
	(IN ROOMS)
	(DESC "south walkway" ;" tank area")
	(ADJECTIVE SOUTH TANK)
	(SYNONYM WALKWAY AREA ROOM)
	(FLAGS RLANDBIT ONBIT ;TOUCHBIT)
	(GENERIC GENERIC-TANK-AREA-F)
	(ACTION TANK-AREA-F)
	(DOWN	"You have to go north to board the SCIMITAR.")
	;(IN	"You have to go north to board the SCIMITAR.")
	(NORTH	TO WEST-TANK-AREA)
	(NW	TO WEST-TANK-AREA)
	(WEST	TO WEST-TANK-AREA)
	(GLOBAL LOCAL-SUB SOUTH-DOORWAY SUB-DOOR ;TANK-GATE)
	(CORRIDOR 64)
	;(LINE 1)
	;(STATION SOUTH-TANK-AREA)>

<ROUTINE GENERIC-TANK-AREA-F (OBJ) ,NORTH-TANK-AREA>

<ROUTINE TANK-AREA-F ("OPTIONAL" (RARG <>))
	 <COND (<==? .RARG ,M-LOOK>
		<USL>
		<FSET ,NORTH-TANK-AREA ,TOUCHBIT>
		<FSET ,WEST-TANK-AREA  ,TOUCHBIT>
		<FSET ,SOUTH-TANK-AREA ,TOUCHBIT>
		<COND (<EQUAL? ,HERE ,NORTH-TANK-AREA>
		       <TELL
"You're at a temporary runway or gangplank that leads from the walkway
to the " D ,SUB-DOOR " of the " D ,GLOBAL-SUB ". ">
		       <CHECK-DOOR ,SUB-DOOR>)
		      (<EQUAL? ,HERE ,WEST-TANK-AREA>
		       <TELL
"You're at a " D ,WORK-COUNTER ", next to the " D ,TANK-CONTROL-GEAR-1
" used to operate the " D ,TEST-TANK ".|">)>
		<TELL "The test tank (which is now ">
		<COND (,TEST-TANK-FULL <TELL "filled with ">)
		      (T <TELL "empty of ">)>
		<TELL
D ,GLOBAL-WATER ") is located in a large work room, just south of "
D ,YOUR-LABORATORY ", with
concrete-block walls on three sides and a high metal roof. Most of
its floor is dug out and lined with steel, to form
the huge tank used for developing and testing " D ,UNDERWATER " gear and
the pilot models of your submarine craft.|
There's a walkway around the tank on three sides --
north, west and south. On the east side,
a steel gate forms the wall of the room." CR>)>>

"Other stuff"

<ROUTINE FRESH-AIR? (RM "AUX" P L TBL O)
	#DECL ((RM O) OBJECT (P L) FIX)
	<COND (<AND ,DOME-AIR-BAD? ,SUB-IN-DOME ;<IN-DOME? .RM>>
	       <TELL
"It's impossible to tell that way whether the air is good." CR>
	       <RTRUE>)>
	<SET P 0>
	<REPEAT ()
		<COND (<0? <SET P <NEXTP ,HERE .P>>>
		       <RFALSE>)
		      (<NOT <L? .P ,LOW-DIRECTION>>
		       <SET TBL <GETPT ,HERE .P>>
		       <SET L <PTSIZE .TBL>>
		       <COND (<AND <EQUAL? .L ,DEXIT>	;"Door EXIT"
				   <FSET? <SET O <GETB .TBL ,DEXITOBJ>>
					  ,OPENBIT>>
			      <TELL
"There's a pleasant breeze coming through the " D .O "." CR>
			      <RETURN>)>)>>>

"unused corridor: COR-40000"
[
<GLOBAL COR-20000
	<PTABLE P?NORTH P?SOUTH OUTSIDE-COMM-BLDG OUTSIDE-ADMIN-BLDG 0>>
<GLOBAL COR-10000
	<PTABLE P?WEST P?EAST OUTSIDE-WORKSHOP OUTSIDE-COMM-BLDG 0>>
<GLOBAL COR-4000
	<PTABLE P?NORTH P?SOUTH OUTSIDE-WORKSHOP OUTSIDE-DORM 0>>
<GLOBAL COR-2000
	<PTABLE P?WEST P?EAST OUTSIDE-DORM FOOT-OF-RAMP OUTSIDE-ADMIN-BLDG 0>>
<GLOBAL COR-1000
	<PTABLE P?NORTH P?SOUTH CENTER-OF-DOME FOOT-OF-RAMP AIRLOCK-WALL 0>>
<GLOBAL COR-400
	<PTABLE P?NE P?SW OUTSIDE-COMM-BLDG CENTER-OF-DOME OUTSIDE-DORM 0>>
<GLOBAL COR-200
	<PTABLE P?NW P?SE
	       OUTSIDE-WORKSHOP CENTER-OF-DOME OUTSIDE-ADMIN-BLDG 0>>
<GLOBAL COR-64
	<PTABLE P?NORTH P?SOUTH
	       NORTH-TANK-AREA WEST-TANK-AREA SOUTH-TANK-AREA 0>>
<GLOBAL COR-32
	<PTABLE P?NORTH P?SOUTH NORTH-WALL WEST-WALL 0>>
<GLOBAL COR-16
	<PTABLE P?NORTH P?SOUTH WEST-WALL SOUTH-WALL 0>>
<GLOBAL COR-8
	<PTABLE P?WEST P?EAST WEST-WALL CENTER-OF-LAB EAST-WALL 0>>
<GLOBAL COR-4
	<PTABLE P?NORTH P?SOUTH NORTH-WALL CENTER-OF-LAB SOUTH-WALL 0>>
<GLOBAL COR-2
	<PTABLE P?NORTH P?SOUTH NORTH-WALL EAST-WALL 0>>
<GLOBAL COR-1
	<PTABLE P?NORTH P?SOUTH EAST-WALL SOUTH-WALL 0>>
]

"Routines to do looking down corridors"

<ROUTINE CORRIDOR-LOOK ("OPTIONAL" (ITM <>) "AUX" C Z COR VAL (FOUND <>))
 <COND (<SET C <GETP ,HERE ,P?CORRIDOR>>
	<REPEAT ()
	 <COND (<NOT <L? <SET Z <- .C  *20000*>> 0>> <SET COR ,COR-20000>)
	       (<NOT <L? <SET Z <- .C  *10000*>> 0>> <SET COR ,COR-10000>)
	       (<NOT <L? <SET Z <- .C   *4000*>> 0>> <SET COR ,COR-4000>)
	       (<NOT <L? <SET Z <- .C   *2000*>> 0>> <SET COR ,COR-2000>)
	       (<NOT <L? <SET Z <- .C   *1000*>> 0>> <SET COR ,COR-1000>)
	       (<NOT <L? <SET Z <- .C    *400*>> 0>> <SET COR ,COR-400>)
	       (<NOT <L? <SET Z <- .C    *200*>> 0>> <SET COR ,COR-200>)
	       (<NOT <L? <SET Z <- .C    *100*>> 0>> <SET COR ,COR-64>)
	       (<NOT <L? <SET Z <- .C     *40*>> 0>> <SET COR ,COR-32>)
	       (<NOT <L? <SET Z <- .C     *20*>> 0>> <SET COR ,COR-16>)
	       (<NOT <L? <SET Z <- .C     *10*>> 0>> <SET COR ,COR-8>)
	       (<NOT <L? <SET Z <- .C       4 >> 0>> <SET COR ,COR-4>)
	       (<NOT <L? <SET Z <- .C       2 >> 0>> <SET COR ,COR-2>)
	       (<NOT <L? <SET Z <- .C       1 >> 0>> <SET COR ,COR-1>)
	       (T <RETURN>)>
	 <SET VAL <CORRIDOR-CHECK .COR .ITM>>
	 <COND (<NOT .FOUND> <SET FOUND .VAL>)>
	 <SET C .Z>>
	.FOUND)>>

<ROUTINE CORRIDOR-CHECK (COR ITM "AUX" (CNT 2) (PAST 0) (FOUND <>) RM OBJ)
 #DECL ((COR) <PRIMTYPE VECTOR> (CNT PAST) FIX)
 <REPEAT ()
  <COND (<==? <SET RM <GET .COR .CNT>> 0>
	 <RFALSE>)
	(<==? .RM ,HERE> <SET PAST 1>)
	(<SET OBJ <FIRST? .RM>>
	 <REPEAT ()
		 <COND (.ITM
			<COND (<==? .OBJ .ITM>
			       <SET FOUND <GET .COR .PAST>>
			       <RETURN>)>)
		       (<AND <FSET? .OBJ ,PERSON>
			     ;<NOT <EQUAL? .OBJ ,TIP>>
			     ;<NOT <IN-MOTION? .OBJ>>
			     <NOT <FSET? .OBJ ,INVISIBLE>>
			     <NOT <FSET? .OBJ ,NDESCBIT>>>
			<COND (<AND <IS-CREW? .OBJ>
				    <CREW-5-TOGETHER?>
				    <NOT <FSET? ,BLY ,MUNGBIT>>>
			       <COND (<==? .OBJ ,LOWELL>
				      <TELL
"The five " D ,CREW " members are off to ">
				      <DIR-PRINT <GET .COR .PAST>>
				      <TELL "." CR>)>)
			      (<NOT <FSET? .OBJ ,TOUCHBIT>>
			       <TELL "Someone is off to ">
			       <DIR-PRINT <GET .COR .PAST>>
			       <TELL "." CR>)
			      (T
			       <TELL D .OBJ " is off to ">
			       <DIR-PRINT <GET .COR .PAST>>
			       <TELL "." CR>)>)>
		 <SET OBJ <NEXT? .OBJ>>
		 <COND (<NOT .OBJ> <RETURN>)>>
	 <COND (.FOUND <RETURN .FOUND>)>)>
  <SET CNT <+ .CNT 1>>>>

;<ROUTINE COR-DIR (HERE THERE "AUX" COR RM (PAST 0) (CNT 2))
	 <SET COR <GET-COR <BAND <GETP .THERE ,P?CORRIDOR>
				 <GETP .HERE ,P?CORRIDOR>>>>
	 <REPEAT ()
		 <COND (<==? <SET RM <GET .COR .CNT>> .HERE>
			<SET PAST 1>
			<RETURN>)
		       (<==? .RM .THERE>
			<RETURN>)>
		 <SET CNT <+ .CNT 1>>>
	 <GET .COR .PAST>>

;<ROUTINE GET-COR (NUM)
	 #DECL ((NUM) FIX)
	 <COND (<==? .NUM 1> ,COR-1)
	       (<==? .NUM 2> ,COR-2)
	       (<==? .NUM 4> ,COR-4)
	       (<==? .NUM 8> ,COR-8)
	       (<==? .NUM 16> ,COR-16)
	       (<==? .NUM 32> ,COR-32)
	       (<==? .NUM 64> ,COR-64)
	       (<==? .NUM   *200*> ,COR-200)
	       (<==? .NUM   *400*> ,COR-400)
	       (<==? .NUM  *1000*> ,COR-1000)
	       (<==? .NUM  *2000*> ,COR-2000)
	       (<==? .NUM  *4000*> ,COR-4000)
	       (<==? .NUM *10000*> ,COR-10000)
	       (T ,COR-20000)>>