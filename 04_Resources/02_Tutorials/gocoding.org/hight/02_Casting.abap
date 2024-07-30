" Đoạn mã trên là một ví dụ về kế thừa và ép kiểu trong ngôn ngữ ABAP:
" Định nghĩa và triển khai hai lớp a1 và b1, trong đó lớp b1 kế thừa từ lớp a1.
" Thực hiện các thao tác upcasting và downcasting giữa các đối tượng của các lớp này.
" Loại bỏ các giá trị trùng lặp từ chuỗi ký tự và xuất ra một chuỗi chỉ chứa các giá trị duy nhất.

CLASS a1 DEFINITION.
    PUBLIC SECTION.
        DATA: num1 TYPE i VALUE 100.
        METHODS: m1.
ENDCLASS.

CLASS a1 IMPLEMENTATION.
    METHOD m1.
        WRITE: 'a1:', num1.
    ENDMETHOD.
ENDCLASS.

CLASS b1 DEFINITION INHERITING FROM a1.
    PUBLIC SECTION.
        METHODS: m2, m1 REDEFINITION.
ENDCLASS.

CLASS b1 IMPLEMENTATION.
    METHOD m1.
        num1 = num1 .
        WRITE: 'b1:', num1.
    ENDMETHOD.

    METHOD m2.
        WRITE: 'M2 in class b1'.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
    DATA: a TYPE REF TO a1.
    DATA: b TYPE REF TO b1.

    ****************************************************************
    " Upcasting and downcasting example
    CREATE OBJECT b.
    a = b. " Upcasting
    CALL METHOD a->m1( ).
    NEW-LINE.
    b ?= a. " Downcasting
    CALL METHOD b->m1( ).
    NEW-LINE.
    CALL METHOD b->m2( ).
    *****************************************************************

    " Error: null reference
    CREATE OBJECT a.
    b ?= a. " Downcasting, still giving a dump
    CALL METHOD b->m1( ).
    *****************************************************************

    CREATE OBJECT a.
    TRY.
        b ?= a. " Attempting to use a 'NULL' object reference, will throw an exception
    CATCH cx_sy_move_cast_error.
        CALL METHOD b->m1( ).
    ENDTRY.
    *****************************************************************

    CREATE OBJECT a.
    CREATE OBJECT b.
    TRY.
        b ?= a.
    CATCH cx_sy_move_cast_error.
        CALL METHOD b->m1( ).
        CALL METHOD b->m2( ).
    ENDTRY.


    CLASS lcl_shape DEFINITION.
        PUBLIC SECTION.
            METHODS draw.
    ENDCLASS.

    CLASS lcl_circle DEFINITION INHERITING FROM lcl_shape.
        PUBLIC SECTION.
            METHODS: draw REDEFINITION,
                             calc_area.
    ENDCLASS.

    CLASS lcl_shape IMPLEMENTATION.
        METHOD draw.
            WRITE :/ 'Drawing any Shape'.
        ENDMETHOD.
    ENDCLASS.

    CLASS lcl_circle IMPLEMENTATION.
        METHOD draw.
            WRITE :/ 'Drawing specific shape: Circle'.
        ENDMETHOD.

        METHOD calc_area.
            WRITE :/ 'Area Of Circle = 2iiR'.
        ENDMETHOD.
    ENDCLASS.

    START-OF-SELECTION.
        DATA : o_cir TYPE REF TO lcl_circle.
        CREATE OBJECT o_cir.
        CALL METHOD o_cir->draw( ). " Calls subclass Draw() method
        CALL METHOD o_cir->calc_area( ).
        ULINE.

        " Narrow cast (Upcast)
        DATA : o_shp TYPE REF TO lcl_shape.
        o_shp = o_cir. " Narrow cast (Upcast)
        CALL METHOD o_shp->draw( ). " Calls subclass Draw() method
        " CALL METHOD o_shp->calc_area( ) . " Compilation error
        ULINE.

        " Widening Cast (Downcast)
        DATA : o_cir1 TYPE REF TO lcl_circle.
        " o_cir1 = o_shp. " Compilation error
        o_cir1 ?= o_shp.  " Widening Cast (Downcast)
        CALL METHOD o_cir1->draw( ). " Calls subclass Draw() method
        CALL METHOD o_cir1->calc_area( ).

