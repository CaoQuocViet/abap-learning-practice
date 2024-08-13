REPORT  Z_CONDENSE.

DATA: W_T1(50) TYPE C VALUE '     Leading spaces along with text'.

WRITE : 'Text before condense:',W_T1.

SKIP 2.
CONDENSE W_T1.
WRITE : 'Text after condense:',W_T1.

SKIP 2.
CONDENSE W_T1 NO-GAPS.
WRITE : 'Text after condense with NO_GAPS:',W_T1.

" Output:
" Text before condense:     Leading spaces along with text


" Text after condense: Leading spaces along with text


" Text after condense with NO_GAPS: Leadingspacesalongwithtext