*&---------------------------------------------------------------------*
*& Report  Z_EXCEPTION_HANDLING
*&---------------------------------------------------------------------*
*& Multiplication two number with non-numeric exception handling
*&---------------------------------------------------------------------*

REPORT  Z_EXCEPTION_HANDLING.

DATA: rslt TYPE P LENGTH 10,
      op_ref TYPE REF TO cx_root,
      msg_text TYPE string.

PARAMETERS: inp1 TYPE C LENGTH 5,
            inp2 TYPE C LENGTH 5.

TRY.
    rslt = inp1 * inp2.

    CATCH cx_sy_conversion_no_number INTO op_ref.
        msg_text = op_ref->get_text( ).

    CATCH cx_root INTO op_ref.
        msg_text = op_ref->get_text( ).

ENDTRY.

IF NOT msg_text IS INITIAL.
    WRITE: / msg_text.
ELSE.
    WRITE: / 'Multiplication esult is: ', rslt.
ENDIF.

" Output:
" INP1: 5
" INP2: 5
" Multiplication esult is:  25

" INP1: ND
" INP2: 5
" The value 'ND' cannot be interpreted as a number

" Trong khối TRY...ENDTRY, bạn nên định nghĩa các trình xử lý (handlers) để xử lý các ngoại lệ. Mỗi trình xử lý được khai báo bằng từ khóa CATCH theo sau là lớp ngoại lệ (exception class).

" Các câu lệnh có khả năng gây ra ngoại lệ nên được đặt giữa TRY và CATCH đầu tiên. Điều này giúp đảm bảo rằng các ngoại lệ do các câu lệnh này gây ra sẽ được các trình xử lý tương ứng xử lý.

" Các câu lệnh sau khối CATCH chỉ được thực thi nếu trình xử lý (handler) bắt được một ngoại lệ. Nếu không có ngoại lệ xảy ra, các câu lệnh này sẽ không được thực thi.

" Khối CATCH không có ký hiệu kết thúc riêng biệt. Các câu lệnh tiếp theo hoặc các khối CATCH, CLEANUP hoặc ENDTRY tiếp theo sẽ hoạt động như là các ký hiệu kết thúc của khối CATCH trước đó.

" Mỗi ngoại lệ chỉ được một trình xử lý phù hợp đầu tiên bắt được. Khi một ngoại lệ đã được xử lý, nó không bị xử lý lại bởi các trình xử lý khác trong cùng một khối TRY.

" Một trình xử lý có thể được định nghĩa để bắt nhiều loại ngoại lệ khác nhau, tùy thuộc vào cách bạn khai báo nó.

" Thứ tự khai báo các trình xử lý rất quan trọng. Nếu có nhiều trình xử lý, trình xử lý khai báo trước sẽ được ưu tiên bắt ngoại lệ hơn các trình xử lý khai báo sau.

" Nếu hệ thống không tìm thấy trình xử lý phù hợp trong khối TRY...ENDTRY hiện tại, nó sẽ tìm kiếm trong các khối TRY...ENDTRY ngoài. Nếu không tìm thấy, nó tiếp tục tìm kiếm lên các khối gọi ngoài.

" Mỗi khối TRY...ENDTRY chỉ có thể chứa một khối CLEANUP. Khối CLEANUP được sử dụng để dọn dẹp tài nguyên hoặc thực hiện các hành động cần thiết khi kết thúc khối TRY, dù có ngoại lệ hay không.