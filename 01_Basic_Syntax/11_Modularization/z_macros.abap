*&---------------------------------------------------------------------*
*& Report  Z_MACRO
*&---------------------------------------------------------------------*
*& Code without Macro
*&---------------------------------------------------------------------*

REPORT  Z_MACRO.

PARAMETERS: OPTION1 type C RADIOBUTTON  group RG,
            OPTION2 type C RADIOBUTTON  group RG.

START-OF-SELECTION.

IF OPTION1 = 'X'.
  WRITE: 'Macro from option:  1'.
  SKIP 1.
  WRITE: 'Radio button selected:  1'.
ENDIF.

IF OPTION2 = 'X'.
  WRITE: 'Macro from option:  2'.
  SKIP 1.
  WRITE: 'Radio button selected:  2'.
ENDIF.



*&---------------------------------------------------------------------*
*& Report  Z_MACRO
*&---------------------------------------------------------------------*
*& Code with Macro
*&---------------------------------------------------------------------*

REPORT  Z_MACRO.

DEFINE disp_macro_info.
  WRITE: 'Macro call : &1'.
  SKIP 1.
  WRITE: 'Radio button selected: &1'.
END-OF-DEFINITION.

PARAMETERS: OPTION1 type C RADIOBUTTON  group RG,
            OPTION2 type C RADIOBUTTON  group RG.

START-OF-SELECTION.
IF OPTION1 = 'X'.
   disp_macro_info 1.
ENDIF.

IF OPTION2 = 'X'.
   disp_macro_info 2.
ENDIF.

" Có thể xem macro như phương thức tĩnh có đối số, dùng để can thiệp vào message: phần tĩnh dùng chung và phần đối số cho từng trường hợp

" Macro trong C++:
" #include <iostream>

" #define PRINT_MESSAGE(x) std::cout << "Message: " << x << std::endl;

" int main() {
"     PRINT_MESSAGE("Hello, World!");  // Gọi macro
"     return 0;
" }
