* Encoding: UTF-8.



    GET
  FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T0 Vragenlijst Braenworks Academy - januari 2018.sav'.

* factoranalyse.
FACTOR
  /VARIABLES Entrskills_0001 Entrskills_0002 Entrskills_0003 Entrskills_0004 Entrskills_0005 Entrskills_0006 Entrskills_0007  
  /MISSING LISTWISE 
  /ANALYSIS Entrskills_0001 Entrskills_0002 Entrskills_0003 Entrskills_0004 Entrskills_0005 Entrskills_0006 Entrskills_0007 
  /PRINT UNIVARIATE INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.35)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES  NfA_0001 NfA_0002 NfA_0003 NfA_0004
  /MISSING LISTWISE 
  /ANALYSIS NfA_0001 NfA_0002 NfA_0003 NfA_0004
  /PRINT UNIVARIATE INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.35)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES  NfA_0001 NfA_0002 NfA_0003 NfA_0004
  /MISSING LISTWISE 
  /ANALYSIS NfA_0001 NfA_0002 NfA_0003 NfA_0004
  /PRINT UNIVARIATE INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.35)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES   LoC_0001 LoC_0002 LoC_0003 LoC_0004 LoC_0005 LoC_0006 
  /MISSING LISTWISE 
  /ANALYSIS  LoC_0001 LoC_0002 LoC_0003 LoC_0004 LoC_0005 LoC_0006 
  /PRINT UNIVARIATE INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.35)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.


FACTOR
  /VARIABLES   TfA_0001 TfA_0002 TfA_0003 TfA_0004
  /MISSING LISTWISE 
  /ANALYSIS TfA_0001 TfA_0002 TfA_0003 TfA_0004
  /PRINT UNIVARIATE INITIAL EXTRACTION ROTATION
  /FORMAT SORT BLANK(.35)
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.



SAVE OUTFILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T0 Vragenlijst Braenworks Academy - januari 2018.sav'.
 
*variabelen van T0 waren al computed. 
*compute variables T1. 

GET
  FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T1  vragenlijst Braenworks Academy - juli 2018.sav'.
DATASET NAME DataSet6 WINDOW=FRONT.


compute Entrepreneurial_skills = (Entrskills_0001 + Entrskills_0002 + Entrskills_0003 + Entrskills_0004 + Entrskills_0005 + Entrskills_0006 + Entrskills_0007)/7.


compute Need_for_achievement  = (NfA_0001 + NfA_0002 + NfA_0004 )/3.
des  Need_for_achievement .

compute Locus_of_Control_Self = (LoC_0001 + LoC_0002 + LoC_0003)/3.
des  Locus_of_Control_Self  .

compute Locus_of_Control_External = (LoC_0004 + LoC_0005 + LoC_0006)/3.
des  Locus_of_Control_External .


compute Tolerance_for_ambiguity = (TfA_0001 + TfA_0002 + TfA_0003 +TfA_0004)/4.



SAVE OUTFILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T1  vragenlijst Braenworks Academy - juli 2018.sav'.


*compute variables T2. 

GET
  FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T2 vragenlijst Braenworks Academy - januari 2019.sav'.
DATASET NAME DataSet7 WINDOW=FRONT.

compute Entrepreneurial_skills = (Entrskills_0001 + Entrskills_0002 + Entrskills_0003 + Entrskills_0004 + Entrskills_0005 + Entrskills_0006 + Entrskills_0007)/7.


compute Need_for_achievement  = (NfA_0001 + NfA_0002 + NfA_0004 )/3.
des  Need_for_achievement .

compute Locus_of_Control_Self = (LoC_0001 + LoC_0002 + LoC_0003)/3.
des  Locus_of_Control_Self  .

compute Locus_of_Control_External = (LoC_0004 + LoC_0005 + LoC_0006)/3.
des  Locus_of_Control_External .


compute Tolerance_for_ambiguity = (TfA_0001 + TfA_0002 + TfA_0003 +TfA_0004)/4.

SAVE OUTFILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T2 vragenlijst Braenworks Academy - januari 2019.sav'.










    GET
  FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T0 Vragenlijst Braenworks Academy - januari 2018.sav'.




ADD FILES /FILE=*
  /FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T1  vragenlijst Braenworks Academy - juli 2018.sav'.



ADD FILES /FILE=*
  /FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T2 vragenlijst Braenworks Academy - januari 2019.sav'.


EXECUTE. 

SAVE OUTFILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T0T1T2 vragenlijst Braenworks Academy.sav'.




GET FILE='\\campus.eur.nl\users\home\49832mve\Documents\Documenten\Lopende '+
    'projecten\Brainworks\data sets\T0T1T2 vragenlijst Braenworks Academy.sav'.

compute intention= (Intention_0001 + Intention_0002 + Intention_0003 + Intention_0004 + Intention_0005 + Intention_0006 + Intention_0007 + Intention_0008 + Intention_0009) / 9.




compute Need_for_achievement_sampleBraenworks = (NfA_0001 + NfA_0002 + NfA_0003 + NfA_0004 )/ 4.
des  Need_for_achievement .























