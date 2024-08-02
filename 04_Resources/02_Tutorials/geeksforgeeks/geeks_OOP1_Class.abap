" Object Orientation:

" Đối tượng (Objects): Đại diện cho thực thể hoặc khái niệm, bao gồm dữ liệu và phương thức.
" Thuộc tính (Attributes): Dữ liệu hoặc biến liên kết với một đối tượng hoặc lớp.
" Phương thức (Methods): Hành động hoặc quy trình liên kết với một lớp.
" Giao diện (Interfaces): Định nghĩa tập hợp các phương thức mà một lớp phải triển khai.
" Trừu tượng (Abstraction): Ẩn đi dữ liệu không quan trọng và chỉ hiển thị dữ liệu cần thiết.
" Đóng gói (Encapsulation): Lớp đóng gói chi tiết nội bộ, ẩn đi triển khai nội bộ.
" Đa hình (Polymorphism): Sử dụng các triển khai khác nhau của các phương thức có cùng tên.
" Kế thừa (Inheritance): Tạo lớp mới dựa trên lớp hiện có, tái sử dụng mã và thiết lập mối quan hệ phân cấp.

" Classes in SAP ABAP

" Syntax for defining a class
CLASS class_name DEFINITION.
    PUBLIC SECTION.
        " Deffine public attributes and methods.
    PROTECTED SECTION.
        " Deffine protected attributes and methods.
    PRIVATE SECTION.
        " Deffine protected attributes and methods.
ENDCLASS.

" PUBLIC SECTION: section contains attributes and methods that can be accessed from outside the class.
" PROTECTED SECTION: Attributes and methods declared in this section are accessible within the class and its subclasses.
" PRIVATE SECTION: section includes attributes and methods that are only accessible within the class itself.

" Syntax for implementing a class
CLASS class_name IMPLEMENTATION.
    " Implement methods and logic here.
ENDCLASS.

" Attributes
CLASS lcl_class_definition DEFINITION.
    PUBLIC SECTION.
        DATA: instance_attribute TYPE data_type.
ENDCLASS.

" Static attributes
CLASS lcl_class_definition DEFINITION.
    PUBLIC SECTION.
        CLASS-DATA static_attribute TYPE data_type.
ENDCLASS.

" Methods
CLASS class_name DEFINITION.
    PUBLIC SECTION.
        METHODS method_name.
ENDCLASS.

CLASS class_name IMPLEMENTATION.
    METHOD method_name.
        " Method logic goes here.
    ENDMETHOD.
ENDCLASS.

" Accessing Atributes and Methods
DATA: obj TYPE REF TO class_name.
obj = NEW #(). " Create an instance of the class.
obj->method_name(). " Casll the method.
WRITE: obj->attribute_name. " Access the attribute.

" Static atributes
CLASS class_name DEFINITION.
    PUBLIC SECTION.
        CLASS-DATA static_attribute TYPE data_type.
ENDCLASS.

" Accessing static atributes\
CLASS_NAME=>ATTRIBUTE_NAME.

" Triggering constructors
DATA: obj TYPE REF TO class_name.
CREATE OBJECT obj.

" ME operator # this pointer
CLASS class_name DEFINITION.
    PUBLIC SECTION.
        DATA: attribute_name TYPE data_type.
        METHODS: method_name.
ENDCLASS.
CLASS class_name IMPLEMENTATION.
    METHOD method_name.
        " Accessing class attribute using ME operator
        ME->attribute_name = value. " Modifying the attribute.
    ENDMETHOD.
ENDCLASS.

" Program 1: A Simple Class and Object Creation
REPORT demo_class_usage.

CLASS demo_class DEFINITION.
    PUBLIC SECTION.
    METHODS:
        display_name.
    PRIVATE SECTION.
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
obj->name = 'Viet Cao'.
obj->display_name().

" Output : 
" Name: Viet Cao


" Program 2: Using Static Attribute and Method
REPORT demo_static_class.

CLASS demo_static_class DEFINITION.
    PUBLIC SECTION.
        CLASS-DATA: counter TYPE i.
        CLASS-METHODS: increment_counter, display_counter
ENDCLASS.

CLASS demo_ststic_class IMPLEMENTATION.
    METHOD increment_counter.
        counter = counter + 1.
    ENDMETHOD.

    METHOD display_counter.
        WRITE: / 'Counter:', counter.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

demo_static_class => increment_counter().
demo_static_class => display_counter().

" Output : 
" Counter: 1

