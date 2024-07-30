" Initially, we have defined Parameters to take Employee ID as input, variables to define work area to store data of Employee basic details and Salary details and object obj 
" Implementation of  one local class and an interface.
" Exporting Employee ID and getting relevant data from these classes/interface.
" Printing above result using Write statement.

CLass class_test DEFINITION DEFERRED.
PARAMETERS: p_empid TYPE char8.
DATA:   wa_emp TYPE zBarry_emp,
        wa_emp2 TYPE zBarry_sal.
DATA: obj TYPE REF TO class_test.
INTERFACE interface.
    METHODS: method2
        IMPORTING imp2 TYPE char8.
        EXPORTING exp2 TYPE zBarry_sal.
ENDINTERFACE.
CLASS class_test DEFINITION.
    PUBLIC SECTION.
        EVENTS: event1.
        INTERFACES: interface.
        METHODS: method1
            IMPORTING imp TYPE char8
            EXPORTING exp TYPE zBarry_emp.
        METHODS: evanthandler FOR EVENT event1 OF class_test.
ENDCLASS.

CREATE OBJECTobj.
SET HANDLER obj->evanthandler FOR obj.
CALL METHOD obj->method1
    EXPORTING imp = p_empid
    IMPORTING exp = wa_emp.
CALL METHOD obj->interface~method2
    EXPORTING imp2 = p_empid
    IMPORTING exp2 = wa_emp2.
WRITE:/ wa_emp.
WRITE:/ wa_emp2-empid, wa_emp2-tid, wa_emp2-mon.
*&---------------------------------------------------------------------*
*&       Class (Implementation)  class_test
*&---------------------------------------------------------------------*
*        Text
*----------------------------------------------------------------------*
CLASS class_test IMPLEMENTATION.
    METHOD method1.
        SELECT * FROM zBarry_emp INTO exp WHERE empid = imp.
        ENDSELECT.
        IF sy-subrc NE 0.
            RAISE EVENT event1.
        ENDIF.
    ENDMETHOD.
    METHOD interface~method2.
        SELECT * FROM zBarry_sal INTO exp2 WHERE empid = imp2.
        ENDSELECT.
    ENDMETHOD.
    METHOD evanthandler.
        WRITE:/ 'Employee ID not found'.
    ENDMETHOD.
ENDCLASS.