CLASS a1 DEFINITION.
    PUBLIC SECTION.
        DATA: num1 TYPE i VALUE 100.
        METHODS: m1.
ENDCLASS.

CLASS a1 IMPLEMENTATION.
    METHOD m1.
        WRITE: 'a1:', num1.
    ENDMETHOD.
ENDCLASS.

CLASS b1 DEFINITION INHERITING FROM a1.
    PUBLIC SECTION.
        METHODS: m2, m1 REDEFINITION.
ENDCLASS.

CLASS b1 IMPLEMENTATION.
    METHOD m1.
        num1 = num1 .
        WRITE: 'b1:', num1.
    ENDMETHOD.

    METHOD m2.
        WRITE: 'M2 in class b1'.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
    DATA: parent TYPE REF TO a1.
    DATA: child TYPE REF TO b1.

    ****************************************************************
    " Upcasting and downcasting example
    CREATE OBJECT child.
    parent = child. " Upcasting
    CALL METHOD parent->m1( ).
    CALL METHOD child->m1( ).
    CALL METHOD child->m2( ).
    NEW-LINE.
    child ?= parent. " Downcasting
    CALL METHOD child->m1( ).
    NEW-LINE.
    CALL METHOD child->m2( ).
    ******************************************************************

    *" Error: null reference
    *CREATE OBJECT a.
    *b ?= a. " Downcasting, still giving a dump
    *CALL METHOD b->m1( ).
    ******************************************************************
    *
    CREATE OBJECT a.
    TRY.
        b ?= a. " Attempting to use a 'NULL' object reference, will throw an exception
    CATCH cx_sy_move_cast_error.
        CALL METHOD b->m1( ).
    ENDTRY.
    ******************************************************************
    *
    CREATE OBJECT a.
    CREATE OBJECT b.
    TRY.
        b ?= a.
    CATCH cx_sy_move_cast_error.
        CALL METHOD b->m1( ).
        CALL METHOD b->m2( ).
    ENDTRY.

    ******** Unique Values ******************

    DATA: lv_string       TYPE string,
                lv_string2      TYPE string,
                lv_string_final TYPE string.

    TYPES: BEGIN OF ty_data,
                     auth TYPE c,
                 END OF ty_data.

    DATA: ls_user  TYPE ty_data,
                ls_user2 TYPE ty_data,
                lt_user2 TYPE TABLE OF ty_data,
                lt_user  TYPE TABLE OF ty_data.

    lv_string = 'a,b,c,a'.
    lv_string2 = 'd,b,c,a'.

    SPLIT lv_string AT ',' INTO TABLE lt_user.
    SPLIT lv_string2 AT ',' INTO TABLE lt_user2.

    LOOP AT lt_user2 ASSIGNING FIELD-SYMBOL(<fs_field>).
        INSERT <fs_field> INTO TABLE lt_user.
    ENDLOOP.

    SORT lt_user BY auth.
    DELETE ADJACENT DUPLICATES FROM lt_user COMPARING auth.

    IF sy-subrc = 0.
        LOOP AT lt_user ASSIGNING FIELD-SYMBOL(<fs_user_table>).
            IF lv_string_final IS INITIAL.
                lv_string_final = <fs_user_table>-auth.
            ELSE.
                CONCATENATE lv_string_final <fs_user_table>-auth INTO lv_string_final SEPARATED BY ','.
            ENDIF.
        ENDLOOP.
    ENDIF.

    WRITE lv_string_final.


"                       _oo0oo_
"                      o8888888o
"                      88" . "88
"                      (| -_- |)
"                      0\  =  /0
"                    ___/`---'\___
"                  .' \\|     |// '.
"                 / \\|||  :  |||// \
"                / _||||| -:- |||||- \
"               |   | \\\  -  /// |   |
"               | \_|  ''\---/''  |_/ |
"               \  .-\__  '-'  ___/-. /
"             ___'. .'  /--.--\  `. .'___
"          ."" '<  `.___\_<|>_/___.' >' "".
"         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
"         \  \ `_.   \_ __\ /__ _/   .-` /  /
"     =====`-.____`.___ \_____/___.-`___.-'=====
"                       `=---='