*&---------------------------------------------------------------------*
*& Report  Z_CHECK
*&---------------------------------------------------------------------*

REPORT  Z_CHECK.

* Declaring Variable
DATA: W_I TYPE I VALUE 0.

* DO loop iterates 10 times
DO 10 TIMES.

* incrementing Iteration number
    W_I = W_I + 1.

* Verifies the condition
    CHECK W_I BETWEEN 5 AND 7.
* Executes only when CHECK Condition is true
        WRITE : /'  Iteration ',W_I.

    IF W_I BETWEEN 5 AND 7.
        CONTINUE.
    ENDIF.

    WRITE : /'Iteration ',W_I.
ENDDO.

* Output
* Iteration 5
* Iteration 6
* Iteration 7

" Đoạn mã này Copilot cũng không in output đúng
" Đã Có check rồi thì code phía sau không hoạt động, khác IF ở chỗ này