      ******************************************************************
      *
      * MODULE NAME    TIMEZONE.CBL
      *                IBM Developer for z/OS
      *                (c) Copyright IBM Corp. 2022
      *
      * DISCLAIMER OF WARRANTIES
      *  - For the right price, we'll guarantee that it works.
      *  - Demonstrating PUSH to Github.
      *  - Yet another push demo
      *  - Yet another push demo
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIMEZONE.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 RAWTIME            PIC S9(15) COMP-3.
       01  DATE-TEMP         PIC X(28).
       01  TIME-OUT      PIC X(9).
       01 WS-MESSAGE  PIC X(8).
       01 MSG-OUT        PIC X(25).
       01 CUSTOMER_FNAME  PIC X(50).
       01 CUSTOMER_LNAME  PIC X(60).



       LINKAGE SECTION.
       PROCEDURE DIVISION.
      ***************************************************************
      *    Main section                                             *
      ***************************************************************
           MOVE SPACES TO MSG-OUT.
           EXEC CICS ASKTIME ABSTIME(RAWTIME)
           END-EXEC.

           EXEC CICS FORMATTIME ABSTIME(RAWTIME)
                                MMDDYY(DATE-OUT)
                                DATESEP('/')
                                TIME(TIME-OUT)
                                TIMESEP(':')
           END-EXEC.

           MOVE DATE-OUT TO DATE-TEMP.
           MOVE TIME-OUT TO TIME-TEMP.
           MOVE "==>" TO MSG-OUT(1:3)
           Move DATE-OUT(2:8) to MSG-OUT(6:8).
           Move " " to MSG-OUT(14:1).
           Move TIME-OUT(1:8) to MSG-OUT(15:8).
           EXEC CICS SEND
                       FROM    (MSG-OUT)
                       LENGTH (35)
            END-EXEC.

           EXEC CICS RETURN END-EXEC.

           GOBACK.
      *****************************************************************
      *         DEV BRANCH - Testing Complete
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIMEZONE.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 RAWTIME            PIC S9(15) COMP-3.
       01  DATE-TEMP         PIC X(15).
       01  TIME-TEMP         PIC X(6).
       01  DATE-OUT      PIC X(8).
       01  TIME-OUT      PIC X(8).
       01  WAY-OUT      PIC X(9).
       01 WS-MESSAGE  PIC X(8).
       01 MSG-OUT        PIC X(30).
       01 BAD-VAR      PIC S7(11).

       LINKAGE SECTION.
       PROCEDURE DIVISION.
      ***************************************************************
      *    Main section                                             *
      ***************************************************************
           MOVE SPACES TO MSG-OUT.
           EXEC CICS ASKTIME ABSTIME(RAWTIME)
           END-EXEC.

           EXEC CICS FORMATTIME ABSTIME(RAWTIME)
                                MMDDYY(DATE-OUT)
                                DATESEP('-')
                                TIME(TIME-OUT)
                                TIMESEP(':')
           END-EXEC.
       ********************************************************
       *   New Edits *
       ********************************************************
           MOVE DATE-OUT TO DATE-TEMP.
           MOVE TIME-OUT TO TIME-TEMP.
           MOVE "==>" TO MSG-OUT(1:3)
           Move DATE-OUT(1:8) to MSG-OUT(6:8).
           Move " " to MSG-OUT(14:1).
           Move TIME-OUT(1:8) to MSG-OUT(15:8).
           EXEC CICS SEND
                       FROM    (MSG-OUT)
                       LENGTH (25)
            END-EXEC.

           EXEC CICS RETURN END-EXEC.

           GOBACK.
