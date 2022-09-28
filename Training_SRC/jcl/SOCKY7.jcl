//$TSOID JOB ,
// MSGCLASS=H,MSGLEVEL=(1,1),TIME=(,4),REGION=144M,COND=(16,LT)
//JOBLIB DD DSN=DSNC10.SDSNLOAD,DISP=SHR
//       DD DSN=FELE10.SFELLOAD,DISP=SHR
//       DD DSN=DSNC10.SDSNEXIT.OLD,DISP=SHR
//*
//        SET FELJOB=CMPLNKDB
//STP0000 EXEC PROC=ELAXFCOC,
// CICS=,
// DB2=,
// COMP=
//COBOL.SYSPRINT DD DISP=SHR,
//        DSN=$TSOID.CLASS.LIST(SOCKY7)
//COBOL.SYSDEBUG DD DISP=SHR,
//        DSN=$TSOID.CLASS.SYSDEBUG(SOCKY7)
//COBOL.SYSLIN DD DSN=&&OBX0000,
//        UNIT=SYSDA,DISP=(MOD,PASS),SPACE=(TRK,(3,3)),
//        DCB=(RECFM=FB,LRECL=80)
//COBOL.SYSLIB DD DISP=SHR,
//        DSN=$TSOID.CLASS.COPYLIB
//COBOL.SYSXMLSD DD DUMMY
//COBOL.SYSIN DD DISP=SHR,
//        DSN=$TSOID.CLASS.COBOL(SOCKY7)
//*
//******* ADDITIONAL JCL FOR COMPILE HERE ******
//LKED EXEC PROC=ELAXFLNK
//LINK.SYSLIB DD DSN=$TSOID.CLASS.BACKUP.COBOL,
//        DISP=SHR
//        DD DSN=CEE.SCEELKED,
//        DISP=SHR
//LINK.OBJ0000 DD DSN=&&OBX0000,DISP=(SHR,PASS)
//LINK.SYSLIN DD *
     INCLUDE OBJ0000
/*
//LINK.SYSLMOD   DD  DISP=SHR,
//        DSN=$TSOID.CLASS.LOAD(SOCKY7)
//*
//******* ADDITIONAL JCL FOR LINK HERE ******
//GO    EXEC   PROC=ELAXFGO,GO=SOCKY7,
//        LOADDSN=$TSOID.CLASS.LOAD
//CEEOPTS DD *
TEST(,,,DBMDT%$TSOID:*)
/*
//******* ADDITIONAL RUNTIME JCL HERE ******
//
