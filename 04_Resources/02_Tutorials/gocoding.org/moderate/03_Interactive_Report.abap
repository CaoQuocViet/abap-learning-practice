REPORT ZINTERACTIVE_REPORT.

TABLES: zBarry_emp,   " Define table for basic employee details
        zBarry_sal,   " Define table for employee salary details
        zBarry_add.   " Define table for employee address details

DATA: it_emp1 TYPE TABLE OF zBarry_emp,   " Internal table for basic employee details
      it_emp2 TYPE TABLE OF zBarry_sal,   " Internal table for employee salary details
      it_emp3 TYPE TABLE OF zBarry_add,   " Internal table for employee address details
      wa_emp  TYPE zBarry_emp,            " Work area for basic employee details
      wa_emp2 TYPE zBarry_sal,            " Work area for employee salary details
      wa_emp3 TYPE zBarry_add,            " Work area for employee address details
      fnam    TYPE char20,                " Field name
      fval    TYPE INT4,                  " Field value
      fnam1   TYPE char20,                " Field name for secondary list
      fval1   TYPE INT4.                  " Field value for secondary list

SELECT-OPTIONS : p_empid FOR zBarry_emp-empid.  " Selection screen options for employee ID

AT USER-COMMAND.   " Event handler for user commands
  CASE SY-UCOMM.
    WHEN 'MAIN'.
      sy-lsind = 1.  " Set list indicator to 1 for main list
      PERFORM display_data.  " Call subroutine to display basic employee details
  ENDCASE.

AT SELECTION-SCREEN.   " Event handler for selection screen
  PERFORM validate_input.  " Call subroutine to validate input

START-OF-SELECTION.   " Start of main program
  PERFORM get_data.   " Call subroutine to fetch data
  PERFORM display_data.   " Call subroutine to display data

TOP-OF-PAGE.   " Event handler for top of page
  FORMAT COLOR COL_HEADING INVERSE.   " Set color for heading
  WRITE 'BASIC EMPLOYEE DETAILS'.   " Write heading for main list

TOP-OF-PAGE DURING LINE-SELECTION.   " Event handler for top of page during line selection
  IF sy-lsind = 1.   " If main list is selected
    FORMAT COLOR COL_HEADING INVERSE.   " Set color for heading
    WRITE 'EMPLOYEE SALARY DETAILS'.   " Write heading for secondary list
  ELSEIF sy-lsind = 2.   " If secondary list is selected
    FORMAT COLOR COL_HEADING INVERSE.   " Set color for heading
    WRITE 'EMPLOYEE ADDRESS DETAILS'.   " Write heading for tertiary list
  ENDIF.

AT LINE-SELECTION.   " Event handler for line selection
  PERFORM primary_list.   " Call subroutine for primary list
  PERFORM secondary_list.   " Call subroutine for secondary list

FORM validate_input.   " Subroutine to validate input
  IF p_empid IS INITIAL.   " Check if employee ID is empty
    MESSAGE 'Please Enter Employee Number' TYPE 'E'.   " Display error message if employee ID is empty
  ELSE.
    SELECT empid FROM zBarry_emp INTO TABLE it_emp1 WHERE empid IN p_empid.   " Select employee ID from database
    IF sy-subrc <> 0.   " Check if no records found
      MESSAGE 'Please Enter Correct Employee Number' TYPE 'E'.   " Display error message if incorrect employee ID is entered
    ENDIF.
  ENDIF.
ENDFORM.

FORM get_data.   " Subroutine to fetch data
  SELECT * FROM zBarry_emp INTO TABLE it_emp1 WHERE empid IN p_empid.   " Select basic employee details from database
ENDFORM.

FORM display_data.   " Subroutine to display data
  FORMAT COLOR COL_NEGATIVE INVERSE.   " Set color for heading
  WRITE:/,3 'Employee ID',
         20 'First NAME',
         35 'Last NAME'.   " Display column headers for basic employee details
  SKIP.
  LOOP AT it_emp1 INTO wa_emp.   " Loop through internal table of basic employee details
    FORMAT COLOR COL_POSITIVE INVERSE.   " Set color for data
    WRITE : /3 wa_emp-empid,20 wa_emp-emp_fname,35 wa_emp-emp_lname.   " Display employee ID, first name, and last name
  ENDLOOP.
ENDFORM.

FORM primary_list.   " Subroutine to fetch employee salary details
  IF sy-lsind = 1.   " If main list is selected
    GET CURSOR FIELD fnam VALUE fval.   " Get cursor position and field name
    IF fnam = 'WA_EMP-EMPID'.   " If employee ID is selected
      SELECT * FROM zBarry_sal INTO TABLE it_emp2 WHERE empid = fval.   " Select employee salary details from database
      FORMAT COLOR COL_NEGATIVE INVERSE.   " Set color for heading
      WRITE:/,3 'Employee ID',
               20 'Transaction ID',
               35 'Month',
               55 'Date Of Salary'.   " Display column headers for employee salary details
      SKIP.
      LOOP AT it_emp2 INTO wa_emp2.   " Loop through internal table of employee salary details
        FORMAT COLOR COL_POSITIVE INVERSE.   " Set color for data
        WRITE : /3 wa_emp2-empid,20 wa_emp2-tid,35 wa_emp2-mon,55 wa_emp2-dos.   " Display employee ID, transaction ID, month, and date of salary
      ENDLOOP.
    ENDIF.
  ENDIF.
