"STATUS for
				 SHOGUN
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<BEGIN-SEGMENT 0>

<CONSTANT S-STATUS 1>
<CONSTANT STATUS-LINES 2>

<CONSTANT S-BORDER 6> ;"only used on apple"
<GLOBAL BORDER-HEIGHT 32>

<BEGIN-SEGMENT HINTS>

<ROUTINE SETUP-TEXT-AND-STATUS ("OPT" (P ,P-BORDER-LOC)
				"AUX" X (HIGH <LOWCORE VWRD>)
				(WIDE <LOWCORE HWRD>) (SLEFT 1)
				(SHIGH <* ,STATUS-LINES ,FONT-Y>))
	 <COND (<NOT <APPLE?>> ;"only apples have no borders"
		<PICINF .P ,YX-TBL>
		<SET X <GET ,YX-TBL 1>>
		<SET SLEFT <+ .X .SLEFT>>
		<COND (<NOT <EQUAL? .P ,P-BORDER-LOC>>
		       <SET SHIGH <GET ,YX-TBL 0>>)>
		<SET WIDE <- .WIDE <* .X 2>>>
		<WINDEF ,S-STATUS 1 .SLEFT .SHIGH .WIDE>)
	       (ELSE
		<COND (<EQUAL? .P ,P-HINT-LOC>
		       <COND (<PICINF ,P-HINT-BORDER ,YX-TBL>
			      <SETG BORDER-HEIGHT <GET ,YX-TBL 0>>)>
		       <SET SHIGH <+ ,BORDER-HEIGHT <* 3 ,FONT-Y>>>
		       <WINDEF ,S-STATUS 1 .SLEFT .SHIGH .WIDE>)
		      (ELSE
		       <COND (<PICINF ,P-BORDER ,YX-TBL>
			      <SETG BORDER-HEIGHT <GET ,YX-TBL 0>>)>
		       <WINDEF ,S-BORDER
			       <+ 1 .SHIGH> 1
			       <- .HIGH .SHIGH> .WIDE>
		       <WINDEF ,S-STATUS 1 .SLEFT .SHIGH .WIDE>
		       <SET SHIGH <+ .SHIGH ,BORDER-HEIGHT>>)>)>
	 <WINDEF ,S-TEXT
		 <+ 1 .SHIGH> .SLEFT
		 <- .HIGH .SHIGH> .WIDE>>

<END-SEGMENT>

<BEGIN-SEGMENT 0>

<GLOBAL SCORE-START 0>
<CONSTANT SCORE-MARGIN 2>

<ROUTINE INIT-STATUS-LINE ("OPT" (NO-STS? <>))
	 <RESET-MARGIN>
	 <CLEAR ,S-TEXT>
	 <COND (<NOT .NO-STS?> <SETUP-TEXT-AND-STATUS>)>
	 <SCREEN ,S-STATUS>
	 <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>
	 <PRINTI "0">
	 <DIROUT ,D-TABLE-OFF>
	 <SETG DIGIT-WIDTH <LOWCORE TWID>>
	 <DIROUT ,D-TABLE-ON ,DIROUT-TABLE>
	 <PRINTI "Score: ">
	 <DIROUT ,D-TABLE-OFF>
	 <SETG SCORE-START <+ <LOWCORE TWID> <* 4 ,DIGIT-WIDTH> ,SCORE-MARGIN>>
	 <INVERSE-COLOR>
	 <CLEAR ,S-STATUS>
	 <UPDATE-STATUS-LINE T>>

<GLOBAL DIGIT-WIDTH 0>

<GLOBAL SHERE <>>

