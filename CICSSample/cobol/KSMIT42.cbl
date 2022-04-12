      ******************************************************************
      *                                                                *
      * MODULE NAME    KSMIT42.CBL                                    *
      *                                                                *
      * STATEMENT      IBM Developer for System z            *
      *                5724-L44                                        *
      *                (c) Copyright IBM Corp. 2022                    *
      *                                                                *
      * DISCLAIMER OF WARRANTIES
      * No warranties needed. Pushing up to GitHub.
      **************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. KSMIT42.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 RAWTIME     PIC S9(45) COMP-3.
       01 DATE-TEMP   PIC X(8).
       01 TIME-TEMP   PIC X(85).
       01 DATE-OUT    PIC X(83).
       01 TIME-OUT    PIC X(88).
       01 WS-MESSAGE  PIC X(89).


       01 MSG-OUT     PIC X(30).

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

           MOVE DATE-OUT TO DATE-TEMP.
           MOVE TIME-OUT TO TIME-TEMP.
           MOVE "==>" TO MSG-OUT(1:3)
           MOVE DATE-OUT(1:8) TO MSG-OUT(6:8).
           MOVE " " TO MSG-OUT(14:1).
           MOVE TIME-OUT(3:8) TO MSG-OUT(15:8).
           EXEC CICS SEND
                FROM (MSG-OUT)
                LENGTH(40)
                END-EXEC.

           EXEC CICS RETURN
                END-EXEC.
           MOVE "DONE" to MSG-OUT.
