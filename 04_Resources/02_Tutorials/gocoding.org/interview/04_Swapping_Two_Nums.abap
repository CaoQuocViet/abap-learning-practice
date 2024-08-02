Data: lv_var1, lv_var2. "Here we have 2 variables
lv_var1 = 2. "Assigning values to variables
lv_var2 = 5.
* swapping code
lv_var1 = lv_var1 + lv_var2. "Now lv_var1 = 2 + 5 = 7.
lv_var2 = lv_var1 - lv_var2. "Now lv_var2 = 7 - 5 = 2.
lv_var1 = lv_var1 - lv_var2. "Now lv_var1 = 7 - 2 = 5.
*** Now the output will show lv_var1 = 5 and lv_var2 = 2
* Similarly using multiplication-division, we will achieve the same.

* Now the ABAP program to achieve the swap is shown below:

PARAMETERS : lv_num1(4) type i,
             lv_num2(4) type i.
lv_num1 = lv_num1 + lv_num2.
lv_num2 = lv_num1 - lv_num2.
lv_num1 = lv_num1 - lv_num2.
Write: 'Swapped Values are :', lv_num1, lv_num2.