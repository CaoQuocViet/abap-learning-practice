" Agenda:
" 1. General ABAP syntaxes
" 2. Elementary ABAP data objects
" 3. Basic ABAP statements

" =================================================================

" Khong phan biet hoa thuong

" 1. General ABAP syntaxes
" Example Program:

PARAMETERS: pa_num TYPE i.

DATA gv_result TYPE i.
MOVE pa_num TO gv_result.
ADD i TO gv_result.

WRITE 'Your input: '.
WRITE pa_num.

NEW-LINE.
WRITE 'Result: '.
WRITE gv_result.

" Viet gon
PARAMETERS: pa_num TYPE i.

DATA gv_result TYPE i.
MOVE pa_num 
    TO gv_result.
ADD i TO gv_result.

WRITE: 'Your input: ', pa_num.

NEW-LINE.
WRITE: 'Result: ', gv_result.

" =========================================================================================================
" =========================================================================================================

" 2. Elementary ABAP data objects

" Complete data types:
" D: date, fix 8 (YYYYMMDD)
" T: time, fix 6 (HHMMSS)
" I, INT8: integer (I fix 4 byte and INT8 fix 8 byte)
" F: floating poin fixx 8
" STRING: dynamic length character string
" XSTRING: Binary data, dynamic length byte
" DECFLOAT16, DECFLOAT34: floating poin dynamic length

" Incomplete data types:
" C: type of character string
" N: Type of numerical character string
" X: Binary data
" P: Xac dinh do dai phan nguyen va do dai phan thap phan


" Declaration of local Types:
" Program:
REPORT ...
Declaration of local data types

TYPES tv_c_type TYPE c LENGTH 8.
TYPES tv_n_type TYPE n LENGTH 5.
TYPES tv_p_type TYPE p length 3 DECIMALS 2.

" Local variable
*&---------------------------------------------------------------------*
*& Report  Z_LOCAL
*&---------------------------------------------------------------------*
*& Program Written by GEEKSFORGEEKS
*&---------------------------------------------------------------------*

REPORT  Z_LOCAL.

" Loop for 10 times.
DO 10 TIMES.
    " Perform Subtraction subroutine.
    PERFORM subtraction.
ENDDO.

" Subroutine subtraction coding,
FORM subtraction.
    " Initializing local variable.
    DATA lv_local TYPE I VALUE 101.

    " subtracting 1 to local variable.
    lv_local = lv_local -1.

    " Display.
    WRITE: / lv_local.
ENDFORM.

" Output:
" 100
" 100
" 100
" 100
" 100
" 100
" 100
" 100
" 100
" 100

" Static variable
*&---------------------------------------------------------------------*
*& Report  Z_STATIC
*&---------------------------------------------------------------------*
*& Program Written by GEEKSFORGEEKS
*&---------------------------------------------------------------------*

REPORT  Z_STATIC.

" Loop for 8 times.
DO 8 TIMES.
    " Preform addition Subroutine.
    PERFORM addition.
ENDDO.

" Subroutine addition declaration and coding.
FORM addition.
    " Initializing static variable.
    STATICS lv_static TYPE I VALUE 99.

    " Adding 1 to static variable.
    lv_static = lv_static +1.

    " Display.
    WRITE: / lv_static.
ENDFORM.

" Output:
" 100
" 101
" 102
" 103
" 104
" 105
" 106
" 107

" Reference variable
*&---------------------------------------------------------------------*
*& Report  Z_REFERENCE
*&---------------------------------------------------------------------*
*& Program Written by GEEKSFORGEEKS
*&---------------------------------------------------------------------*

REPORT  Z_REFERENCE.

" Local variable lv_number declaration.
DATA: lv_number TYPE I VALUE 7.

" Local reference variable lr_number declaration
DATA: lr_number TYPE REF TO I.

" Displaying the local variable number before referencing
WRITE: 'lv_number value before referencing', lv_number.

" Referencing lr_number to lv_number.
GET REFERENCE OF lv_number INTO lr_number.

" Changing the value of lv_number using the reference variable lr_number
lr_number->* = 9.

" Dispalying the local variable number affter referancing & value change
WRITE: / 'lv_number value affter referencing ', lv_number.

" Output:
" lvl_number value before referencing     7
" lvl_number value after referencing        9  


