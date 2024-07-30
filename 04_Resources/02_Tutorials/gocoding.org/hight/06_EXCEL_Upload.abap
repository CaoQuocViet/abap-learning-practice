TYPE_POOLS truxs.
PARAMETERS p_file TYPE rlgrap-filename.
TYPES:  BEGIN OF t_tab,
            filename TYPE char100sm,
        END OF t_tab.
DATA:   t_upload TYPE STANDARD TABLE OF t_tab,
        wa_upload TYPE t_tab,
        it_type TYPE truxs_t_text_data.
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
    CALL FUNCTION 'F4_FILENAME'
        EXPORTING
            field_name = 'p_file'.
        IMPORTING
            file_name = p_file.
START-OF-SELECTION.
    CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
        EXPORTING
            i_tab_raw_data = it_type
            i_filename = p_file
        TABLES
            i_tab_converted_data = t_upload[]
        EXCEPTIONS
            conversion_failed = 1
            OTHERS = 2.
    IF sy-subrc <> 0.
        MESSAGE 'Không thể chuyển đổi tệp tin' TYPE 'E'.
    ENDIF.
END-OF-SELECTION.
    DATA:   ls_cc_impl TYPE zBarry_upload,
            lt_cc_impl TYPE STANDARD TABLE OF zBarry_upload.
    LOOP AT t_upload INTO wa_upload.
        ls_cc_impl-mandt = sy-mandt.
        ls_cc_impl-filename = wa_upload-filename.
        APPEND ls_cc_impl TO lt_cc_impl.
    ENDLOOP.
    MODIFY zBarry_upload FROM TABLE lt_cc_impl.


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