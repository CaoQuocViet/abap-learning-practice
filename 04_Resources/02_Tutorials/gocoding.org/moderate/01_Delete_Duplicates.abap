" Phép hội của tập hợp/table

" Khai báo các biến dữ liệu
DATA:   lv_string TYPE string,                  " Chuỗi dữ liệu đầu vào
        lv_string2 TYPE string,                 " Chuỗi dữ liệu thứ hai đầu vào
        lv_string_final TYPE string.            " Chuỗi kết quả sau khi thực hiện phép hội

" Định nghĩa kiểu dữ liệu cấu trúc cho một dòng dữ liệu
TYPES:  BEGIN OF ty_data,
        auth TYPE c,                           " Trường dữ liệu auth kiểu ký tự
        END OF ty_data.

" Khai báo các biến dữ liệu cho dòng dữ liệu và bảng dữ liệu
DATA:   is_user TYPE ty_data,                  " Dòng dữ liệu
        is_user2 TYPE ty_data,                 " Dòng dữ liệu thứ hai
        it_user TYPE TABLE OF ty_data,         " Bảng dữ liệu
        it_user2 TYPE TABLE OF ty_data.        " Bảng dữ liệu thứ hai

" Gán giá trị cho chuỗi dữ liệu đầu vào
lv_string = 'a,b,c,a'.
lv_string2 = 'd,b,c,a'.

" Tách chuỗi thành các phần tử và lưu vào bảng dữ liệu
SPLIT lv_string AT ',' INTO TABLE it_user.
SPLIT lv_string2 AT ',' INTO TABLE it_user2.

" Thực hiện phép hội bằng cách thêm các phần tử từ bảng dữ liệu thứ hai vào bảng dữ liệu
LOOP AT it_user2 ASSIGNING FIELD-SYMBOL(<fs_field>).
    INSERT <fs_field> INTO TABLE it_user.
ENDLOOP.

" Sắp xếp bảng dữ liệu theo trường auth và xóa các phần tử trùng lặp liền kề
SORT it_user BY auth.
DELETE ADJACENT DUPLICATES FROM it_user COMPARING auth.

" Kiểm tra xem có phần tử trong bảng dữ liệu hay không
IF sy-subrc = 0.
    " Duyệt qua các phần tử trong bảng dữ liệu
    LOOP AT it_user ASSIGNING FIELD-SYMBOL(<fs_user_table>).
        " Nếu chuỗi kết quả chưa được khởi tạo
        IF lv_string_final IS INITIAL.
            " Gán giá trị của trường auth vào chuỗi kết quả
            lv_string_final = <fs_user_table>-auth.
        ELSE.
            " Nếu chuỗi kết quả đã có giá trị, thêm giá trị của trường auth vào chuỗi kết quả, phân cách bằng dấu phẩy
            CONCATENATE lv_string_final <fs_user_table>-auth INTO lv_string_final SEPARATED BY ','.
        ENDIF.
    ENDLOOP.
ENDIF.

" Hiển thị chuỗi kết quả
WRITE lv_string_final.


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