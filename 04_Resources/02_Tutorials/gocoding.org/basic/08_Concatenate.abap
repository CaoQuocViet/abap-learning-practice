PARAMETERS: lv_data1 TYPE string VALUE 'BARRY'.
            lv_data2 TYPE string VALUE 'ALLEN'.
DATA: lv_data TYPE string.
CONCATENATE lv_data1 lv_data2 INTO lv_data.
WRITE: lv_data. "Kết quả là 'BARRY ALLEN'