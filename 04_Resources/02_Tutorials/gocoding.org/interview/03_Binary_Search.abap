DATA:   wa_data TYPE int4,
        ITAB_data TYPE TABLE OF int4,
        last_num TYPE int1,
        first_num TYPE int1 VALUE 1,
        flag TYPE int1 VALUE 0,
        pos_length TYPE int1.

SELECTION-SCREEN BEGIN OF SCREEN 0100.
SELECT-OPTIONS: s_data FOR wa_data.
PARAMETERS: p_input TYPE int4.
SELECTION-SCREEN END OF SCREEN 0100.

DATA: wa_data LIKE lINE OF s_data.

START-OF-SELECTION.
CALL SELECTION-SCREEN 0100.

LOOP AT s_data INTO wa_data.
  APPEND wa_data-low TO ITAB_data.
ENDLOOP.

DESCRIBE TABLE ITAB_data LINES last_num.
SORT ITAB_data.

pos_length = last_num / 2.
WHILE(first_num <= last_num).
    READ TABLE ITAB_data INTO wa_data INDEX pos_length.
    IF (p_input = wa_data).
        flag = 1.
        EXIT.
    ELSEIF (p_input < wa_data).
        last_num = pos_length - 1.
        pos_length = (first_num + last_num) / 2.
    ELSE.
        first_num = pos_length + 1.
        pos_length = (first_num + last_num) / 2.
    ENDIF.
ENDWHILE.

IF ( flag = 1 ).
    WRITE: 'Hurray! Found your input @ position', pos_length.
ELSE.
    WRITE 'Sorry! Not Found'.
ENDIF.