PARAMETERS: p_fname TYPE z1127582_upload-filename LOWER CASE,
            p_path TYPE string LOWER STRING LOWER CASE.
    
DATA:   gs_store_file TYPE z1127582_upload,
        xstr_content TYPE XSTRING,
        gt_content TYPE STANDARD TABLE OF tdline,
        len TYPE i,
        str_fname TYPE STRING.

START-OF-SELECTION.
SELECT SINGLE * FROM z1127582_upload INTO gs_store_file
    WHERE filename = p_fname.
xstr_content = gs_store_file-file_content.
CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
    EXPORTING
        buffer = xstr_content
    IMPORTING
        output_length = len
    TABLES
        binary_tab = gt_content.

IF sy-subrc <> 0.
    MESSAGE 'Không thể chuyển đổi xstring thành nhị phân' TYPE 'E'.
ENDIF.
str_fname = p_fname.
CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING
        bin_filesize = len
        filename = p_path
        filetype = 'BIN'
    TABLES
        data_tab = gt_content
    EXCEPTIONS
        file_write_error = 1
        no_batch = 2
        gui_refuse_filetransfer = 3
        invalid_type = 4
        no_authority = 5
        unknown_error = 6
        header_not_allowed = 7
        separator_not_allowed = 8
        filesize_not_allowed = 9
        header_too_long = 10
        dp_error_create = 11
        dp_error_send = 12
        dp_error_write = 13
        unknown_dp_error = 14
        access_denied = 15
        dp_out_of_memory = 16
        disk_full = 17
        dp_timeout = 18
        file_not_found = 19
        dataprovider_exception = 20
        control_flush_error = 21
        OTHERS = 22.
IF sy-subrc <> 0.
    MESSAGE 'Không thể tải xuống tệp tin' TYPE 'E'.
ENDIF.


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