"Chương trình thực hiện các hoạt động CRUD (Tạo, Đọc, Cập Nhật, Xóa) trên bảng dữ liệu nhân viên

TABLES: zBarry_emp. "Bảng Dữ Liệu Nhân Viên
DATA: 
  lt_itab   TYPE TABLE OF zBarry_emp,  "Bảng nội bộ cho chi tiết cơ bản nhân viên
  lwa_emp   TYPE zBarry_emp, "Workarea cho bảng chi tiết cơ bản nhân viên
  lt_itab1  TYPE TABLE OF zBarry_add, "Bảng nội bộ cho chi tiết địa chỉ nhân viên
  lwa_emp1  TYPE zBarry_add, "Workarea cho bảng chi tiết địa chỉ nhân viên
  lt_itab2  TYPE TABLE OF zBarry_sal,  "Bảng nội bộ cho chi tiết lương nhân viên
  lwa_emp2  TYPE zBarry_sal, "Workarea cho bảng chi tiết lương nhân viên
  total_sal TYPE zBarry_salary, "tổng lương
  tax       TYPE zBarry_salary, "tổng thuế
  c         TYPE zBarry_salary, "phần trăm thuế
  inhand    TYPE zBarry_salary. "lương ròng
PARAMETER: p_empid TYPE char8. "Tham số cho ID nhân viên

SELECTION-SCREEN BEGIN OF BLOCK blk1 WITH FRAME TITLE text-101. "khối màn hình chọn
PARAMETERS:
  p_rad1 RADIOBUTTON GROUP rg1 USER-COMMAND flag DEFAULT 'X',
  p_rad2 RADIOBUTTON GROUP rg1,
  p_rad3 RADIOBUTTON GROUP rg1,
  p_rad4 RADIOBUTTON GROUP rg1.
SELECTION-SCREEN END OF BLOCK blk1.

PARAMETERS:
  p_fname TYPE char20 MODIF ID pa1, "tham số cho tên
  p_lname TYPE char20 MODIF ID pa2, "tham số cho họ
  p_city  TYPE char20 MODIF ID pa3. "tham số cho thành phố

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    CASE screen-group1. "lựa chọn tham số dựa trên việc chọn nút radio
      WHEN 'PA1'.
        IF p_rad1 = 'X'.
          screen-active = '0'.
        ENDIF.
        IF p_rad2 = 'X'.
          screen-active = '1'.
        ENDIF.
        IF p_rad3 = 'X'.
          screen-active = '1'.
        ENDIF.
        IF p_rad4 = 'X'.
          screen-active = '0'.
        ENDIF.
        MODIFY SCREEN.
      WHEN 'PA2'.
        "Tương tự cho các tham số khác
    ENDCASE.
  ENDLOOP.

AT SELECTION-SCREEN ON RADIOBUTTON GROUP rg1. "Tự động điền dữ liệu vào tham số
  IF p_rad3 EQ 'X'. "nếu nút cập nhật được chọn
    SELECT emp_fname emp_lname
      FROM zBarry_emp
      INTO CORRESPONDING FIELDS OF TABLE lt_itab
      WHERE empid = p_empid.
    IF sy-subrc = 0.
      LOOP AT lt_itab INTO lwa_emp.
        p_fname = lwa_emp-emp_fname.
        p_lname = lwa_emp-emp_lname.
      ENDLOOP.
    ENDIF.
  ENDIF.

START-OF-SELECTION.
  IF p_rad3 EQ 'X'. "Cập nhật dữ liệu
    "Lấy dữ liệu từ bảng
    SELECT *
      FROM zBarry_emp
      INTO TABLE lt_itab
      WHERE empid = p_empid.
    "Cập nhật dữ liệu
    UPDATE zBarry_emp SET emp_fname = p_fname
      emp_lname = p_lname WHERE empid = p_empid.
    UPDATE zBarry_add SET city_name = p_city WHERE empid = p_empid.
    IF sy-subrc = 0.
      MESSAGE 'Employee Record Updated' TYPE 'I'.
    ELSEIF sy-subrc <> 0 .
      MESSAGE 'Wrong Employee ID3' TYPE 'E'.
      EXIT.
    ENDIF.
    EXIT.
  ENDIF.

  IF p_rad1 EQ 'X'. "Hiển thị dữ liệu
    "Lấy dữ liệu từ bảng
    SELECT *
      FROM zBarry_emp
      INTO TABLE lt_itab
      WHERE empid = p_empid.
    IF sy-subrc = 0 .
      LOOP AT lt_itab INTO lwa_emp.
        "In tiêu đề
        "In dữ liệu
      ENDLOOP.
      "Tính tổng lương
      "Tính thuế
      "Tính lương ròng
    ELSEIF sy-subrc <> 0 .
      MESSAGE 'Wrong Employee ID1' TYPE 'E'.
      EXIT.
    ENDIF.
  ENDIF.

  IF p_rad2 EQ 'X'. "Thêm dữ liệu
    "Gán giá trị cho các trường
    "Chèn dữ liệu vào bảng
    IF sy-subrc = 0.
      MESSAGE 'Employee Record Inserted' TYPE 'I'.
    ELSEIF sy-subrc <> 0 .
      MESSAGE 'Wrong Employee ID2' TYPE 'E'.
      EXIT.
    ENDIF.
    EXIT.
  ENDIF.

  IF p_rad4 EQ 'X'. "Xóa dữ liệu
    "Xóa dữ liệu từ bảng
    IF sy-subrc = 0.
      MESSAGE 'Employee Record Deleted' TYPE 'I'.
    ELSEIF sy-subrc <> 0 .
      MESSAGE 'Wrong Employee ID4' TYPE 'E'.
      EXIT.
    ENDIF.
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