ENDFORM.

FORM secondary_list.   " Subroutine to fetch employee address details
  IF sy-lsind = 2.   " If secondary list is selected
    GET CURSOR FIELD fnam1 VALUE fval1.   " Get cursor position and field name
    IF fnam = 'WA_EMP-EMPID'.   " If employee ID is selected
      SELECT * FROM zBarry_add INTO TABLE it_emp3 WHERE empid = fval1.   " Select employee address details from database
      FORMAT COLOR COL_NEGATIVE INVERSE.   " Set color for heading
      WRITE:/,3 'Employee ID',
               20 'Flat No.',
               35 'Street Name',
               55 'City Name'.   " Display column headers for employee address details
      SKIP.
      LOOP AT it_emp3 INTO wa_emp3.   " Loop through internal table of employee address details
        FORMAT COLOR COL_POSITIVE INVERSE.   " Set color for data
        WRITE : /3 wa_emp3-empid,20 wa_emp3-flat_no,35 wa_emp3-street_name,55 wa_emp3-city_name.   " Display employee ID, flat number, street name, and city name
      ENDLOOP.
    ENDIF.
  ENDIF.
ENDFORM.




" ===============================================
" ===============================================
" ===============================================
" ===============================================




" Comments bằng tiếng Việt
REPORT ZINTERACTIVE_REPORT.

TABLES: zBarry_emp,   " Bảng chứa thông tin cơ bản của nhân viên
        zBarry_sal,   " Bảng chứa thông tin lương của nhân viên
        zBarry_add.   " Bảng chứa thông tin địa chỉ của nhân viên

DATA: it_emp1 TYPE TABLE OF zBarry_emp,   " Bảng nội bộ chứa thông tin cơ bản của nhân viên
      it_emp2 TYPE TABLE OF zBarry_sal,   " Bảng nội bộ chứa thông tin lương của nhân viên
      it_emp3 TYPE TABLE OF zBarry_add,   " Bảng nội bộ chứa thông tin địa chỉ của nhân viên
      wa_emp  TYPE zBarry_emp,            " Work area chứa thông tin cơ bản của nhân viên
      wa_emp2 TYPE zBarry_sal,            " Work area chứa thông tin lương của nhân viên
      wa_emp3 TYPE zBarry_add,            " Work area chứa thông tin địa chỉ của nhân viên
      fnam    TYPE char20,                " Tên trường
      fval    TYPE INT4,                  " Giá trị trường
      fnam1   TYPE char20,                " Tên trường cho danh sách thứ cấp
      fval1   TYPE INT4.                  " Giá trị trường cho danh sách thứ cấp

SELECT-OPTIONS : p_empid FOR zBarry_emp-empid.  " Tùy chọn màn hình chọn cho mã nhân viên

AT USER-COMMAND.   " Xử lý sự kiện cho các lệnh người dùng
  CASE SY-UCOMM.
    WHEN 'MAIN'.
      sy-lsind = 1.  " Đặt chỉ số danh sách thành 1 cho danh sách chính
      PERFORM display_data.  " Gọi subroutine để hiển thị thông tin cơ bản của nhân viên
  ENDCASE.

AT SELECTION-SCREEN.   " Xử lý sự kiện cho màn hình chọn
  PERFORM validate_input.  " Gọi subroutine để kiểm tra đầu vào

START-OF-SELECTION.   " Bắt đầu chương trình chính
  PERFORM get_data.   " Gọi subroutine để lấy dữ liệu
  PERFORM display_data.   " Gọi subroutine để hiển thị dữ liệu

TOP-OF-PAGE.   " Xử lý sự kiện cho đầu trang
  FORMAT COLOR COL_HEADING INVERSE.   " Thiết lập màu cho tiêu đề
  WRITE 'BASIC EMPLOYEE DETAILS'.   " Viết tiêu đề cho danh sách chính

TOP-OF-PAGE DURING LINE-SELECTION.   " Xử lý sự kiện cho đầu trang trong khi chọn dòng
  IF sy-lsind = 1.   " Nếu chọn danh sách chính
    FORMAT COLOR COL_HEADING INVERSE.   " Thiết lập màu cho tiêu đề
    WRITE 'EMPLOYEE SALARY DETAILS'.   " Viết tiêu đề cho danh sách thứ cấp
  ELSEIF sy-lsind = 2.   " Nếu chọn danh sách thứ cấp
    FORMAT COLOR COL_HEADING INVERSE.   " Thiết lập màu cho tiêu đề
    WRITE 'EMPLOYEE ADDRESS DETAILS'.   " Viết tiêu đề cho danh sách thứ ba
  ENDIF.

