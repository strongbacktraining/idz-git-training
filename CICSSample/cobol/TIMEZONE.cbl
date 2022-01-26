      ******************************************************************
      *                                                                *
      * MODULE NAME    TIMEZONE.CBL                                    *
      *                                                                *
      * STATEMENT      IBM  Developer for System z            *
      *                5724-L44                                        *
      *                (c) Copyright IBM Corp. 2006                    *
      *                                                                *
      * DISCLAIMER OF WARRANTIES                                       *
      * You may copy, modify, and distribute these samples, or their   *
      * modifications, in any form, internally or as part of your      *
      * application or related documentation. These samples have not   *
      * been tested under all conditions and are provided to you by    *
      * IBM without obligation of support of any kind. IBM PROVIDES    *
      * THESE SAMPLES "AS IS" SUBJECT TO ANY STATUTORY WARRANTIES THAT *
      * CANNOT BE EXCLUDED. IBM MAKES NO WARRANTIES OR CONDITIONS,     *
      * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, THE   *
      * IMPLIED WARRANTIES OR CONDITIONS OF MERCHANTABILITY, FITNESS   *
      * FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT REGARDING THESE *
      * SAMPLES OR TECHNICAL SUPPORT, IF ANY.                          *
      * You will indemnify IBM or third parties that provide IBM       *
      * products ("Third Parties") from and against any third party    *
      * claim arising out of the use, modification or distribution of  *
      * these samples with your application. You may not use the same  *
      * path name as the original files/modules. You must not alter or *
      * delete any copyright information in the Samples.               *
      *                                                                *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIMEZONE.

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
