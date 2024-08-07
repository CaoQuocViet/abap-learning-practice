" Z_INCLSUB: Type Include Program (SE38 transaction)
WRITE / 'Inside the include..'. 

" Z_INCLMAIN: Type Executable Program
REPORT  Z_INCLMAIN.

Write 'Main program execution starts...'.

INCLUDE Z_INCLSUB.

Write / 'Main program execution ends..'. 

" Output:
" Main program execution starts...
" Inside the include..
" Main program execution ends..