


" 1. Compile-Time Polymorphism (Static Binding)
CLASS compile_time_polymorphism DEFINITION.
    PUBLIC SECTION.
        METHODS print_message IMPORTING im_mesage TYPE string.
        METHODS print_message IMPORTING im_mesage TYPE string im_count TYPE i.
ENDCLASS.

CLASS compile_time_polymorphism IMPLEMENTATION.
    METHOD print_message.
        WRITE: 'Message:', im_message.
    ENDMETHOD.

    METHOD print_message.
        WRITE: 'Message:', im_message, 'Count:', im_count.
    ENDMETHOD.
ENDCLASS.

DATA(obj) = NEW compile_time_polymorphism().
" Calls the first method
obj -> print_message(im_mesage = 'Hello').
" Calls the second method
obj -> print_message(im_mesage = 'Hi' im_count = 3).

" Output:
" Message: Hello
" Message: Hi Count: 3

" 2. Run-Time Polymorphism (Dynamic Binding)
CLASS abstract_shape DEFINITION ABSTRACT.
    PUBLIC SECTION.
        METHODS calculate_area ABSTRACT.
ENDCLASS.

CLASS circle DEFINITION INHERITING FROM abstract_shape.
    PUBLIC SECTION.
        METHODS calculate_area REDEFINITION.
ENDCLASS.

CLASS square DEFINITION INHERITING FROM abstract_shape.
    PUBLIC SECTION.
        METHODS calculate_area REDEFINITION.
ENDCLASS.

CLASS polymorphic_example IMPLEMENTATION.
    METHOD display_area FOR EVENT handler.
        DATA(shape) = CAST abstract_shape(handler -> get_data()).
        shape -> calculate_area().
    ENDMETHOD.
ENDCLASS.

" Usage
DATA(event_handler) = NEW cl_gui_custom_container().
SET HANDLER polymorphic_example => display_area FOR event_handler.

event_handler -> set_data(NEW circle()).
event_handler -> fire_event_by_id(id = 1).

" Output:
" Area Calculation for Circle
" Area Calculation for Square


" Abstract Class and Subclass
CLASS abstract_shape DEFINITION ABSTRACT.
    PUBLIC SECTION.
        METHODS calculate_area ABSTRACT.
ENDCLASS.

CLASS abstract_shape IMPLEMENTATION.
        METHOD calculate_area.
            WRITE: 'Area Calculation Not Defined'.
        ENDMETHOD.
ENDCLASS.

CLASS circle DEFINITION INHERITING FROM abstract_shape.
    PUBLIC SECTION.
        METHODS calculate_area DEFINITION.
ENDCLASS.

CLASS circle IMPLEMENTATION.
    METHOD calculate_area.
        DATA radius TYPE i VALUE 5.
        DATA area TYPE i.

        area = COND #(WHEN sy-index = 1 THEN 3.14 * radius * radius ELSE 0).

        WRITE: / 'Area of Circle:', area.
    ENDMETHOD.
ENDCLASS.

CLASS aquare DEFINITION INHERITING FROM abstract_shape.
    PUBLIC SECTION.
        METHODS calculate_area DEFINITION.
ENDCLASS.

CLASS square IMPLEMENTATION.
    METHOD calculate_area.
        DATA side_length TYPE i VALUE 4.
        DATA area TYPE i.

        area = COND #(WHEN sy-index = 1 THEN side_length * side_length ELSE 0).

        WRITE: / 'Area of Square:', area.
    ENDMETHOD.
ENDCLASS.

" Output:
" DATA(shape) = NEW abstract_shape( ).
" shape->calculate_area( ).  " Output: Area Calculation Not Defined

" shape = NEW circle( ).
" shape->calculate_area( ).  " Output: Area of Circle: 78.5

" shape = NEW square( ).
" shape->calculate_area( ).  " Output: Area of Square: 16


" Dynamic Type Binding
CLASS superclass DEFINITION.
    PUBLIC SECTION.
        METHODS display_data.
ENDCLASS.

CLASS subclass DEFINITION INHERITING FROM superclass.
    PUBLIC SECTION.
        METHODS display_data REDEFINITION.
ENDCLASS.

START-OF-SELECTION.

DATA obj TYPE REF TO superclass.

CREATE OBJECT obj TYPE subclass.

" Dynamic type binding
CALL METHOD obj -> display_data().


" Visibility Section 

" PUBLIC SECTION
CLASS classname DEFINITION.
    PUBLIC SECTION.
        ....
ENDCLASS.

" PROTECTED SECTION
CLASS classname DEFINITION.
    PUBLIC SECTION.
        ....
ENDCLASS.

" PRIVATE SECTION
CLASS classname DEFINITION.
    PRIVATE SECTION.
        ....
ENDCLASS.

" Ex:
REPORT demo_class_usage.

CLASS demo_class DEFINITION.
    PUBLIC SECTION.
        METHODS:
            display_name.
    PROTECTED SECTION:
        DATA:
            name TYPE string.
ENDCLASS.
CLASS demo_class IMPLEMENTATION.
    METHOD display_name.
        WRITE: / 'Name:', name.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: obj TYPE REF TO demo_class.
CREATE OBJECT obj.
obj -> name = 'John Doe'.
obj -> display_name().

" Output:
" Name: John Doe