parameters:
  p_file type string lower case. " Tham số để chứa đường dẫn tệp tin

data:
  gs_store_file type z1127582_upload, " Bảng lưu trữ thông tin về tệp tin
  gt_content type standard table of tdline,
  len type i,
  xstr_content type xstring.

DATA:
  w_filename TYPE string, " Tên tệp tin
  w_length TYPE i,
  lt_file_table TYPE filetable,
  lv_filelength TYPE i,
  lv_rc TYPE i,
  lv_filename TYPE string,
  w_pdf_data TYPE xstring,
  lt_rawtab TYPE TABLE OF char255,
  w_pdf_file TYPE string,
  lo_pdfobj TYPE REF TO if_fp_pdf_object VALUE IS INITIAL, " Đối tượng PDF
  xslt_message TYPE string,
  exc TYPE REF TO cx_root.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  PERFORM f4_help_for_file.

start-of-selection.
  " Tải tệp lên vào Bảng Nội bộ
  call function 'GUI_UPLOAD'
    exporting
      filename                = p_file
      filetype                = 'BIN' " Loại tệp là nhị phân
    importing
      filelength              = len
    tables
      data_tab                = gt_content
    exceptions
      file_open_error         = 1
      file_read_error         = 2
      no_batch                = 3
      gui_refuse_filetransfer = 4
      invalid_type            = 5
      no_authority            = 6
      unknown_error           = 7
      bad_data_format         = 8
      header_not_allowed      = 9
      separator_not_allowed   = 10
      header_too_long         = 11
      unknown_dp_error        = 12
      access_denied           = 13
      dp_out_of_memory        = 14
      disk_full               = 15
      dp_timeout              = 16
      others                  = 17.
  if sy-subrc <> 0.
    message 'Không thể tải lên tệp tin' type 'E'.
  endif.
  " Chuyển dữ liệu nhị phân thành xstring
  call function 'SCMS_BINARY_TO_XSTRING'
    exporting
      input_length       = len
    importing
      buffer             = xstr_content
    tables
      binary_tab         = gt_content
    exceptions
      failed             = 1
      others             = 2.
  if sy-subrc <> 0.
    message 'Không thể chuyển đổi nhị phân thành xstring' type 'E'.
  endif.
  clear gs_store_file.
  gs_store_file-filename = p_file.
  gs_store_file-file_content = xstr_content.
  " Lưu tệp vào bảng
  insert z1127582_upload from gs_store_file.
  if sy-subrc is initial.
    message 'Tải lên thành công' type 'S'.
  else.
    message 'Tải lên thất bại' type 'E'.
  endif.

FORM f4_help_for_file.
  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    CHANGING
      file_table = lt_file_table
      rc = lv_rc
    EXCEPTIONS
      file_open_dialog_failed = 1
      cntl_error = 2
      error_no_gui = 3
      not_supported_by_gui = 4
      others = 5.
  IF sy-subrc <> 0.
    " Xử lý lỗi nếu cần
  ENDIF.
  READ TABLE lt_file_table INTO p_file INDEX 1.
  IF sy-subrc EQ 0.
    lv_filename = p_file.
  ENDIF.
  cl_gui_frontend_services=>gui_upload(
    EXPORTING
      filename = lv_filename
      filetype = 'BIN' " Nhị phân
    IMPORTING
      filelength = lv_filelength
    CHANGING
      data_tab = lt_rawtab
    EXCEPTIONS
      file_open_error = 1
      file_read_error = 2
      no_batch = 3
      gui_refuse_filetransfer = 4
      invalid_type = 5
      no_authority = 6
      unknown_error = 7
      bad_data_format = 8
      header_not_allowed = 9
      separator_not_allowed = 10
      header_too_long = 11
      unknown_dp_error = 12
      access_denied = 13
      dp_out_of_memory = 14
      disk_full = 15
      dp_timeout = 16
      not_supported_by_gui = 17
      error_no_gui = 18
      others = 19 ).
ENDFORM.