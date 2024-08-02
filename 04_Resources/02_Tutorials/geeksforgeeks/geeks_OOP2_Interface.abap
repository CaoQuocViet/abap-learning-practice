" Interfaces
" Đa chức năng: Phương thức trong interface có thể có chức năng khác nhau khi được sử dụng trong các lớp khác nhau.
" Kế thừa Đa năng: Các lớp có thể triển khai nhiều giao diện, kế thừa các phương thức từ các giao diện khác nhau.
" Đa hình: Kế thừa từ interface cung cấp cơ sở cho đa hình vì một phương thức có thể được sử dụng bởi nhiều lớp với chức năng khác nhau.

" Syntax for creating an interface
INTERFACE interface_name.
DATA declaration.....
ABSTRACT METHOD declaration.....
EVENT declaration.....
.
.
ENDINTERFACE.

" Implementation of interface inside class
INTERFACE interface_name.

" Implementing method of an interface inside class
METHOD interface_name ~ interface_method_name.
    statements.
ENDMETHOD.


" Example program
" Creating interface
INTERFACE my_interface1.
    " Declaring data variables
    DATA:   num1 TYPE i,
            num2 TYPE i,
            res TYPE i.

    " Declaring abstract methods
    METHODS:    add,
                subtract.
ENDINTERFACE.

" Creating class
CLASS my_class1 DEFINITION.
    PUBLIC SECTION.
        " Using interface inside class and assigning value of data attributes of interface
        INTERFACES my_interface1 DATA VALUES num1 = 5, num2 = 10.
ENDCLASS.

" Class implementing Interface
CLASS my_class1 IMPLEMENTATION.
    " Using method inside implementing class
    METHOD my_interface1~add.
        " Adding two numbers
        my_interface1~res = my_interface1~num1 + my_interface1~num2.
        " Printing result
        WRITE: my_interface1~res.
    ENDMETHOD.

    METHOD my_interface1~subtract.
        " Subtracting two numbers
        my_interface1~res = my_interface1~num2 - my_interface1~num1.
        " Printing result
        WRITE: my_interface1~res.
    ENDMETHOD.
ENDCLASS.

"creating objects and calling methods
START-OF-SELECTION.

DATA: object1 TYPE REF TO my_class1,
    object2 TYPE REF TO my_class1.

" Creating object1
CREATE OBJECT object1.
WRITE: / 'Addition of given numbers is'.
CALL METHOD object1->my_interface1~add.

" Creating object2
CREATE OBJECT object2.
WRITE: / 'Subtraction of given numbers is'.
CALL METHOD object2->my_interface1~subtract.