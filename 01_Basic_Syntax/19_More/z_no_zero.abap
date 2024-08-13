REPORT  Z_NOZERO.

DATA: W_N1(10) TYPE N VALUE 70.

WRITE : 'Displaying numeric data without NO-ZERO:   ',W_N1.

SKIP 2.
WRITE : 'Displaying numeric data with NO-ZERO:   ',W_N1 NO-ZERO.

SKIP 2.
WRITE : 'Displaying numeric data with NO-ZERO:   ',W_N1 NO-ZERO.

" Output:
" Displaying numeric data without NO-ZERO:      0000000070
" Displaying numeric data with NO-ZERO:             70