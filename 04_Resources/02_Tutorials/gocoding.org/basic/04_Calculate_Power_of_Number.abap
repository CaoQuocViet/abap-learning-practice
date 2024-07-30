PARAMETERS: lv_data1(10) TYPE i,
            lv_data2(10) TYPE i.
WHILE lv_data2 > 1.
    lv_data1 = lv_data1 * lv_data1.
    lv_data2 = lv_data2 - 1.
ENDWHILE.
WRITE: lv_data1.