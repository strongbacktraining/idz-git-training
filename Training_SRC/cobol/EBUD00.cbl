       ID DIVISION.
       PROGRAM-ID. EBUD00.
      *    THIS IS THE FIRST OF SEVERAL SAMPLE PROGRAMS FOR EBU 2004
      *
      *    THIS PROGRAM CHECKS TO SEE IF A GREGORIAN DATE CONTAINS
      *    ALL INTEGERS.
      *
      *    (C) 2013 IBM - KEVIN J. CUMMINGS.

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
       01 W-CALL-PROGRAM       PIC X(8).
      *
       01 W-RETIREMENT-WA          PIC 9(4).

       01 W-EBUD02-LINKAGE-AREA.
          05 W-INPUT-DATE.
             10 W-CCYY  PIC 9(4).
             10 W-MM    PIC 9(2).
             10 W-DD    PIC 9(2).
          05 W-DAY-DIFFERENCE       PIC 9(9).
          05 W-EBUD02-PROGRAM-RETCODE PIC 9(4).
             88 W-EBUD02-REQUEST-SUCCESS   VALUE 0.

       01 W-EBUD03-LINKAGE-AREA.
          05 W-RETIREMENT-DATE-IN.
             10 W-RET-YYYY  PIC X(4).
             10 FILLLER-1     PIC X(1) VALUE '/'.
             10 W-RET-MM    PIC X(2).
             10 FILLLER     PIC X(1) VALUE '/'.
             10 W-RET-DD    PIC X(2).
          05 W-RETIREMENT-DATE        PIC X(80).
          05 W-EBUD03-PROGRAM-RETCODE PIC 9(4).
             88 W-EBUD03-REQUEST-SUCCESS   VALUE 0.
      *
       LINKAGE SECTION.
      *
       01 INTERFACE-AREA.
          05 L-INPUT-DATE.
             10 L-CCYY       PIC X(4).
             10 L-MM         PIC X(2).
             10 L-DD         PIC X(2).
          05 DAYS-DIFF       PIC 9(8) COMP.
          05 RETIREMENT-DATE PIC X(8).
          05 RETC            PIC S9(4) COMP.

       PROCEDURE DIVISION USING INTERFACE-AREA.
      *
       A000-MAINLINE SECTION.
           PERFORM A100-VERIFY-INPUT-DATE
           GOBACK
           .
       END-OF-SECTION.
           EXIT.
      *
      *
       A100-VERIFY-INPUT-DATE SECTION.
           IF L-INPUT-DATE NUMERIC
              MOVE L-INPUT-DATE TO W-INPUT-DATE
              DISPLAY 'WORKING DATE:          - ' W-INPUT-DATE
              MOVE W-CCYY TO RETURN-CODE
              MOVE 0 TO RETC
           ELSE
              DISPLAY 'INPUT DATE NOT NUMERIC - ' L-INPUT-DATE
              MOVE -1 TO RETC
           END-IF
           .
      *
       END-OF-SECTION.
           EXIT.
      *