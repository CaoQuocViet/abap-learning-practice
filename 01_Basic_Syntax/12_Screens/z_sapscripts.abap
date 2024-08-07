*&---------------------------------------------------------------------*
*& Report  Z_SCRIPT_PROG
*&---------------------------------------------------------------------*
*& Program to include the script.
*&---------------------------------------------------------------------*

REPORT  Z_SCRIPT_PROG.

* Specifying table name
TABLES ZTC_TPRODUCT.

* Declaring cursor and work area
DATA: head(60) TYPE C VALUE '      PRODUCT INFORMATION          ',
      heading(60) TYPE C VALUE 'PRODUCTID  | PRODUCT            '
      ' |    PAMOUNT    |',
      WA  LIKE ZTC_TPRODUCT,
      it  TYPE TABLE OF ZTC_TPRODUCT.

START-OF-SELECTION.
  PERFORM display_script.

FORM display_script.

    CALL FUNCTION 'OPEN_FORM'
    EXPORTING
    form                        = 'ZPRODUCT1'
    EXCEPTIONS
    canceled                    = 1
    device                      = 2
    form                        = 3
    OPTIONS                     = 4
    unclosed                    = 5
    mail_options                = 6
    archive_error               = 7
    invalid_fax_number          = 8
    more_params_needed_in_batch = 9
    spool_error                 = 10
    codepage                    = 11
    OTHERS                      = 12.

IF sy-subrc <> 0.
    MESSAGE 'Form is not opened successfully' TYPE 'I'.
ENDIF.

"Starting the Form
CALL FUNCTION 'START_FORM'
    EXPORTING
    form        = 'ZPRODUCT1'
    program     = 'Z_SCRIPT_PROG'
    EXCEPTIONS
    form        = 1
    format      = 2
    unended     = 3
    unopened    = 4
    unused      = 5
    spool_error = 6
    codepage    = 7
    OTHERS      = 8.

IF sy-subrc <> 0.
    MESSAGE 'Form is not started successfully' TYPE 'I'.
ENDIF.

"Writing the Heading of PO Item
CALL FUNCTION 'WRITE_FORM'
    EXPORTING
    element                  = 'head'
    window                   = 'HEADER'
    EXCEPTIONS
    element                  = 1
    function                 = 2
    type                     = 3
    unopened                 = 4
    unstarted                = 5
    window                   = 6
    bad_pageformat_for_print = 7
    spool_error              = 8
    codepage                 = 9
    OTHERS                   = 10.

IF sy-subrc <> 0.
    WRITE: 'Head not written', sy-subrc.
ENDIF.

"Writing the Heading of PO Item
CALL FUNCTION 'WRITE_FORM'
    EXPORTING
    element                  = 'heading'
    window                   = 'HEADER'
    EXCEPTIONS
    element                  = 1
    function                 = 2
    type                     = 3
    unopened                 = 4
    unstarted                = 5
    window                   = 6
    bad_pageformat_for_print = 7
    spool_error              = 8
    codepage                 = 9
    OTHERS                   = 10.

IF sy-subrc <> 0.
    MESSAGE 'Heading not written' TYPE 'I'.
ENDIF.

* Retrieving data from the table with product ID
SELECT *
INTO WA
FROM ZTC_TPRODUCT ORDER BY PRODUCTID.
        "Writing the line Items one by one
    CALL FUNCTION 'WRITE_FORM'
        EXPORTING
        element                  = 'wa'
        window                   = 'MAIN'
        EXCEPTIONS
        element                  = 1
        function                 = 2
        type                     = 3
        unopened                 = 4
        unstarted                = 5
        window                   = 6
        bad_pageformat_for_print = 7
        spool_error              = 8
        codepage                 = 9
        OTHERS                   = 10.
    WRITE: / WA-PRODUCTID, '|', WA-PRODUCT,  '|',WA-PAMOUNT,  '|'.
ENDSELECT.

"Ending the Form
CALL FUNCTION 'END_FORM'

IF sy-subrc <> 0.
    MESSAGE 'Form is not ended successfully' TYPE 'I'.
ENDIF.

"Closing the Form
CALL FUNCTION 'CLOSE_FORM'

IF sy-subrc <> 0.
    MESSAGE 'Form is not closed successfully' TYPE 'I'.
ENDIF.

WRITE: 'Report completed...'.
ENDFORM.


*=====================================================================*

Step-1: Go to SE71 transaction. It opens the 'Form painter: Request' screen. Enter the Form name with starting letter is Z or Y and select 'page layout' as subobjects. In this case, the form name is ZPRODUCT1 and click on Create button.

Step-2: It opens information dialog to create ZPRODUCT1 and click on Continue.

Step-3: Enter the meaning and click on save.

Step-4: It opens the 'Form: Change Header: ZPRODUCT1'. Click on Setting  Form Painter. In SAPscript tab, uncheck both options and click on Continue icon.

Step-5: Click on Pages button to create a new page like below.

Step-6: Click on Character Formats to create custom character format like below.

Step-7: Click on Paragraph Formats to create a new paragraph like below.

Step-8: Click on Windows button to create the new window like below.

Step-9: Click on Page windows button to configure the windows under the page. Click on Edit  Create Element to add the window.

Step-10: Add main page as first one, HEADER page as second one and their alignments like below.

Step-11: go to edit and click on text element to enter some content like below.

Step-12: Click on back to exit from Window header to go to 'Form: Change Header: ZPRODUCT1'. Step-12: Go to settings  Form painter.

Step-13: In SAPScript tab, check both options and click on Continue icon.

Step-14: It opens the page layout like below. Review the layout.

Step-15: To close this layout go to setting  form painter and uncheck the graphical form painter.

Step-16: Enter the default paragraph and First page name in the below screen on 'basic settings'.

Step-17: Activate the form.

Step-18: Now Write the program to include the script.