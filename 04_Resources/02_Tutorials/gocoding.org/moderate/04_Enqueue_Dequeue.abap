" Chương trình ABAP này sử dụng hai hàm, ENQUEUE_E_TABLE và DEQUEUE_E_TABLE, để khóa và mở khóa dữ liệu trong SAP ABAP. Biến varkey lưu thông tin về client. Hàm ENQUEUE_E_TABLE được gọi để khóa bảng 'ZBarry_TEST', sau đó DEQUEUE_E_TABLE được gọi để mở khóa. Điều này giúp bảo vệ dữ liệu và đảm bảo tính nhất quán khi thực hiện các thay đổi.

REPORT Z_LOCK_PROGRAM.

DATA: varkey LIKE rstable-varkey.

START-OF-SELECTION.
  " Lấy mã client hiện tại
  varkey = sy-mandt.

  " Khóa bảng 'ZBarry_TEST' để đảm bảo tính nhất quán dữ liệu
  CALL FUNCTION 'ENQUEUE_E_TABLE'
    EXPORTING
      tabname        = 'ZBarry_TEST'
      varkey         = varkey
    EXCEPTIONS
      foreign_lock   = 1
      system_failure = 2
      OTHERS         = 3.

  " Xử lý các trường hợp trả về từ hàm ENQUEUE_E_TABLE
  CASE sy-subrc.
    WHEN 1.
      MESSAGE i184(bctrain) WITH 'Khóa ngoại lệ (Foreign lock)'.
    WHEN 2.
      MESSAGE i184(bctrain) WITH 'Lỗi hệ thống (System failure)'.
    WHEN 0.
      MESSAGE i184(bctrain) WITH 'Thành công (Success)'.
    WHEN OTHERS.
      MESSAGE i184(bctrain) WITH 'Trường hợp khác (Others)'.
  ENDCASE.

END-OF-SELECTION.
  " Mở khóa bảng 'ZBarry_TEST' khi đã hoàn thành việc sử dụng
START-OF-SELECTION.
  CALL FUNCTION 'DEQUEUE_E_TABLE'
    EXPORTING
      tabname = 'ZBarry_TEST'
      varkey  = varkey.

  " Xử lý lỗi nếu có khi mở khóa
  IF sy-subrc <> 0.
    MESSAGE i184(bctrain) WITH 'Đã xảy ra lỗi khi mở khóa (Error occurred during unlocking)'.
  ENDIF.