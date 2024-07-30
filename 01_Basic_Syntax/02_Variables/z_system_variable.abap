*&---------------------------------------------------------------------*
*& Report  Z_SYSTEM_VARIABLE
*&---------------------------------------------------------------------*
*& Write a simple program to display some of the system variables
*&---------------------------------------------------------------------*

REPORT  Z_SYSTEM_VARIABLE.

* Displaying some of the system variables
WRITE:/'SY-ABCDE', SY-ABCDE,
      /'SY-DATUM', SY-DATUM,
      /'SY-DBSYS', SY-DBSYS,
      /'SY-LANGU', SY-LANGU,
      /'SY-MANDT', SY-MANDT,
      /'SY-OPSYS', SY-OPSYS,
      /'SY-SAPRL', SY-SAPRL,
      /'SY-TCODE', SY-TCODE.