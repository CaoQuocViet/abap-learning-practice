" Chọn tệp tin: Người dùng chọn một tệp tin từ hệ thống.
" Đọc và chuyển đổi dữ liệu: Dữ liệu từ tệp tin Excel được đọc và chuyển đổi sang dạng phù hợp để lưu trữ trong bộ nhớ của SAP.
" Tải dữ liệu vào bảng trong bộ nhớ: Dữ liệu chuyển đổi từ tệp tin Excel được tải vào một bảng trong bộ nhớ của SAP.
" Thao tác với dữ liệu: Dữ liệu từ bảng trong bộ nhớ được thao tác và cập nhật vào bảng cơ sở dữ liệu.
" Khởi tạo đối tượng và thiết lập thuộc tính: Một đối tượng mới được tạo và các thuộc tính của nó được thiết lập.
" Xóa dữ liệu từ các bảng cơ sở dữ liệu khác nhau: Dữ liệu trong một số bảng cơ sở dữ liệu được xóa.
" Hiển thị dữ liệu từ bảng trong bộ nhớ: Dữ liệu từ bảng trong bộ nhớ được hiển thị.

" PARAMETERS: Định nghĩa một tham số để chọn tệp tin.
" AT SELECTION-SCREEN ON VALUE-REQUEST: Sự kiện xảy ra khi người dùng yêu cầu giá trị cho một tham số trên màn hình chọn.
" START-OF-SELECTION: Phần bắt đầu thực thi chương trình khi nút "Chạy" được nhấn.
" CALL FUNCTION: Gọi các hàm tiêu chuẩn trong SAP.
" DATA: Khai báo biến.
" LOOP AT: Vòng lặp để lặp qua các dòng trong một bảng.
" DELETE FROM: Xóa dữ liệu từ bảng cơ sở dữ liệu.
" CREATE OBJECT: Tạo một đối tượng trong lớp đã định nghĩa.

TYPE-POOLS truxs. " Import type-pool để sử dụng các loại dữ liệu tiêu chuẩn

PARAMETERS p_file TYPE rlgrap-filename. " Tham số để chứa đường dẫn tới tệp tin Excel

TYPES : BEGIN OF t_tab, " Định nghĩa một kiểu dữ liệu cấu trúc t_tab
          workstream TYPE char50,
          task       TYPE zci_task, " Kiểu dữ liệu tùy chỉnh zci_task, có thể là một kiểu dữ liệu cấu trúc khác
          task_type  TYPE char50,
        END OF t_tab.

DATA : t_upload1  TYPE STANDARD TABLE OF ZDEMO_TEST2, " Khai báo bảng dữ liệu t_upload1 với kiểu dữ liệu ZDEMO_TEST2
       wa_upload1 TYPE ZDEMO_TEST2. " Khai báo một biến dạng bảng (work area) với kiểu dữ liệu ZDEMO_TEST2

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      field_name = 'P_FILE'
    IMPORTING
      file_name  = p_file. " Gọi hàm để chọn tệp tin từ hệ thống

START-OF-SELECTION.
  CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
    EXPORTING
      i_filename           = p_file
    TABLES
      i_tab_converted_data = t_upload1[] " Sửa: i_tab_raw_data thành i_tab_converted_data
    EXCEPTIONS
      conversion_failed    = 1
      OTHERS               = 2.
  
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 . " Hiển thị thông báo lỗi
  ENDIF.

CALL FUNCTION 'UPLOAD_XLS_FILE_2_ITAB'
  EXPORTING
    i_filename       = p_file
  TABLES
    e_itab           = t_upload1 " Sửa: t_upload thành t_upload1
 EXCEPTIONS
   FILE_ERROR       = 1
   OTHERS           = 2
          .
IF sy-subrc <> 0.
  MESSAGE 'Error occurred during file upload' TYPE 'I'. " Thông báo lỗi nếu có
ENDIF.

