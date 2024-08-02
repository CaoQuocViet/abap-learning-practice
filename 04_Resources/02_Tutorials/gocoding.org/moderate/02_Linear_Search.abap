DATA:   wa_data TYPE int4,
        ITAB_data TYPE TABLE OF int4,
        lv_lines TYPE sy-tfill,
        flag TYPE int1 VALUE 0,
        pos TYPE sy-tabix.  " Sử dụng sy-tabix thay vì int1 để lưu vị trí của dòng

SELECTION-SCREEN BEGIN OF SCREEN 0100.
SELECTION-OPTIONS: s_data FOR wa_data.
PARAMETERS: p_input TYPE int4.
SELECTION-SCREEN END OF SCREEN 0100.
DATA: wa_data LIKE LINE OF s_data.

START-OF-SELECTION.
CALL SELECTION-SCREEN 0100.

" Chuyển dữ liệu từ selection-options sang bảng ITAB_data
LOOP AT s_data INTO wa_data.
    APPEND wa_data TO ITAB_data.
ENDLOOP.

" Lấy số dòng của bảng ITAB_data
DESCRIBE TABLE ITAB_data LINES lv_lines.

" Duyệt qua từng phần tử trong bảng ITAB_data để tìm kiếm giá trị
LOOP AT ITAB_data INTO wa_data.
    IF ( wa_data = p_input ).
        flag = 1.  " Gán flag = 1 nếu tìm thấy giá trị
        pos = sy-tabix.  " Gán vị trí của giá trị tìm thấy
        EXIT.  " Thoát khỏi vòng lặp khi tìm thấy giá trị
    ENDIF.
ENDLOOP.

" Kiểm tra flag để xác định xem có tìm thấy giá trị hay không và hiển thị thông báo tương ứng
IF ( flag = 1 ).
    WRITE: 'Hurray! Found your input @ position', pos.
ELSE.
    WRITE 'Sorry, not found'.
ENDIF.