PARAMETERS: lv_data1(10) TYPE c.
DATA: lv_data2(10) TYPE c.
CALL FUNCTION 'STRING_REVERSE'
    EXPORTING  " Input
        string = lv_data1
        lang = sy-langu
    IMPORTING
        RSTRING = lv_data2  " Output
* EXCEPTIONS    " Xu ly ngoai le
* TOO_SMALL = 1 " Ngoai le 1
* OTHERS = 2    " Ngoai le 2

IF sy-subrc EQ 0.
    WRITE: lv_data2.
ENDIF.

" TOO_SMALL = 1: Đây là một ngoại lệ được xác định để xử lý trường hợp khi độ dài của chuỗi đầu vào quá nhỏ để thực hiện phép đảo ngược. Mã lỗi của ngoại lệ này được đặt là 1.

" OTHERS = 2: Đây là một ngoại lệ tổng quát, được sử dụng để xử lý các trường hợp ngoại lệ khác không được định nghĩa cụ thể. Mã lỗi của ngoại lệ này là 2.