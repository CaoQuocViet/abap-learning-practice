*&---------------------------------------------------------------------*
*& Report  Z_DATE
*&---------------------------------------------------------------------*
*& shows date operations performed in ABAP application program
*&---------------------------------------------------------------------*

REPORT  Z_DATE_AND_TIME.

* Declaring required date fields
DATA: W_DATE1 TYPE D,
      W_DATE2 TYPE D.

* Assigning system date to W_DATE1
W_DATE1 = SY-DATUM.
WRITE: / 'Current Date:', W_DATE1.

* Adding 365 days to W_DATE1
W_DATE2 = W_DATE1 + 365.
WRITE: / 'Date after 1 year:', W_DATE2.

* Comparing date1 and date2
IF W_DATE1 > W_DATE2.
    WRITE: / W_DATE1 DD/MM/YYYY, 'is greater than', W_DATE2 DD/MM/YYYY.
ELSE.
    WRITE: / W_DATE1 DD/MM/YYYY, 'is less than', W_DATE2 DD/MM/YYYY.
ENDIF.

* Output:
* Current Date: 02082024
* Date after 1 year: 02082025
* 02.08.2024 is less than 02.08.2025

*======================================================================*

DATA: W_TIME1 TYPE T,
      W_TIME2 TYPE T.

* Assigning system time to W_TIME1
W_TIME1 = SY-UZEIT.
WRITE /(60) W_TIME1 USING EDIT MASK 'The current time is: __:__:__'.

* Adding 10 minutes to W_TIME1 (in seconds = 600)
W_TIME2 = W_TIME1 + 600.
WRITE /(60) W_TIME2 USING EDIT MASK 'Time after 10 minutes is: __:__:__'.

* Comparing time1 and time2
IF W_TIME1 > W_TIME2.
    WRITE: / W_TIME1, 'is greater than', W_TIME2.
ELSE.
    WRITE: / W_TIME1, 'is less than', W_TIME2.
ENDIF.

* Output:
* The current time is: 12:00:00
* Time after 10 minutes is: 12:10:00
* 120000 is less than 121000