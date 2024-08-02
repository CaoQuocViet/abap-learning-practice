" Agenda:
" 4. Control Structures
" 5. Selection Screen Design (Executable Program)
" 6. Events (Executable Program)
" 7. ABAP Debugger

" =================================================================
" =================================================================

" Control Structures
Start
|
|-- [Condition A]
|      |
|      |-- Code Block A1
|      |
|      |-- Code Block A2
|
|-- [Condition B]
|      |
|      |-- Code Block B1
|      |
|      |-- Code Block B2
|
|-- [Default]
       |
       |-- Default Code Block

" IF statement
DATA(age) = 25.
IF age < 30.
    WRITE: 'You are young'.
ENDIF.

" IF-ELSE statement
DATA(grade) = 'B'.
IF grade = 'A'.
    WRITE: 'Excellent'.
ELSE.
    WRITE: 'Good effort'.
ENDIF.

" IF-ELSEIF-ELSE Statement
DATA(mark) = 75.
IF mark >= 90.
    WRITE: 'A Grade'.
ELSEIF mark >= 80.
    WRITE: 'B Grade'.
ELSE.
    WRITE: 'C Grade'.
ENDIF.

" Nested IF statement
DATA(age) = 25.
DATA(income) = 50000.
IF age < 30.
    IF income > 40000.
        WRITE: 'Young and earning well'.
    ENDIF.
ENDIF.

" CASE statement
DATA(day) = 'Monday'.
CASE day.
    WHEN 'Monday'.
        WRITE: 'The start of the week.'.
    WHEN 'Friday'.
        WRITE: 'TGIF!'.
    WHEN OTHERS.
        WRITE: 'Another day.'.
ENDCASE.

" WHILE Loop
DATA: counter TYPE i VALUE 1.
WHILE counter <= 10.
    WRITE: / counter.
    ADD 1 TO counter.
ENDWHILE.

" Example 1: Simple while loop to print numbers from 1 to user defined limit
DATA: counter TYPE i VALUE 1.
WRITE: 'Enter the limit: '.
READ VALUE counter.
WHILE counter <= limit.
    WRITE: / counter.
    counter = counter + 1.
ENDWHILE.

" Example 2: Find factorial of a user-provided number
DATA:   factorial TYPE i VALUE 1,
        i TYPE i VALUE 1.
WRITE: 'Enter the number: '.
READ VALUE i.
WHILE i < number.
    factorial = factorial * i.
    i = i + 1.
ENDWHILE.
WRITE: / 'Factorial of ', number, 'is ', factorial.

" Example 3: While loop to concatenate a user-provided string a certain number of times
DATA:   input_string TYPE string,
        repetition TYPE i,
        counter TYPE i VALUE 1,
        output_string TYPE string VALUE space.
WRITE: 'Enter a string'.
READ VALUE input_string.
WRITE: 'Enter the number of repetition: '.
READ VALUE repetition.
WHILE counter <= repetition.
    CONCATENATE output_string input_string INTO output_string.
    counter = counter + 1.
ENDWHILE.
WRITE: / 'Concatenated string: ', output_string.

" Input:
" Enter a string: ABAP
" Enter the number of repetitions: 3

" Output:
" Concatenated string: ABAPABAPABAP

" DO Loop
DATA: counter TYPE i VALUE 1.
DO.
    WRITE: / counter.
    ADD 1 TO counter.
    IF counter > 10.
        EXIT.
    ENDIF.
ENDDO.

" Example 1: Simple Loop Iteration
DATA: counter TYPE i VALUE 1.
DO.
    WRITE: / 'Interation: ' counter.
    counter = counter + 1.
    IF counter > 5.
        EXIT.
    ENDIF.
ENDDO.
" Output: 
" Iteration: 1
" Iteration: 2
" Iteration: 3
" Iteration: 4
" Iteration: 5

" Example 2: Looping Through an Internal Table
DATA:   names TYPE TABLE OF string,
        index TYPE i VALUE 1.
names = VALUE #(('Viet')('Duong')('Thinh')).
DO.
    WRITE: / 'Name:'. names[index].
    index = index + 1.
    IF index > lines(names).
        EXIT.
    ENDIF.
ENDDO.
" Output:
" Name: 'Alice'
" Name: 'Bob'
" Name: 'Charlie'

" Example 3: Dynamic Loop Termination
DATA:   limit TYPE i VALUE 3,
        counter TYPE i VALUE 1.
DO.
    WRITE: / 'Current Counter:', counter.
    counter = counter + 1.
    IF counter > limit.
        EXIT.
    ENDIF.
ENDDO.
" Output
" Current Counter: 1
" Current Counter: 2
" Current Counter: 3

" Example 4: Infinite Loop with User Input
DATA: input TYPE i.
DO.
    WRITE: / 'Enter a number (0 to exit):'.
    READ input.
    IF input = 0.
        EXIT.
    ENDIF.
    WRITE: / 'You entered:', input.
ENDDO.
" Input :
" 10
" 5
" 0

" Output:
" Enter a number (0 to exit):
" You entered: 10
" Enter a number (0 to exit):
" You entered: 10
" Enter a number (0 to exit):

" Program to print prime numbers from 1 to N in SAP ABAP
REPORT zprime_numbers.
PARAMETERS: p_number TYPE i.
DATA:   lv_flag TYPE abap_bool,
        lv_counter TYPE i.
IF p_number <= 1.
    WRITE: 'Please enter a number grreater than 1.'.
ELSE.
    WRITE: 'Prime numbers from 1 to', p_number, ':'.
    DO lv_counter = 2 TO p_number.
        lv_flag = abap_true.
        DO lv_counter = 2 TO lv_counter / 2.
            IF lv_counter MOD lv_counter = 0.
                lv_flag = abap_false.
                EXIT.
            ENDIF.
        ENDDO.
        IF lv_flag = abap_true.
            WRITE lv_counter.
        ENDIF.
    ENDDO.
ENDIF.

" Nested Loop
DO 3 TIMES.
    DO 2 TIMES.
        WRITE: / sy-index, sy-index1.
    ENDDO.
ENDDO.

" Ex:
DATA: inner TYPE i , outer TYPE i.  
 inner =1.  
outer = 1.  
          
DO 2 TIMES.            
 WRITE: / 'outer = ', outer.           
     WHILE inner< =2.        
          WRITE: / 'inner = ', inner.       
       inner = inner + 1.         
    ENDWHILE.
outer = outer +1. 
 inner=1.  
ENDDO.

" CONTINUE Statement
DO 10 TIMES.
    IF sy-index = 5.
        CONTINUE.
    ENDIF.
    WRITE: / sy-index.
ENDDO.

" CHECK Statement
DO 10 TIMES.
    index = index + 1.
    CHECK index BETWEEN 4 AND 8.
    WRITE: / index.
ENDDO.

" EXIT Statement
DO 10 TIMES.
    IF sy-index = 5.
        EXIT.
    ENDIF.
    WRITE: / sy-index.
ENDDO.

" =========================================================================================================
" =========================================================================================================

" 5. Selection Screen Design (Executable Program)
" Three ABAP statements for define selection screens:
" PARAMETERS for single fields.
" SELECT-OPTIONS for complete selection.
" SELECTION-SCREEN for formatting the selection screen and defining user-specified selection screens.

" =========================================================================================================
" =========================================================================================================
