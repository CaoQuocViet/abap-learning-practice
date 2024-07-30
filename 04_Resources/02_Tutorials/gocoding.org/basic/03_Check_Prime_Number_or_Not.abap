PARAMETERS p_num TYPE int2.
DATA:   lv_check TYPE int2 VALUE 2,
        lv_flags TYPE int1 VALUE 0,
        lv_length TYPE c.
IF p_num EQ 1.
    MESSAGE '1 is neither Prime nor Composite' TYPE 'I'.
ELSEIF p_num IS INITIAL.
    MESSAGE 'Input cannot be empty or 0' TYPE 'I'.
ELSE.
    WHILE lv_check <= p_num / 2.
        IF (p_num MOD lv_check) EQ 0.
            lv_flags = 1.
            EXIT.
        ENDIF.
        lv_check = lv_check + 1.
    ENDWHILE.
    IF lv_flags EQ 0.
        WRITE 'Prime'.
    ELSE.
        WRITE 'Not Prime: Composite'.
    ENDIF.
ENDIF.
