*&---------------------------------------------------------------------*
*& Report  Z_TIMESTAMPS
*&---------------------------------------------------------------------*
*& shows timestamp usage in ABAP application program
*&---------------------------------------------------------------------*

REPORT  Z_TIMESTAMPS.

* Declaring variables of type timestamp.
DATA: W_STS TYPE TIMESTAMP, " Short timestamp
      W_LTS TYPE TIMESTAMPL. " Long timestamp

*Assigning timestamp to short timestamp variable
GET TIME STAMP FIELD W_STS.
WRITE: / 'Shorthand TimeStamp : ', W_STS TIME ZONE SY-ZONLO. " múi giờ của máy chủ SAP

*Assigning timestamp to long timestamp variable
GET TIME STAMP FIELD W_LTS.
WRITE: / 'Longhand TimeStamp  : ', W_LTS TIME ZONE SY-ZONLO.

* Output:
* Shorthand TimeStamp : 02.08.2024 10:55:59
* Longhand TimeStamp  : 02.08.2024 10:55:59,2679940

*======================================================================*

* Converting Date & Time to Timestamp or vice versa 

* Declaring require variables
DATA:   W_DATE1 TYPE D,
        W_DATE2 TYPE D,
        W_TIME1 TYPE T,
        W_TIME2 TYPE T,
        W_STS1 TYPE TIMESTAMP,
        W_LTS1 TYPE TIMESTAMPL.

* Assigning current date to W_DATE1
W_DATE1 = SY-DATUM.
WRITE: / 'Current Date W_DATE1: ', W_DATE1 DD/MM/YYYY.

* Assigning current time to W_TIME1
W_TIME1 = SY-UZEIT.
WRITE /(60)  W_TIME1 USING EDIT MASK 'The current time is: __:__:__'.

* Converting Date & Time to Timestamp
" W_STS1 = W_DATE1 && W_TIME1.
CONVERT DATE W_DATE1 TIME W_TIME1
        INTO TIME STAMP W_LTS1 TIME ZONE SY-ZONLO.
WRITE: / 'Converted TimeStamp from Date and time W_LTS: ',
        W_LTS1 TIME ZONE SY-ZONLO.

* Assigning current timestamp to W_STS1
GET TIME STAMP FIELD W_STS1.
WRITE: / 'Current TimeStamp W_STS1: ', W_STS1 TIME ZONE SY-ZONLO.

* Splitting Timestamp to Date & Time
" SPLIT W_STS1 AT ' ' INTO W_DATE2 W_TIME2.
CONVERT TIME STAMP W_STS1 TIME ZONE SY-ZONLO
        INTO DATE W_DATE2 TIME W_TIME2.
WRITE: / 'Converted Date W_DATE2: ', W_DATE2 DD/MM/YYYY,
        /(60) W_TIME2 USING EDIT MASK 'Converted Time W_TIME2: __:__:__'.

* Output:
* Current Date W_DATE1: 02.08.2024
* The current time is: 10:55:59
* Converted TimeStamp from Date and time W_LTS: 02.08.2024 10:55:59,2679940
* Current TimeStamp W_STS1: 02.08.2024 08:55:59
* Converted Date W_DATE2: 02.08.2024
* Converted Time W_TIME2: 10:05:59

" Khác  biệt thười gian là do múi giờ của máy chủ SAP