" System Variable:
" SY-UNAME: The current user’s ID.
" SY-DATUM: Today’s date.
" SY-UZEIT: This is the current time.
" SY-INDEX: The current loop’s index.
" SY-SUBRC: The last operation’s return code.
" SY-TABIX: The current line’s index in an internal table.
" SY-CPROG: The current program’s name.
" SY-TCODE: The transaction code of the current transaction.
" SY-LSIND: A LOOP indicator at an internal table.
" SY-LSLSP: A nested internal table LOOP indicator.

*&---------------------------------------------------------------------*
*& Report  Z_SYSTEM_VARIABLE
*&---------------------------------------------------------------------*
*& Program Written by GEEKSFORGEEKS
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

" Output:
" SY-ABCDE ABCDEFGHIJKLMNOPQRSTUVWXYZ
" SY-DATUM 06.10.2023
" SY-DBSYS MSSQL
" SY-LANGU EN
" SY-MANDT 800
" SY-OPSYS Windows NT
" SY-SAPRL 702
" SY-TCODE SE38


" Structured variables.
*&---------------------------------------------------------------------*
*& Report  Z_STRUCTURE_VARIABLE
*&---------------------------------------------------------------------*
*& Program Written by GEEKSFORGEEKS
*&---------------------------------------------------------------------*

REPORT  Z_STRUCTURE_VARIABLE.

" Declaring student structure with student no, student name and student class.
DATA:   BEGIN OF student,
        no          TYPE n,
        name(25)    TYPE c,
        class(10)   TYPE c,
        END OF student.

" Assigning value to student no
MOVE 1 TO student-no.

" Assigning value to student name
MOVE 'Viet' TO student-name.

" Assigning value to student class
MOVE '3rdclass' TO student-class.

" Displaying student structure details by using structure appeding
WRITE:  'student-no: ', student-no,
        /'student-name: ', student-name,
        /'student-class: ', student-class.

" Output:
" student-no    : 1
" student-name  : Ashish
" student-class : 3rd Class

" =========================================================================================================
" =========================================================================================================
" 3. Basic ABAP statements

" Convert type
" string to interger:
DATA: lv_string TYPE string VALUE '123'.
DATA: lv_integer TYPE i.

lv_integer = lv_string.

" interger to string:
DATA: lv_integer TYPE i VALUE 123.
DATA: lv_string TYPE string.

lv_string = lv_integer.

" WITE and SKIP
" Ex1:
DATA: lv_name TYPE string VALUE 'John',
      lv_age TYPE i VALUE 30.

WRITE: / 'Name:', lv_name, / 'Age:', lv_age.

SKIP. " Move to next line

WRITE: / 'Additional information...'. 

" Ex2:
REPORT demo_write_skip.\

DATA:   lv_name TYPE string VALUE 'Jonh',
        lv_age TYPE i VALUE 30,
        lv_address TYPE string VALUE '123 Main Street',
        lv_salary TYPE p DECIMALS 2 VALUE '5000.00'.

WRITE:  'Employee Infomartion: ', /, /,
        'Name: ', lv_name, /,
        'Age: ', lv_age, /,
        'Address: ', lv_address, /,
        'Salry: ', lv_salry.
SKIP.
WRITE:  'Additional information: ', /,
        'Employee ID: ', 'ER12345', /,
        'Department: ', 'IT01', /,
        'Position: ', 'Developer'.
SKIP 2.
WRITE: 'End of report'.

" OUTPUT:
" Employee Information:

" Name: John
" Age: 30
" Address: 123 Main Street
" Salary: 5000.00

" Additional Information:
" Employee ID: E12345
" Department: IT
" Position: Developer

" End of report


" Text Symbol: managed sting of text => easy to read, maintenance, translate to many language
CONSTANTS: c_text TYPE c VALUE 'Text Symbol'.
WRITE: / TEXT-c_text.

"Show message defined in Text Symbol c_text
MESSSAGE i001(TEXT-c_text).

" Translate text symbol
REPORT demo_text_symbol.

" Declare Text Symbol: table to contain text data
TABLES: t100.

" Define Text Symbol
INCLUDE rs_text SYNTAX SHORT TEXT-001 = 'Hello World!'.

" Use Text Symbol
WRITE: / TEXT-001.

" Use TS in Message
"Show message defined in Text Symbol 001
MESSSAGE i001(TEXT-001),


