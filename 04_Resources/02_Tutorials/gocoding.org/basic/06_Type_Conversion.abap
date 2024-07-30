" Direct assignment based conversion
DATA:   lv_string TYPE string VALUE '123',
        lv_num TYPE num4.
lv_num = lv_string.
WRITE: lv_num " 123



" ABAP keyword based conversion

" Ex1:
DATA lv_text TYPE c LENGTH 255 VALUE 'ABC'.  
DATA lv_xstr  TYPE xstring.                 
" Thực hiện chuyển đổi kiểu dữ liệu từ kiểu c sang kiểu xstring bằng cách sử dụng từ khóa CONV.
DATA(lv_xstr) = cl_abap_codepage=>convert_to( source = CONV #( lv_text ) ).
write : lv_xstr.  " In ra giá trị đã chuyển đổi.

" Ex2: Chuyển đổi từ kiểu dữ liệu số nguyên sang kiểu dữ liệu ký tự:
DATA: lv_int TYPE i VALUE 123.
DATA: lv_char TYPE c.

lv_char = CONV #( lv_int ).
WRITE lv_char.  " Kết quả: '123'

" Ex3: Chuyển đổi từ kiểu dữ liệu số thực sang kiểu dữ liệu nguyên:
DATA: lv_float TYPE f VALUE '123.45'.
DATA: lv_int TYPE i.

lv_int = CONV #( lv_float ).
WRITE lv_int.  " Kết quả: 123

" Ex4: Chuyển đổi từ kiểu dữ liệu dấu thập phân sang kiểu dữ liệu số nguyên:
DATA: lv_dec TYPE decfloat16 VALUE '123.45'.
DATA: lv_int TYPE i.

lv_int = CONV #( lv_dec ).
WRITE lv_int.  " Kết quả: 123

" Ex5: Chuyển đổi từ kiểu dữ liệu ngày giờ sang kiểu dữ liệu xâu:
DATA: lv_datetime TYPE sy-datum VALUE '20220410'.
DATA: lv_string TYPE string.

lv_string = CONV #( lv_datetime ).
WRITE lv_string.  " Kết quả: '20220410'