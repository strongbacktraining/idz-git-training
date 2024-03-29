000050 01  SUPPLR-BAL-REC.                                              00000500
000060                                                                  00000600
000070     05  SUPPLR-BAL-SUPPLR-NO               PIC  X(03).           00000700
000080     05  SUPPLR-BAL-GROSS-REC               PIC S9(09)V99 COMP-3. 00000800
000090     05  SUPPLR-BAL-NET-REC                 PIC S9(09)V99 COMP-3. 00000900
000100                                                                  00001000
000110**** THE DATE IN THIS COPYBOOK IS IN MMDDYY FORMAT                00001100
000120                                                                  00001200
000130     05  SUPPLR-BAL-DATE                    PIC  9(06)    COMP-3. 00001300
000140     05  SUPPLR-BAL-BILLING-11-30          PIC S9(09)V99 COMP-3.  00001400
000150     05  SUPPLR-BAL-BILLING-31-60          PIC S9(09)V99 COMP-3.  00001500
000160     05  SUPPLR-BAL-BILLING-61-90          PIC S9(09)V99 COMP-3.  00001600
000170     05  SUPPLR-BAL-BILLING-91-180         PIC S9(09)V99 COMP-3.  00001700
000180     05  SUPPLR-BAL-BILLING-181-UP         PIC S9(09)V99 COMP-3.  00001800
000190     05  SUPPLR-BAL-DISPUTE                 PIC S9(09)V99 COMP-3. 00001900
000200     05  SUPPLR-BAL-OSD                     PIC S9(09)V99 COMP-3. 00002000
000210     05  SUPPLR-BAL-LOC1                    PIC S9(09)V99 COMP-3. 00002100
000220     05  SUPPLR-BAL-RET-CK                  PIC S9(09)V99 COMP-3. 00002200
000230     05  SUPPLR-BAL-4XX                     PIC S9(09)V99 COMP-3. 00002300
000240     05  SUPPLR-BAL-MATURED-GROSS           PIC S9(09)V99 COMP-3. 00002400
000250     05  SUPPLR-BAL-MATURED-NET             PIC S9(09)V99 COMP-3. 00002500
000260     05  SUPPLR-BAL-BILLING-11-30-G        PIC S9(09)V99 COMP-3.  00002600
000270     05  SUPPLR-BAL-BILLING-31-60-G        PIC S9(09)V99 COMP-3.  00002700
000280     05  SUPPLR-BAL-BILLING-61-90-G        PIC S9(09)V99 COMP-3.  00002800
000290     05  SUPPLR-BAL-BILLING-91-180-G       PIC S9(09)V99 COMP-3.  00002900
000300     05  SUPPLR-BAL-BILLING-181-UP-G       PIC S9(09)V99 COMP-3.  00003000
000310     05  SUPPLR-BAL-DISPUTE-G               PIC S9(09)V99 COMP-3. 00003100
000320     05  SUPPLR-BAL-OSD-G                   PIC S9(09)V99 COMP-3. 00003200
000330     05  SUPPLR-BAL-LOC1-G                  PIC S9(09)V99 COMP-3. 00003300
000340     05  SUPPLR-BAL-CATALOG-002             PIC S9(09)V99 COMP-3. 00003400
000350     05  SUPPLR-BAL-CLAIM-G                 PIC S9(09)V99 COMP-3. 00003500
000360     05  SUPPLR-BAL-WREHOUSE-NO             PIC  9(07)    COMP-3. 00003600
000361     05  SUPPLR-BAL-NET-SHIPPER-11-30       PIC S9(09)V99 COMP-3.
000363     05  SUPPLR-BAL-NET-SHIPPER-31-60       PIC S9(09)V99 COMP-3.
000364     05  SUPPLR-BAL-NET-SHIPPER-61-90       PIC S9(09)V99 COMP-3.
000365     05  SUPPLR-BAL-NET-SHIPPER-91-120      PIC S9(09)V99 COMP-3.
000366     05  SUPPLR-BAL-NET-SHIPPER-121-180     PIC S9(09)V99 COMP-3.
000367     05  SUPPLR-BAL-NET-SHIPPER-181-UP      PIC S9(09)V99 COMP-3.
000368     05  SUPPLR-BAL-NET-SHIPPER             PIC S9(09)V99 COMP-3.
000369     05  SUPPLR-BAL-UNSHIPPED-APPR          PIC S9(09)V99 COMP-3.
000420     05  SUPPLR-BAL-UNSHIPPED-BALANCE      PIC S9(09)V99 COMP-3.
000421     05  SUPPLR-BAL-UNPRCE1ED-4XX          PIC S9(09)V99 COMP-3.
000431     05  FILLER                             PIC X(15).
000440                                                                  00003700
000450 01  SUPPLR-BAL-REC-LENGTH                  PIC S9(04)    COMP    00003800
000451                                            VALUE +230.           00003900