" MESSSAGE Statement
" Ex1:
REPORT ...
PARAMETERS: P_INPUT1 TYPE STRING.
" Lose spaces
WRITE: 'Hello World! ' && P_INPUT1.
" Keep spaces
WRITE: |Hello World! | && P_INPUT1.
" Auto-space
WRITE: 'Hello World!'.
WRITE: P_INPUT1.

" Ex2:
IF P_INPUT1 = '123'.
    MESSSAGE 'This is an ERROR!' TYPE 'E'.
ELSE.
    WRITE: 'Hello World!'.
    WRITE: P_INPUT1.

    MESSSAGE 'Print Hello World Sucessfully!' TYPE 'S'.
ENDIF.

" Ex3:
REPORT ...

DATA: gdf_msg_typ TYPE syst_msgty.

PARAMETERS: rb_smsg RADIOBUTTON GROUP grp1 DEFAULT 'X',
            rb_wmsg RADIOBUTTON GROUP grp1,
            rb_emsg RADIOBUTTON GROUP grp1,
            rb_imsg RADIOBUTTON GROUP grp1,
            rb_zmsg RADIOBUTTON GROUP grp1,
            rb_xmsg RADIOBUTTON GROUP grp1.

SELECTION-SCREEN SKIP 2.

PARAMETERS: rb_sel RADIOBUTTON GROUP grp2 DEFAULT 'X'.
PARAMETERS: rb_rep RADIOBUTTON GROUP grp2.
PARAMETERS: rb_idms RADIOBUTTON GROUP grp2.

AT SELECTION-SCREEN.
    CASE abap_on.
        WHEN rb_smsg.    
            gdf_msg_typ = 'S'." Successful Message
        WHEN rb_wmsg.    
            gdf_msg_typ = 'W'." Warning Message
        WHEN rb_emsg.    
            gdf_msg_typ = 'E'." Error Message
        WHEN rb_imsg.    
            gdf_msg_typ = 'I'." Informational Message
        WHEN rb_zmsg.    
            gdf_msg_typ = 'A'." Abort Message
        WHEN rb_xmsg.    
            gdf_msg_typ = 'X'." Short-dump Message (Exceptions)
        WHEN OTHERS.
    ENDCASE.
" Input screen message
IF rb_sel = abap_on.
    MESSSAGE 'This is message content!' TYPE gdf_msg_typ.
ENDIF.

WRITE 'This is the REPORT PAGE'.
" Output screen message
IF rb_rep = abap_on.
    MESSSAGE 'This is the message content!' TYPE gdf_msg_typ.
ELSE.

ENDIF.

" Dung he thong quan ly message
" Message class
IF rb_idms = abap_on.
    MESSSAGE ID 'YFA2101' TYPE gdf_msg_typ NUMBER 000 WITH sy-uname.
ENDIF.

" DISPLAY LIKE co the khong buoc tat chuong trinh khi gap message E
" Ex: DISPLAY LIKE W.

" Dung ULINE de ve table


" Value Assignments
" Use 'MOVE TO' or '=' (now don't use MOVE TO)

" Assign value to variable:
DATA: lv_variable TYPE i.
lv_variable = 10.

" Assign value from one variable to another:
DATA:   lv_source TYPE i VALUE 5,
        ls_destination TYPE i.
lv_destination = ls_source.

" Assign value from a constant to variable:
CONSTANTS: lc_constant TYPE i VALUE 100.
lv_variable = lc_constant.

" Assigning a value from an expression(bieu thuc) to a variable:
DATA:   lv_number1 TYPE i VALUE 5,
        lv_number2 TYPE i VALUE 3,
        lv_result TYPE i.
lv_result = lv_number1 + lv_number2.



"                       _oo0oo_
"                      o8888888o
"                      88" . "88
"                      (| -_- |)
"                      0\  =  /0
"                    ___/`---'\___
"                  .' \\|     |// '.
"                 / \\|||  :  |||// \
"                / _||||| -:- |||||- \
"               |   | \\\  -  /// |   |
"               | \_|  ''\---/''  |_/ |
"               \  .-\__  '-'  ___/-. /
"             ___'. .'  /--.--\  `. .'___
"          ."" '<  `.___\_<|>_/___.' >' "".
"         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
"         \  \ `_.   \_ __\ /__ _/   .-` /  /
"     =====`-.____`.___ \_____/___.-`___.-'=====
"                       `=---='