" Ý tưởng của nó là lặp qua từng phần tử của mảng và so sánh cặp phần tử liền kề. Nếu thứ tự của chúng không đúng, chúng ta hoán đổi chúng.

DATA : ITAB_data       TYPE TABLE OF int4, "Bảng để lưu trữ dữ liệu
       ITAB            TYPE TABLE OF string, "Bảng để lưu trữ dữ liệu kiểu string
       wa_current_data TYPE int4, "Work area cho dữ liệu hiện tại
       wa_bubble_data  TYPE int4, "Work area cho quá trình sắp xếp
       lv_lines        TYPE int1, "Biến cho số lượng dòng
       lv_data1        TYPE int2, "Biến cho dữ liệu kiểu int2
       lv_data2        TYPE int2, "Biến cho dữ liệu kiểu int2
       lv_current_line TYPE int1. "Biến cho dòng hiện tại

SELECTION-SCREEN BEGIN OF SCREEN 0100. "Tạo màn hình
SELECT-OPTIONS: s_data FOR wa_current_data. "Tùy chọn chọn để nhập nhiều dữ liệu
SELECTION-SCREEN END OF SCREEN 0100.

DATA :   wa_sdata LIKE LINE OF s_data. "Work area tương tự như dòng trong tùy chọn chọn

START-OF-SELECTION. "Hiển thị kết quả
  CALL SELECTION-SCREEN '0100' STARTING AT 10 10. "Gọi màn hình đã tạo
  LOOP AT s_data INTO wa_sdata.
    APPEND wa_sdata-low TO ITAB_data. "Thêm giá trị từ tùy chọn chọn vào bảng
  ENDLOOP.
  DESCRIBE TABLE ITAB_data LINES lv_lines."Lấy tổng số bản ghi
  WHILE sy-index < lv_lines. "Lặp lại cho đến khi tất cả các dữ liệu được so sánh
    READ TABLE ITAB_data INTO wa_bubble_data INDEX 1. "Đọc dữ liệu đầu tiên
    LOOP AT ITAB_data INTO  wa_current_data   FROM 2 TO lv_lines - sy-index + 1. "Đọc dữ liệu từ bản ghi thứ 2 trở đi
      lv_current_line = sy-tabix. "Số thứ tự lặp hiện tại
      IF ( wa_bubble_data > wa_current_data ). "Nếu bản ghi thứ 2 > bản ghi thứ 1 => ĐỔI CHỖ chúng
        MODIFY ITAB_data FROM wa_bubble_data INDEX lv_current_line.
        MODIFY ITAB_data FROM wa_current_data INDEX lv_current_line - 1.
      ELSE.
        wa_bubble_data = wa_current_data. "Nếu không, bản ghi thứ 2 sẽ trở thành bản ghi đầu tiên và bản ghi thứ 3 sẽ trở thành bản ghi thứ 2
      ENDIF.
    ENDLOOP.
  ENDWHILE.
  LOOP AT ITAB_data INTO wa_current_data.
    SKIP.
    WRITE : wa_current_data. "Xuất giá trị từ bảng
  ENDLOOP.