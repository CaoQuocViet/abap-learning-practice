*&---------------------------------------------------------------------*
*& Report  Z_MESSAGE
*&---------------------------------------------------------------------*
*& Message Handling
*&---------------------------------------------------------------------*

REPORT  Z_MESSAGE_HANDLING.

DATA: lv_value TYPE i VALUE 10.

* Example of 'Abend' - Immediate program termination with a dump
IF lv_value = 10.
  MESSAGE 'ABEND: The value is 10 - Program will terminate' TYPE 'A'.
ENDIF.

* Example of 'Error' - Displays an error message, program may terminate
IF lv_value = 10.
  MESSAGE 'ERROR: The value is 10 - An error occurred' TYPE 'E'.
ENDIF.

* Example of 'Information' - Displays an information message and continues execution
IF lv_value = 10.
  MESSAGE 'INFORMATION: The value is 10 - Information message shown' TYPE 'I'.
ENDIF.

* Example of 'Success' - Displays a success message in the status bar, program continues
IF lv_value = 10.
  MESSAGE 'SUCCESS: The value is 10 - Success message shown in status bar' TYPE 'S'.
ENDIF.

* Example of 'Warning' - Displays a warning message in the status bar, program execution continues
IF lv_value = 10.
  MESSAGE 'WARNING: The value is 10 - Warning message shown in status bar' TYPE 'W'.
ENDIF.

* Example of 'Exit or Abort' - This should trigger a runtime short dump
* Note: To simulate an X type message, you need to use `RAISE` to trigger a short dump manually.
IF lv_value = 10.
  RAISE EXCEPTION TYPE cx_sy_no_handler. " This will trigger a short dump
ENDIF.

" Abend (TYPE 'A'): Khi sử dụng TYPE 'A', chương trình sẽ dừng ngay lập tức và hiển thị hộp thoại thông báo lỗi nghiêm trọng. Sau khi người dùng xác nhận, điều khiển quay lại menu cấp cao hơn.

" Error (TYPE 'E'): Thông điệp TYPE 'E' hiển thị một hộp thoại lỗi và có thể kết thúc chương trình tùy vào điều kiện. Đây là thông điệp lỗi chính thức cần được xử lý.

" Information (TYPE 'I'): Thông điệp TYPE 'I' hiển thị thông tin trong một hộp thoại, và chương trình tiếp tục thực hiện từ dòng lệnh tiếp theo sau MESSAGE.

" Success (TYPE 'S'): Thông điệp TYPE 'S' được hiển thị trên thanh trạng thái, thông báo thành công và chương trình tiếp tục thực hiện bình thường.

" Warning (TYPE 'W'): Thông điệp TYPE 'W' hiển thị cảnh báo trên thanh trạng thái, và chương trình vẫn tiếp tục chạy.

" Exit or Abort (TYPE 'X'): Không có thông điệp hiển thị; chương trình kết thúc với một short dump. Để mô phỏng, có thể dùng RAISE để tạo lỗi thời gian chạy, dẫn đến short dump.
