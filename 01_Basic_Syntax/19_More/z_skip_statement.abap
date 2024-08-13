*&---------------------------------------------------------------------*
*& Report  ZSKIPLINE
*&---------------------------------------------------------------------*

REPORT  ZSKIPLINE.

WRITE 'This is 3rd line'.
SKIP.
WRITE 'This is 5th line'.

SKIP 4.
WRITE 'This is 10th line'.

SKIP TO LINE 15.
WRITE 'This is 15th line'.

" Output:
" This is 3rd line

" This is 5th line




" This is 10th line




" This is 15th line