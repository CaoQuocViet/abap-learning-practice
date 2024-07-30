" Palindrome Characters/String/Number (12321, MADAM...)

PARAMETERS: lv_data1(10) TYPE c.
DATA: lv_data2(10) TYPE c.
CALL FUNCTION 'STRING_REVERSE'
    EXPORTING
        string = lv_data1
        lang = sy-langu
    IMPORTING
    RSTRING = lv_data2
* EXCEPTIONS    " Xu ly ngoai le
* TOO_SMALL = 1 " Ngoai le 1
* OTHERS = 2    " Ngoai le 2
IF lv_data1 EQ lv_data2.
    WRITE: 'Palindrome Number'.
ELSE.
    WRITE: 'Not a Palindrome Number'.
ENDIF.