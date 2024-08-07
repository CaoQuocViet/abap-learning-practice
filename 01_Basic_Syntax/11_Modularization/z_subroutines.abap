REPORT  Z_SUBRMAIN.

Write 'Before calling subroutine..'.
PERFORM sub_routine.
Write /'After subroutine called....'.
*&---------------------------------------------------------------------*
*&      Form  sub_routine
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM sub_routine .
     Write /'Subroutine executed...'.
ENDFORM. 

" Output:
" Before calling subroutine..
" Subroutine executed...
" After subroutine called....



" Addition	        |   Method
*-------------------------------------------------------*
" using v1          |   Pass by reference
" changing v1	    |   Pass by reference
" using value(v1)   |   Pass by value
" changing value(v1)|   Pass by value and result

" Subroutines Có Thể Lồng Nhau: Có thể gọi các subroutines khác bên trong một subroutine.
" Subroutines Không Thể Lồng Nhau: Không thể gọi các subroutines khác bên trong một subroutine.
" Pass by Value: Truyền bản sao của tham số, không ảnh hưởng đến giá trị gốc.
" Pass by Value and Result: Truyền bản sao của tham số, và sao chép lại giá trị thay đổi vào giá trị gốc sau khi subroutine kết thúc.