" Dinh nghia cac tham so va bien can thiet
PARAMETERS: p_inp1 TYPE int2,    " Dau vao so nguyen 1
            p_inp2 TYPE int2.    " Dau vao so nguyen 2
DATA:   lv_out  TYPE int2,        " Ket qua phep tinh
        lv_sign TYPE c,           " Dau cua phep tinh (+, -, *, /)
        flag    TYPE int1 VALUE 0.  " Co de xac dinh trang thai phep tinh

" Dinh nghia man hinh chon phep tinh
SELECTION-SCREEN:   BEGIN OF SCREEN 500 TITLE TEXT-001,
                    PUSHBUTTON /10(10) add  USER-COMMAND add,      " Nut cong
                    PUSHBUTTON 25(10) sub USER-COMMAND sub,         " Nut tru
                    PUSHBUTTON 40(10) mul USER-COMMAND multiply,    " Nut nhan
                    PUSHBUTTON 55(10) div USER-COMMAND divide,      " Nut chia
                    END OF SCREEN 500.

" Khoi tao cac gia tri cho cac nut bam
INITIALIZATION.
    add = 'Add'.
    sub = 'Subtract'.
    mul = 'Multiply'.
    div = 'Division'.

" Xu ly su kien khi nguoi dung chon mot phep tinh
AT SELECTION-SCREEN.
    CASE sy-ucomm.
        WHEN 'ADD'.
            flag = 1.                          " Thiet lap co de thuc hien phep cong
            lv_sign = '+'.                     " Gan dau cong cho bien dau
            lv_out = p_inp1 + p_inp2.          " Thuc hien phep cong
        WHEN 'SUB'.
            flag = 1.                          " Thiet lap co de thuc hien phep tru
            lv_sign = '-'.                     " Gan dau tru cho bien dau
            lv_out = p_inp1 - p_inp2.          " Thuc hien phep tru
        WHEN 'DIVIDE'.
            IF ( p_inp2 <> 0 ).                " Kiem tra xem so chia co khac 0 khong
                flag = 1.                      " Thiet lap co de thuc hien phep chia
                lv_sign = '/'.                 " Gan dau chia cho bien dau
                lv_out = p_inp1 / p_inp2.      " Thuc hien phep chia
            ELSE.
                flag = 2.                      " Thiet lap co de thong bao loi chia cho 0
            ENDIF.
        WHEN 'MULTIPLY'.
            flag = 1.                          " Thiet lap co de thuc hien phep nhan
            lv_sign = '*'.                     " Gan dau nhan cho bien dau
            lv_out = p_inp1 * p_inp2.          " Thuc hien phep nhan
    ENDCASE.

" Hien thi ket qua phep tinh hoac thong bao loi
START-OF-SELECTION.
    IF p_inp1 IS NOT INITIAL OR p_inp2 IS NOT INITIAL.     " Kiem tra xem co so dau vao khong
        CALL SELECTION-SCREEN '500' STARTING AT 10 10.    " Goi man hinh chon phep tinh
        IF flag = 1.
            WRITE: lv_out.                                  " Hien thi ket qua phep tinh
        ELSEIF flag = 2.
            WRITE: 'Cannot Divide a number by 0'.           " Hien thi thong bao loi chia cho 0
        ELSEIF flag = 0.
            MESSAGE 'Press any Button to perform any operation!' TYPE 'I'.   " Hien thi thong bao yeu cau chon phep tinh
        ENDIF.
    ELSE.
        MESSAGE 'Please give both Input to proceed!' TYPE 'I'.   " Hien thi thong bao yeu cau nhap so
    ENDIF.