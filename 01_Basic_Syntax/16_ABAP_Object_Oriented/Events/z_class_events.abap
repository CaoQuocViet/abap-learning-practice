*&---------------------------------------------------------------------*
*& Report  Z_EVENTS
*&---------------------------------------------------------------------*
*& Define and call events
*&---------------------------------------------------------------------*

REPORT  Z_EVENTS.

CLASS classnew DEFINITION.
    PUBLIC SECTION.
        " Creating event
        EVENTS eventnew.

        " Defining method to handle the event
        METHODS: methodnew FOR EVENT eventnew OF classnew.
        METHODS: triggernew.
ENDCLASS.

CLASS classnew IMPLEMENTATION.
    METHOD methodnew.
        WRITE: / 'Executing event handler method'.
    ENDMETHOD.

    " triggernew will raise the event
    METHOD triggernew.
        WRITE: / 'Executing trigger method to raise an event'.
        RAISE EVENT eventnew.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: obj TYPE REF TO classnew.
CREATE OBJECT obj.
* Registering the event handler method.
SET HANDLER obj->methodnew FOR obj.
* Calling event method which raises the event.
CALL METHOD obj->triggernew.

" Output:
" Executing trigger method to raise an event
" Executing event handler method