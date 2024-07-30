PARAMETERS: p_date TYPE dats.
DATA: lv_date TYPE num4.
lv_date = p_date.
IF lv_date MOD 4 = 0.
    IF lv_date MOD 100 = 0.
        IF lv_date MODE 400 = 0.
            WRITE: 'Leap Year'.
        ELSE.
            WRITE: 'Not a Leap Year'.
        ENDIF.
    ELSE.
        WRITE: 'Leap Year'.
    ENDIF.
ELSE.
    WRITE: 'Not a Leap Year'.
ENDIF.