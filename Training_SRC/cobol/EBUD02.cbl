       ID DIVISION.
       PROGRAM-ID. EBUD02.
      *    THIS IS A CALLED PROGRAM EXAMPLE FOR EBU 2004
      *
      *    THIS PROGRAM WILL BE CALLED BY ANOTHER, RECEIVE A
      *    DATE(YYYYMMDD) AND DETERMINE THE NUMBER OF DAYS
      *    SINCE CURRENT DATE.
      *
      *    (C) 2003 IBM - KEVIN J. CUMMINGS RESERVED.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.
       INPUT-OUTPUT SECTION.
          FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       01 W-INPUT-DATE         PIC 9(8).
       01 W-INPUT-DATE-INT     PIC 9(9).

       01 W-CURRENT-DATE       PIC 9(8).
       01 W-CURRENT-DATE-INT   PIC 9(9).

       01 W-DAY-DIFFERENCE     PIC 9(9).

      *
       LINKAGE SECTION.
      *
       01 INTERFACE-AREA.
          05 L-INPUT-DATE.
             10 L-YYYY  PIC 9(4).
             10 L-MM    PIC 9(2).
             10 L-DD    PIC 9(2).
          05 L-DAY-DIFFERENCE  PIC 9(9).
          05 L-PROGRAM-RETCODE PIC 9(4).

       PROCEDURE DIVISION USING INTERFACE-AREA.
      *
       A000-MAINLINE SECTION.
           PERFORM A100-OBTAIN-CURRENT-DATE
           PERFORM A200-CALCULATE-DAY-DIFFERENCE
           GOBACK
           .
       END-OF-SECTION.
           EXIT.
      *
       A100-OBTAIN-CURRENT-DATE.
           MOVE FUNCTION CURRENT-DATE(1:8) TO W-CURRENT-DATE
           COMPUTE W-CURRENT-DATE-INT = ,
              FUNCTION INTEGER-OF-DATE(W-CURRENT-DATE)
           .
      *
       END-OF-SECTION.
           EXIT.
      *
       A200-CALCULATE-DAY-DIFFERENCE.
           MOVE L-INPUT-DATE TO W-INPUT-DATE

           COMPUTE W-INPUT-DATE-INT = ,
              FUNCTION INTEGER-OF-DATE(W-INPUT-DATE)

           COMPUTE W-DAY-DIFFERENCE = ,
              W-CURRENT-DATE-INT - W-INPUT-DATE-INT

           MOVE W-DAY-DIFFERENCE TO L-DAY-DIFFERENCE
           MOVE 0                TO L-PROGRAM-RETCODE
           .
      *
       END-OF-SECTION.
           EXIT.
      *