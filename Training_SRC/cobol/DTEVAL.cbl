000100 IDENTIFICATION DIVISION.
000200******************************************************************
000300******************************************************************
000900 PROGRAM-ID.  DTEVAL.
001000 AUTHOR. JON SAYLES.
001100 INSTALLATION. COBOL DEVELOPMENT CENTER.
001200 DATE-WRITTEN. 01/01/08.
001300 DATE-COMPILED. 01/01/08.
001400 SECURITY. NON-CONFIDENTIAL.
001700 ENVIRONMENT DIVISION.
001800 CONFIGURATION SECTION.
001900 SOURCE-COMPUTER. IBM-390.
002000 OBJECT-COMPUTER. IBM-390.
002100 INPUT-OUTPUT SECTION.
002200
002300 DATA DIVISION.
002400 FILE SECTION.
002500
002600 WORKING-STORAGE SECTION.
002700 01  MISC-FIELDS.
002800     05 L   PIC S9(4) COMP.
002900
003000 01  DFH014-WORK-AREA.
003100     05 DFH014-DATE.
003200        10 DFH014-MONTH            PIC 9(02).
003300           88 MONTH-OK             VALUE 1  THRU 12.
003400           88 MONTH-31             VALUE 1 3 5 7 8 10 12.
003500           88 MONTH-30             VALUE 4 6 9 11.
003600           88 MONTH-28-29          VALUE 2.
003700        10 DFH014-DAY              PIC 9(02).
003800           88 DAY-31               VALUE 1  THRU 31.
003900           88 DAY-30               VALUE 1  THRU 30.
004000           88 DAY-29               VALUE 1  THRU 29.
004100           88 DAY-28               VALUE 1  THRU 28.
004200        10 DFH014-YEAR             PIC 9(04).
004300           88 DFH014-VALID-YEAR    VALUES 1990 THRU 2050.
004400        10 DFH014-YEAR-X-TYP
004500           REDEFINES
004600           DFH014-YEAR.
004700           15  FILLER              PIC X(02).
004800           15  DFH014-YEAR-JJ      PIC 9(02).
004900               88  DFH014-YEAR-NOT-A-LEAP VALUES 01 03 05 07 09.
005000               88  DFH014-YEAR-MUST-BE-LEAP VALUES 00 04 08.
005100*
005200*
005300     05 DFH014-DIVIDE-WORK.
005400        10 QUOTIENT                PIC S9(04).
005500        10 REST                    PIC S9(02).
005600           88  IT-IS-A-LEAP-YEAR   VALUE ZERO.
005700           88  NOT-A-LEAP-YEAR     VALUE 1 2 3.
005800
005900 LINKAGE SECTION.
006000 01  DATE-IN     PIC  X(08).
006100 01  RETURN-CD   PIC S9(04).
006200
006300 PROCEDURE DIVISION USING DATE-IN, RETURN-CD.
006400     MOVE +0 TO RETURN-CD.
006500     MOVE DATE-IN
006600       TO DFH014-DATE
006700                                 IN DFH014-WORK-AREA
006800*
006900     IF  DFH014-VALID-YEAR
007000                                 IN DFH014-YEAR
007100                                 IN DFH014-DATE
007200                                 IN DFH014-WORK-AREA
007300     THEN
007400         CONTINUE
007500     ELSE
007600         MOVE -1 TO RETURN-CD
007700         GOBACK
007800     END-IF
007900*
008000     IF  MONTH-OK
008100                                 IN DFH014-MONTH
008200                                 IN DFH014-DATE
008300                                 IN DFH014-WORK-AREA
008400     THEN
008500         CONTINUE
008600     ELSE
008700         MOVE -1 TO RETURN-CD
008800         GOBACK
008900     END-IF
009000*
009100*
009200     IF  MONTH-28-29
009300     THEN
009400*
009500         EVALUATE  TRUE
009600*
009700             WHEN  DFH014-YEAR-NOT-A-LEAP
009800                                 IN DFH014-YEAR-JJ
009900                                 IN DFH014-YEAR-X-TYP
010000                                 IN DFH014-DATE
010100                                 IN DFH014-WORK-AREA
010200                   SET  NOT-A-LEAP-YEAR
010300                                 IN REST
010400                                 IN DFH014-DIVIDE-WORK
010500                     TO TRUE
010600*
010700             WHEN  DFH014-YEAR-MUST-BE-LEAP
010800                                 IN DFH014-YEAR-JJ
010900                                 IN DFH014-YEAR-X-TYP
011000                                 IN DFH014-DATE
011100                                 IN DFH014-WORK-AREA
011200                   SET  IT-IS-A-LEAP-YEAR
011300                                 IN REST
011400                                 IN DFH014-DIVIDE-WORK
011500                     TO TRUE
011600*
011700             WHEN  OTHER
011800                   DIVIDE      DFH014-YEAR
011900                                 IN DFH014-DATE
012000                                 IN DFH014-WORK-AREA
012100                    BY         4
012200                    GIVING     QUOTIENT
012300                    REMAINDER  REST
012400                   END-DIVIDE
012500*
012600         END-EVALUATE
012700*
012800     END-IF
012900*
013000     EVALUATE  TRUE              ALSO     TRUE
013100*
013200         WHEN  MONTH-31          ALSO     DAY-31
013300         WHEN  MONTH-30          ALSO     DAY-30
013400         WHEN  MONTH-28-29       ALSO     DAY-28
013500         WHEN  MONTH-28-29       ALSO     DAY-29
013600           AND IT-IS-A-LEAP-YEAR
013700               CONTINUE
013800*
013900         WHEN  OTHER
014000         MOVE -1 TO RETURN-CD
014100     END-EVALUATE.
014200*