AT LINE-SELECTION.   " Xử lý sự kiện cho việc chọn dòng
  PERFORM primary_list.   " Gọi subroutine cho danh sách chính
  PERFORM secondary_list.   " Gọi subroutine cho danh sách thứ cấp

FORM validate_input.   " Subroutine để kiểm tra đầu vào
  IF p_empid IS INITIAL.   " Kiểm tra nếu mã nhân viên trống
    MESSAGE 'Please Enter Employee Number' TYPE 'E'.   " Hiển thị thông báo lỗi nếu mã nhân viên trống
  ELSE.
    SELECT empid FROM zBarry_emp INTO TABLE it_emp1 WHERE empid IN p_empid.   " Chọn mã nhân viên từ cơ sở dữ liệu
    IF sy-subrc <> 0.   " Kiểm tra nếu không tìm thấy bản ghi
      MESSAGE 'Please Enter Correct Employee Number' TYPE 'E'.   " Hiển thị thông báo lỗi nếu nhập sai mã nhân viên
    ENDIF.
  ENDIF.
ENDFORM.

FORM get_data.   " Subroutine để lấy dữ liệu
  SELECT * FROM zBarry_emp INTO TABLE it_emp1 WHERE empid IN p_empid.   " Chọn thông tin cơ bản của nhân viên từ cơ sở dữ liệu
ENDFORM.

FORM display_data.   " Subroutine để hiển thị dữ liệu
  FORMAT COLOR COL_NEGATIVE INVERSE.   " Thiết lập màu cho tiêu đề
  WRITE:/,3 'Employee ID',
         20 'First NAME',
         35 'Last NAME'.   " Hiển thị tiêu đề cột cho thông tin cơ bản của nhân viên
  SKIP.
  LOOP AT it_emp1 INTO wa_emp.   " Lặp qua bảng nội bộ chứa thông tin cơ bản của nhân viên
    FORMAT COLOR COL_POSITIVE INVERSE.   " Thiết lập màu cho dữ liệu
    WRITE : /3 wa_emp-empid,20 wa_emp-emp_fname,35 wa_emp-emp_lname.   " Hiển thị thông tin cơ bản của nhân viên
  ENDLOOP.
ENDFORM.

FORM primary_list.   " Subroutine để lấy thông tin lương của nhân viên
  IF sy-lsind = 1.   " Nếu chọn danh sách chính
    GET CURSOR FIELD fnam VALUE fval.   " Lấy vị trí con trỏ và tên trường
    IF fnam = 'WA_EMP-EMPID'.   " Nếu chọn mã nhân viên
      SELECT * FROM zBarry_sal INTO TABLE it_emp2 WHERE empid = fval .   " Chọn thông tin lương của nhân viên từ cơ sở dữ liệu
      FORMAT COLOR COL_NEGATIVE INVERSE.   " Thiết lập màu cho tiêu đề
      WRITE:/,3 'Employee ID',
               20 'Transaction ID',
               35 'Month',
               55 'Date Of Salary'.   " Hiển thị tiêu đề cột cho thông tin lương của nhân viên
      SKIP.
      LOOP AT it_emp2 INTO wa_emp2.   " Lặp qua bảng nội bộ chứa thông tin lương của nhân viên
        FORMAT COLOR COL_POSITIVE INVERSE.   " Thiết lập màu cho dữ liệu
        WRITE : /3 wa_emp2-empid,20 wa_emp2-tid,35 wa_emp2-mon,55 wa_emp2-dos.   " Hiển thị thông tin lương của nhân viên
      ENDLOOP.
    ENDIF.
  ENDIF.
ENDFORM.

FORM secondary_list.   " Subroutine để lấy thông tin địa chỉ của nhân viên
  IF sy-lsind = 2.   " Nếu chọn danh sách thứ cấp
    GET CURSOR FIELD fnam1 VALUE fval1.   " Lấy vị trí con trỏ và tên trường cho danh sách thứ cấp
    IF fnam = 'WA_EMP-EMPID'.   " Nếu chọn mã nhân viên
      SELECT * FROM zBarry_add INTO TABLE it_emp3 WHERE empid = fval1 .   " Chọn thông tin địa chỉ của nhân viên từ cơ sở dữ liệu
      FORMAT COLOR COL_NEGATIVE INVERSE.   " Thiết lập màu cho tiêu đề
      WRITE:/,3 'Employee ID',
               20 'Flat No.',
               35 'Street Name',
               55 'City Name'.   " Hiển thị tiêu đề cột cho thông tin địa chỉ của nhân viên
      SKIP.
      LOOP AT it_emp3 INTO wa_emp3.   " Lặp qua bảng nội bộ chứa thông tin địa chỉ của nhân viên
        FORMAT COLOR COL_POSITIVE INVERSE.   " Thiết lập màu cho dữ liệu
        WRITE : /3 wa_emp3-empid,20 wa_emp3-flat_no,35 wa_emp3-street_name,55 wa_emp3-city_name.   " Hiển thị thông tin địa chỉ của nhân viên
      ENDLOOP.
    ENDIF.
  ENDIF.
ENDFORM.