************************************************************************
*   INTERNAL TABLES
************************************************************************
DATA: lt_mapping  TYPE STANDARD TABLE OF zBarry_emp,    " Bảng nội bộ để lưu trữ dữ liệu từ bảng zBarry_emp
      lt_fieldcat TYPE lvc_t_fcat.                    " Bảng nội bộ cho Field Catalog (mô tả cấu trúc của lưới ALV).

************************************************************************
*   WORK AREAS
************************************************************************
DATA: ls_fieldcat TYPE lvc_s_fcat,                    " Vùng làm việc cho một dòng trong Field Catalog
      ls_mapping  TYPE zBarry_emp,                   " Vùng làm việc cho một dòng trong bảng zBarry_emp
      lw_layout   TYPE lvc_s_layo.                   " Vùng làm việc cho cấu trúc Layout của lưới ALV.

************************************************************************
*   REFERENCE OBJECT
************************************************************************
DATA:  r_container TYPE REF TO cl_gui_custom_container,  " Tham chiếu đến custom container để chứa grid ALV
       r_grid      TYPE REF TO cl_gui_alv_grid.          " Tham chiếu đến grid ALV.

************************************************************************
*   Field symbol
************************************************************************
FIELD-SYMBOLS: <ls_fieldcat>   TYPE lvc_s_fcat.           " Field symbol để trỏ đến một cấu trúc dữ liệu trong Field Catalog.

************************************************************************
*   START-OF-SELECTION.
************************************************************************
START-OF-SELECTION.
  SELECT *
    FROM zBarry_emp
    INTO TABLE lt_mapping
    UP TO 20 ROWS.                                      " Lấy dữ liệu từ bảng zBarry_emp vào bảng nội bộ lt_mapping
* Gọi màn hình 200
  CALL SCREEN 200.

MODULE status_0200 OUTPUT.
  SET PF-STATUS 'PF-STATUS'.                            " Thiết lập PF-STATUS
  SET TITLEBAR 'TITLE'.                                 " Thiết lập TITLEBAR
  CREATE OBJECT r_container                            " Tạo custom container để chứa grid ALV
    EXPORTING
      container_name = 'CUSTOM_1'.
  CREATE OBJECT r_grid                                  " Tạo grid ALV
    EXPORTING
      i_parent = r_container.

* Tạo Field Catalog
  ls_fieldcat-fieldname = 'EMP_FNAME'.                 " Thiết lập các thuộc tính cho cột 'EMP_FNAME'
  ls_fieldcat-tabname   = 'zBarry_emp'.
  ls_fieldcat-seltext   = 'Employee Name'.
  ls_fieldcat-edit      = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'EMP_LNAME'.                " Thiết lập các thuộc tính cho cột 'EMP_LNAME'
  ls_fieldcat-tabname   = 'zBarry_emp'.
  ls_fieldcat-seltext   = 'Employee Last Name'.
  ls_fieldcat-edit      = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.
  CALL METHOD r_grid->set_table_for_first_display     " Hiển thị dữ liệu trong grid ALV
    EXPORTING
      i_structure_name              = 'zBarry_emp'
      i_save                        = 'A'
      i_default                     = abap_true
      is_layout                     = lw_layout
    CHANGING
      it_outtab                     = lt_mapping
      it_fieldcatalog               = lt_fieldcat
    EXCEPTIONS
      invalid_parameter_combination = 1
      program_error                 = 2
      too_many_lines                = 3
      OTHERS                        = 4.
  IF sy-subrc <> 0.
* Xử lý lỗi nếu có
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.
      LEAVE TO SCREEN 0.
    WHEN 'SAVE'.
      DATA: lt_t_row TYPE lvc_t_row,                  " Bảng nội bộ cho các hàng đã chọn trong lưới ALV
            ls_t_row LIKE LINE OF lt_t_row.
      FIELD-SYMBOLS: <fs_changed_data> LIKE LINE OF lt_mapping.
      CALL METHOD r_grid->check_changed_data.          " Kiểm tra xem dữ liệu đã thay đổi trong lưới ALV hay không
      CALL METHOD r_grid->get_selected_rows           " Lấy các hàng đã chọn trong lưới ALV
        IMPORTING
          et_index_rows = lt_t_row.
      LOOP AT lt_t_row INTO ls_t_row.
        READ TABLE lt_mapping ASSIGNING <fs_changed_data> INDEX ls_t_row-index.  " Đọc dữ liệu đã thay đổi từ bảng nội bộ
        IF sy-subrc = 0.
          MODIFY zBarry_emp FROM  <fs_changed_data>.    " Cập nhật dữ liệu trong bảng zBarry_emp
        ENDIF.
      ENDLOOP.
  ENDCASE.
ENDMODULE.


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