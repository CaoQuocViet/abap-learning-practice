*&---------------------------------------------------------------------*
*& Report  Z_STRING_OPERATIONS
*&---------------------------------------------------------------------*
*& how the string operation used in the ABAP application program
*&---------------------------------------------------------------------*

REPORT  Z_STRING_OPERATIONS.

* Declaring required variables for string operations
DATA: W_S1(3)    TYPE C VALUE 'SAP',
      W_S2(4)    TYPE C VALUE 'ABAP',
      W_S3(2)    TYPE C VALUE 'by',
      W_S4(15)   TYPE C VALUE 'TutorialsCampus',
      W_Str(30)  TYPE C,
      W_Str1(30) TYPE C,
      W_SS(4)    TYPE C,
      W_NUM(10)  TYPE C,
      W_I        TYPE I,
      W_D        TYPE C VALUE ' '.

* Concatenate W_S1, W_S2, W_S3, W_S4 to W_Str seperated by space(' ')
CONCATENATE W_S1 W_S2 W_S3 W_S4 INTO W_Str SEPARATED BY W_D.
WRITE : /'Concatenation Output     : ',W_Str.

* Deleting GAPS in between the W_Str
CONDENSE W_Str NO-GAPS.
WRITE : /'Condence NO_GAPS Output  : ',W_Str.

* Concatenate W_S1, W_S2, W_S3, W_S4 to W_Str1 seperated by space(' ')
CONCATENATE W_S1 W_S2 W_S3 W_S4 INTO W_Str1 SEPARATED BY W_D.
*Replacing the first space with ','.
REPLACE W_D WITH ',' INTO W_Str1.
WRITE : /'Replace Output           : ',W_Str1.

* Concatenate W_S1, W_S2, W_S3, W_S4 to W_Str seperated by space(' ')
CONCATENATE W_S1 W_S2 W_S3 W_S4 INTO W_Str SEPARATED BY W_D.
* Searching the 'ABAP' string in the W_Str
W_SS = 'ABAP'.
SEARCH W_Str FOR W_SS.
IF sy-subrc = 0.
  WRITE : /'Search string found at   : ',sy-fdpos.
ELSE.
  WRITE : /'Search string not found'.
ENDIF.

* Shifting the first ZERO from the value '0001234567'
W_NUM = '0001234567'.
SHIFT W_NUM.
WRITE : /'Shift Output             : ',W_NUM.

* Deleting all left ZEROs from '0001234567'.
W_NUM = '0001234567'.
SHIFT W_NUM LEFT DELETING LEADING '0'.
WRITE : /'Shift left delete output : ',W_NUM.

*Shifting left ZERO to Right of the number.
W_NUM = '0123456789'.
SHIFT W_NUM CIRCULAR.
WRITE : /'Shift circular output    : ',W_NUM.

* Concatenate W_S1, W_S2, W_S3, W_S4 to W_Str seperated by space(' ')
CONCATENATE W_S1 W_S2 W_S3 W_S4 INTO W_Str SEPARATED BY W_D.
* Initializing W_S1, W_S2, W_S3, W_S4.
W_S1 = W_S2 = W_S3 = W_S4 = ' '.
* Splitting W_Str to W_S1, W_S2, W_S3, W_S4 based on space as seperator.
SPLIT W_Str AT W_D INTO W_S1 W_S2 W_S3 W_S4.
WRITE :/'SPLIT Output : ',
       /'W_S1  : ',W_S1,
       /'W_S2  : ',W_S2,
       /'W_S3  : ',W_S3,
       /'W_S4  : ',W_S4.

" Output:
" Concatenation Output        :   SAP ABAP by TutorialsCampus 
" Condence NO_GAPS Output     :   SAPABAPbyTutorialsCampus
" Replace Output              :   SAP,ABAP by TutorialsCampus
" Search string found at      :       4
" Shift Output                :   001234567
" Shift left delete output    :   1234567
" Shift circular output       :   1234567890
" SPLIT Output:
" W_S1 : SAP
" W_S2 : ABAP
" W_S3 : by
" W_S4 : TutorialsCampus

" CONCATENATE: Kết hợp các biến W_S1, W_S2, W_S3, và W_S4 thành một chuỗi W_Str, phân cách nhau bởi khoảng trắng (W_D), và in kết quả.
" CONDENSE: Xóa các khoảng trắng thừa trong W_Str, chỉ giữ lại khoảng trắng cần thiết, rồi in kết quả.
" REPLACE: Kết hợp lại các biến vào W_Str1, thay thế khoảng trắng đầu tiên bằng dấu phẩy (,), và in kết quả.
" SEARCH: Tìm kiếm chuỗi "ABAP" trong W_Str và in ra vị trí nếu tìm thấy hoặc thông báo không tìm thấy.
" SHIFT W_NUM: Di chuyển các ký tự đầu tiên ra khỏi W_NUM (xóa ký tự số 0 đầu tiên) và in kết quả.
" SHIFT W_NUM LEFT DELETING LEADING '0': Xóa tất cả các số 0 ở đầu W_NUM và in kết quả.
" SHIFT W_NUM CIRCULAR: Di chuyển ký tự số 0 đầu tiên của W_NUM ra cuối chuỗi theo kiểu vòng tròn và in kết quả.
" SPLIT: Kết hợp các biến vào W_Str, sau đó chia W_Str thành các biến W_S1, W_S2, W_S3, W_S4 dựa trên khoảng trắng và in kết quả.