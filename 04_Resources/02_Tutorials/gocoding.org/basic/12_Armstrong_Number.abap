" For example: 153 = 1^3 + 5^3 + 3^3

PARAMETERS: lv_data1(10) TYPE p.
DATA:   lv_digit(10) TYPE i,
        lv_final(10) TYPE i,
        lv_arm(10) TYPE i,
        lv_data2(10) TYPE p.
lv_data2 = lv_data1.
WHILE lv_data2 <> 0.
    lv_digit = lv_data2 MOD 10.
    lv_arm = lv_arm + (lv_digit * lv_digit * lv_digit).
    lv_data2 = trunc(lv_data2 / 10).
ENDWHILE.
IF lv_data1 EQ lv_arm.
    WRITE: 'It is an Armstrong Number'.
ELSE.
    WRITE: 'It is not an Armstrong Number'.
ENDIF.