      ******************************************************************
      *                                                                *
      * MODULE NAME    KSMIT42.CBL                                    *
      *                                                                *
      * STATEMENT      IBM Developer for System z            *
      *                5724-L44                                        *
      *                (c) Copyright IBM Corp. 2022                    *
      *                                                                *
      * DISCLAIMER OF WARRANTIES                                       *
      *    There are no warranties here. Use this at your peril
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. KSMIT42.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 RAWTIME            PIC S9(15) COMP-3.
       01  DATE-TEMP         PIC X(8).
       01  TIME-TEMP         PIC X(8).
       01  DATE-OUT      PIC X(8).
       01  TIME-OUT      PIC X(8).
       01 WS-MESSAGE  PIC X(8).
       01 MSG-OUT        PIC X(30).

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
           Move DATE-OUT(1:8) to MSG-OUT(6:8).
           Move " " to MSG-OUT(14:1).
           Move TIME-OUT(1:8) to MSG-OUT(15:8).
           EXEC CICS SEND
                       FROM    (MSG-OUT)
                       LENGTH (30)
            END-EXEC.

           EXEC CICS RETURN END-EXEC.

           GOBACK.