<ROUTINE UPDATE-STATUS-LINE ("OPT" (REF? <>) "AUX" WIDE TMP LEFT)
	 <COND (<FLAG-ON? ,F-REFRESH>
		<DISPLAY-BORDER>)>
	 <COND (<OR <FLAG-ON? ,F-REFRESH>
		    <NOT <EQUAL? ,HERE ,SHERE>>>
		<SET REF? T>)>
	 <COND (<OR .REF?
		    <NOT <EQUAL? ,SCORE ,OSCORE>>
		    <NOT <EQUAL? ,MOVES ,OMOVES>>> 
		<SCREEN ,S-STATUS>
		<INVERSE-COLOR>
		<SET WIDE </ <WINGET ,S-STATUS ,WWIDE> ,FONT-X>>
		<COND (<OR <APPLE?> <EQUAL? ,MACHINE ,IBM ,AMIGA>>
		       <SET LEFT 3>)
		      (ELSE <SET LEFT 1>)>
		<COND (.REF?
		       <CURSET 1 .LEFT>
		       <XERASE 1>
		       <COND (,SCENE
			      <CURSET 1 .LEFT>
			      <PRINT <GET ,SCENE-NAMES ,SCENE>>
			      <TELL ":">)>
		       <COND (<NOT <EQUAL? ,MACHINE
					   ,DEBUGGING-ZIP ,MACINTOSH>>
			      <CURSET 1
				      <- </ <WINGET ,S-STATUS ,WWIDE> 2>
					 <* ,DIGIT-WIDTH 3>>>
			      <TELL "SHOGUN">)>
		       <LOWCORE FLAGS
				<BAND <LOWCORE FLAGS> <BCOM ,F-REFRESH>>>)>
		<COND (<OR .REF?
			   <AND <SCENE? ,S-ERASMUS>
				<HERE? ,BRIDGE-OF-ERASMUS>>
			   <AND <SCENE? ,S-VOYAGE>
				<HERE? ,GALLEY>>>
		       <COND (.REF?
			      <CURSET <+ 1 ,FONT-Y> .LEFT>
			      <XERASE 1>)>
		       <COND (,HERE
			      <CURSET <+ 1 ,FONT-Y> .LEFT>
			      <SETG SHERE ,HERE>
			      <COND (<AND <HERE? ,GALLEY>
					  <OR <APPLE?>
					      <EQUAL? ,MACHINE ,AMIGA>>>
				     <TELL "Galley">)
				    (ELSE <TELL 'HERE>)>
			      <SET TMP <LOC ,WINNER>>
			      <COND (<FSET? .TMP ,VEHBIT>
				     <SETG SHERE .TMP>
				     <COND (<FSET? .TMP ,SURFACEBIT>
					    <TELL ", on ">)
					   (ELSE
					    <TELL ", in ">)>
				     <TELL THE .TMP>)>
			      <COND (<HERE? ,BRIDGE-OF-ERASMUS ,GALLEY>
				     <ERASE-ALL-BUT <+ ,SCORE-START ,FONT-X>>
				     <COND (<OR <AND <HERE? ,BRIDGE-OF-ERASMUS>
						     <FSET? ,WHEEL ,ONBIT>>
						<AND <HERE? ,GALLEY>
						     <FSET? ,GALLEY-WHEEL
							    ,ONBIT>>>
					    <TELL "; course ">
					    <TELL-DIRECTION ,SHIP-DIRECTION>
					    <TELL "; wheel ">
					    <TELL-DIRECTION ,SHIP-COURSE>)>)>)>)>
		<COND (<OR .REF? <NOT <EQUAL? ,SCORE ,OSCORE>>>
		       <COND (.REF?
			      <CURSET 1
				      <- <WINGET ,S-STATUS ,WWIDE>
					 ,SCORE-START>>
			      <TELL "Score:">
			      <XERASE 1>)>
		       <SET TMP <* ,SCORE ,SCORE-FACTOR>>
		       <RJNUM .TMP 1>
		       <SETG OSCORE ,SCORE>)>
		<COND (<OR .REF? <NOT <EQUAL? ,MOVES ,OMOVES>>>
		       <COND (.REF?
			      <CURSET <+ 1 ,FONT-Y>
				      <- <WINGET ,S-STATUS ,WWIDE>
					 ,SCORE-START>>
			      <TELL "Moves:">
			      <XERASE 1>)>
		       <RJNUM ,MOVES 2>
		       <SETG OMOVES ,MOVES>)>
		<SCREEN ,S-TEXT>)>>

<ROUTINE ERASE-ALL-BUT (N)
	 <SET N <- <WINGET ,S-STATUS ,WWIDE>
		   <WINGET ,S-STATUS ,WXPOS>
		   .N>>
	 <COND (<G? .N 1> <XERASE .N>)>>

<ROUTINE INTERLUDE-STATUS-LINE ("AUX" LEFT)
	 <COND (<NOT <APPLE?>>
		<COND (<PICINF ,P-BORDER2 ,YX-TBL>
		       <DISPLAY-BORDER ,P-BORDER2>)
		      (<PICINF ,P-BORDER ,YX-TBL>
		       <DISPLAY-BORDER ,P-BORDER>)>)>
	 <COND (<OR <APPLE?> <EQUAL? ,MACHINE ,IBM ,AMIGA>> <SET LEFT 3>)
	       (ELSE <SET LEFT 1>)>
	 <SETG SHERE <>>
	 <SCREEN ,S-STATUS>
	 <INVERSE-COLOR>
	 <CURSET 1 .LEFT>
	 <ERASE-ALL-BUT <+ ,SCORE-START ,FONT-X>>
	 <CURSET 1 .LEFT>
	 <PRINT <GET ,SCENE-NAMES ,SCENE>>
	 <TELL ":">
	 <COND (<NOT <EQUAL? ,MACHINE ,DEBUGGING-ZIP ,MACINTOSH>>
		<CURSET 1
			<- </ <WINGET ,S-STATUS ,WWIDE> 2>
			   <* ,DIGIT-WIDTH 3>>>
		<TELL "SHOGUN">)>
	 <LOWCORE FLAGS <BAND <LOWCORE FLAGS> <BCOM ,F-REFRESH>>>
	 <CURSET <+ 1 ,FONT-Y> .LEFT>
	 <ERASE-ALL-BUT <+ ,SCORE-START ,FONT-X>>
	 <CURSET <+ 1 ,FONT-Y> .LEFT>
	 <TELL "Interlude">
	 <SCREEN ,S-TEXT>>

<ROUTINE RJNUM (NUM LINE "AUX" (WIDE <WINGET ,S-STATUS ,WWIDE>) (N <>))
	 <SET LINE <+ 1 <* <- .LINE 1> ,FONT-Y>>>
	 <SET WIDE <- .WIDE ,SCORE-MARGIN>>
	 <COND (<L? .NUM 10> <SET N 1>)
	       (<L? .NUM 100> <SET N 2>)
	       (<L? .NUM 1000> <SET N 3>)
	       (<L? .NUM 10000> <SET N 4>)>
	 <COND (<L? .N 4>
		<CURSET .LINE <- .WIDE <* ,DIGIT-WIDTH 4>>>)>
	 <XERASE 1>
	 <CURSET .LINE <- .WIDE <* ,DIGIT-WIDTH .N>>>
	 <COND (.N <TELL N .NUM>)
	       (ELSE <TELL "****">)>>

<END-SEGMENT ;"0">
