*&---------------------------------------------------------------------*
*& Report  Z_NESTED_DO
*&---------------------------------------------------------------------*

REPORT  Z_NESTED_DO.

DATA: W_I TYPE I VALUE 1,
      W_J TYPE I.

DO 3 TIMES.
  WRITE : /'Outer loop iteration ',W_I.
  W_I = W_I + 1.
  W_J = 1.

  DO 5 TIMES.
    WRITE : /'       Inner loop iteration ',W_J.
    W_J = W_J + 1.
  ENDDO.
ENDDO.

" Output
" Outer loop iteration 1
"        Inner loop iteration 1
"        Inner loop iteration 2
"        Inner loop iteration 3
"        Inner loop iteration 4
"        Inner loop iteration 5
" Outer loop iteration 2
"        Inner loop iteration 1
"        Inner loop iteration 2
"        Inner loop iteration 3
"        Inner loop iteration 4
"        Inner loop iteration 5
" Outer loop iteration 3
"        Inner loop iteration 1
"        Inner loop iteration 2
"        Inner loop iteration 3
"        Inner loop iteration 4
"        Inner loop iteration 5