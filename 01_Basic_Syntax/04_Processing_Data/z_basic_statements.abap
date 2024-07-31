*&---------------------------------------------------------------------*
*& Report  ZSKIPLINE
*&---------------------------------------------------------------------*
*& Display the line numbers message for 3rd, 5th, 10th and 15th lines
*&---------------------------------------------------------------------*

REPORT  ZSKIPLINE.

* First row in output occupies with program name
* Second line row in output occupies with line
* What ever writing in the output, starts displaying fro third line
WRITE 'This is 3rd line'.

* Skip 4th line
SKIP.

* Writing on the 5th row
WRITE 'This is 5th line'.

* Skipping 4 lines
SKIP 4.

* Writing on the 10th row
WRITE 'This is 10th line'.

* Moving the cursor to the 15th row
SKIP TO LINE 15.

* Start writing on 15th row.
WRITE 'This is 15th line'.

* Output:
* This is 3rd line

* This is 5th line




* This is 10th line




* This is 15th line

*----------------------------------------------------------------------*

WRITE 'Underlined Text..!'.
ULINE.

ULINE AT 20(10).
SKIP 1.
* Output:
* Underlined Text..!
"-----------------------------------------------------------------------
"        ---------

*----------------------------------------------------------------------*

* Declaring W_N1 of type Numeric(N) with length 10 
* and initializing with 70.
DATA: W_N1(10) TYPE N VALUE 70.

* Displaying the value without specifying NO-ZERO
WRITE : 'Displaying numeric data without NO-ZERO:   ',W_N1.

* Skipping next two lines in the output.
SKIP 2.

* Displaying the value by specifying NO-ZERO
WRITE : 'Displaying numeric data with NO-ZERO:   ',W_N1 NO-ZERO.
SKIP 1.

* Output:
* Displaying numeric data without NO-ZERO:   0000000070


* Displaying numeric data with NO-ZERO:   70

*----------------------------------------------------------------------*

* Declaring variable of type character with length 50
DATA: W_T1(50) TYPE C VALUE '     Cao Quoc Viet     '.

* Displaying text before condense
WRITE: 'Text before condense - ', W_T1.

* Skipping next two lines in the output.
SKIP 2.

* Removing extra spaces from the string in W_T1
CONDENSE W_T1.

* Display the extra spaces suppressed string.
WRITE : 'Text after condense - ',W_T1.

* Skipping next lines in the output
SKIP 2.

* Removing all spaces from the string in w_t1.
CONDENSE W_T1 NO-GAPS.

* Display all spaces removed string.
WRITE : 'Text after condense with NO_GAPS - ',W_T1.

* Output:
* Text before condense -      Cao Quoc Viet


* Text after condense - Cao Quoc Viet


* Text after condense with NO_GAPS - CaoQuocViet

*======================================================================
" ABAP program is a combination of executable and non-executable statements.
" All executable statements can be coded after the REPORT statement.

" ABAP had SKIP command to insert blank lines in between the output lines.
" SKIP.
" SKIP [no-of-lines].
" SKIP [ TO LINE line-number].

" SKIP 4 – skips the 4 lines from 5th line and places the cursor at 10th line.Third WRITE statement output displays at 10th line.
" SKIP TO LINE 15 – places the cursor at the 15th line. Fourth WRITE statement output displays at 15th line.

" SKIP 4 – skips the 4 lines from 5th line and places the cursor at 10th line.Third WRITE statement output displays at 10th line.
" SKIP TO LINE 15 – places the cursor at the 15th line. Fourth WRITE statement output displays at 15th line.

" NO-ZERO only suppresses the zeroes while displaying. NO-ZERO not replaces the value in the actual numeric field. NO-ZERO applies on only numeric fields.

" NO-GAPS - Removes entire blank spaces from the string. It is optional with CONDENCE. CONDENCE applies on only character fields.