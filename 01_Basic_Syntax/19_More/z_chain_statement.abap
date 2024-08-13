*&---------------------------------------------------------------------*
*& Report  Z_COLON_NOTATION
*&---------------------------------------------------------------------*

REPORT Z_COLON_NOTATION.

* Displaying 'Hello ' on the output.
WRITE 'Hello '.

* Displaying 'World..!' on the same row of the output.
WRITE 'World..!'.

WRITE: / 'Hello '.
WRITE: / 'World..!'.

* Skipping next two lines on the output.
SKIP 2.

* Example of Chained Statement
WRITE : 'Hello ', 'World..!'.

* Additional examples of chained statements
" DATA v_a TYPE I.
" DATA v_b TYPE P.

* Chained declaration statement
DATA: v_a TYPE I, v_b TYPE P.

* Chained processing statement
DATA: v_sum TYPE I.

v_sum = 0.

* Individual processing statements
v_sum = v_sum + 1.
v_sum = v_sum + 2.
v_sum = v_sum + 3.

* Chained processing statement using colon notation
v_sum = v_sum + : 1, 2, 3.

* Displaying the final value of v_sum
WRITE: / 'Final value of v_sum is:', v_sum.

" Output:
" Hello World..!
" Hello
" World..!
" Hello World..!


" Final value of v_sum is:          12