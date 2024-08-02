DATA: wa_data TYPE int4,
      ITAB_data TYPE TABLE OF int4,
      lv_lines TYPE int1,
      flag TYPE int1 VALUE 0,
      pos TYPE int1.

SELECTION-SCREEN BEGIN OF SCREEN 0100. "Tạo màn hình 0100
SELECT-OPTIONS: s_data FOR wa_data. "Lựa chọn nhiều giá trị đầu vào
PARAMETERS: p_input TYPE int4. "Tham số đầu vào

SELECTION-SCREEN END OF SCREEN 0100.

DATA: wa_sdata LIKE LINE OF s_data.

START-OF-SELECTION.
CALL SELECTION-SCREEN 0100.

LOOP AT s_data INTO wa_sdata.
  APPEND wa_sdata-low TO ITAB_data.
ENDLOOP.

DESCRIBE TABLE ITAB_data LINES lv_lines. "Lấy số lượng bản ghi

LOOP AT ITAB_data INTO wa_data.
  IF ( wa_data = p_input ).
    flag = 1.
    pos = sy-tabix.
    EXIT.
  ENDIF.
ENDLOOP.

IF ( flag = 1 ).
  WRITE: 'Hurray! Found your input @ position', pos.
ELSE.
  WRITE 'Sorry! Not Found'.
ENDIF.