END-OF-SELECTION.
  DATA : ls_cc_impl TYPE ZDEMO_TEST2, " Khai báo một biến cấu trúc ls_cc_impl với kiểu dữ liệu ZDEMO_TEST2
         lt_cc_impl TYPE TABLE OF  ZDEMO_TEST2. " Khai báo một bảng dữ liệu lt_cc_impl với kiểu dữ liệu ZDEMO_TEST2
  
  LOOP AT t_upload1 INTO wa_upload1.
    ls_cc_impl-mandt = sy-mandt.
    ls_cc_impl-INCIDENT = wa_upload1-INCIDENT.
    APPEND ls_cc_impl TO lt_cc_impl.
  ENDLOOP.
  
  MODIFY ZDEMO_TEST2 FROM TABLE lt_cc_impl. " Sửa: MODIFY t_upload1 thành MODIFY ZDEMO_TEST2

CLASS cl_grand DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA v_test TYPE char40.
    CLASS-METHODS class_constructor.
    METHODS constructor.
    DATA a TYPE i.
    CLASS-DATA b TYPE i.
ENDCLASS.

CLASS cl_grand IMPLEMENTATION.
  METHOD class_constructor.
    v_test = 'Static Constructor - Grand Parent'.
    b = 30.
    WRITE: /3 v_test.
  ENDMETHOD.

  METHOD constructor.
    a = 30.
    v_test = 'Instance Constructor - Grand Parent'.
    WRITE: /3 v_test.
  ENDMETHOD.
ENDCLASS.

CLASS cl_parent DEFINITION INHERITING FROM cl_grand.
  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    METHODS constructor.
ENDCLASS.

CLASS cl_parent IMPLEMENTATION.
  METHOD class_constructor.
    v_test = 'Static Constructor - Parent'.
    b = 20.
    WRITE: /3 v_test.
  ENDMETHOD.

  METHOD constructor .
    super->constructor( ).
    a = 20.
    v_test = 'Instance Constructor - Parent'.
    WRITE: /3 v_test.
  ENDMETHOD.
ENDCLASS.

CLASS cl_child DEFINITION INHERITING FROM cl_parent.
  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    METHODS constructor.
ENDCLASS.

CLASS cl_child IMPLEMENTATION.
  METHOD class_constructor.
    v_test = 'Static Constructor - Child'.
    WRITE: /3 v_test.
    b = 10.
  ENDMETHOD.

  METHOD constructor.
    data a TYPE i.
    a = 10.
    super->constructor( ).
    v_test = 'Instance Constructor - Child'.
    WRITE: /3 v_test.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
DATA obj_child TYPE REF TO cl_child.
CREATE OBJECT obj_child.
data: a TYPE i,
      b TYPE i.
a = obj_child->a. " Lấy giá trị của thuộc tính a từ đối tượng obj_child
write a.
write sy-uname.
delete from ztms_score . " Xóa dữ liệu từ bảng ztms_score
delete from ztms_ans . " Xóa dữ liệu từ bảng ztms_ans

TYPES: BEGIN OF TY_DATA, " Khai báo một kiểu dữ liệu cấu trúc TY_DATA
       ID TYPE N,
       NAME TYPE CHAR20,
       SALARY TYPE I,
      END OF TY_DATA.

DATA : ITAB TYPE TABLE OF TY_DATA, " Khai báo một bảng dữ liệu ITAB với kiểu dữ liệu TY_DATA
       WA TYPE TY_DATA. " Khai báo một biến dữ liệu WA với kiểu dữ liệu TY_DATA

WA-ID = 1.
WA-NAME = 'Sapnuts'.
WA-SALARY = 5000.
COLLECT WA INTO ITAB. " Đưa dữ liệu từ WA vào bảng ITAB
CLEAR WA.

WA-ID = 2.
WA-NAME = 'SAPabap'.
WA-SALARY = 50000.
COLLECT WA INTO ITAB. " Đưa dữ liệu từ WA vào bảng ITAB
CLEAR WA.

WA-ID = 1.
WA-NAME = 'Sapnuts'.
WA-SALARY = 15000.
COLLECT WA INTO ITAB. " Đưa dữ liệu từ WA vào bảng ITAB
CLEAR WA.

LOOP AT ITAB INTO WA.
  WRITE:/ WA-ID, WA-NAME, WA-SALARY. " Hiển thị dữ liệu từ bảng ITAB
ENDLOOP.

delete from ztms_user . " Xóa dữ liệu từ bảng ztms_user
delete from ztms_set . " Xóa dữ liệu từ bảng ztms_set
delete from ztms_ques . " Xóa dữ liệu từ bảng ztms_ques


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