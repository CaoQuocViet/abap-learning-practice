" Syntax of inheritance
CLASS sub_class DEFINITION INHERITING FROM super_class.

" Program
CLASS Parent_class DEFINITION.
    PUBLIC SECTION.
        METHODS: display REDEFINITION.
            DATA: data TYPE string.
ENDCLASS.

" Implementation of display method below
CLASS Parent_class IMPLEMENTATION.
    METHOD display.
        WRITE: / 'parent_data=', data.
    ENDMETHOD.
ENDCLASS.

" Child_class inherited from parent_class.
CLASS Child_class DEFINITION INHERITING FROM Parent_class.
    PUBLIC SECTION.
    METHOD: display REDEFINITION.
        DATA: subclass_data TYPE string.
    ENDMETHOD
ENDCLASS.

" Implementation of child class
CLASS Child_class IMPLEMENTATION.
    METHOD display.
        WRITE: / 'child_data=', subclass_data.
    ENDMETHOD.
ENDCLASS.

" Defining object references
DATA Parent_instance TYPE REF TO Parent_class.
DATA Child_instance TYPE REF TO Child_class.

" Instance for parent
CREATE OBJECT Parent_instance.
" Instance for child
CREATE OBJECT Child_instance.

" Attributes setup of base and derived class
Parent_instance -> data = 'This is Parent_data'.
Child_instance -> data = 'This is Child_data'.
Child_instance -> data = subclass_data = 'This is specific_child data'.

" Displaying data
CALL METHOD Parent_instance -> display.
CALL METHOD Child_instance -> display.

" Output:
" Parent_data=This is Parent_data
" Child_data=This is specific_child data

" Rules for Redefining method in Sub Class:
" Rule 1:- We have used the same method name (display) and return type (string) in the child class and parent class.
" Rule 2:- “REDEFINITION” keyword is used to redefine the method in child class.
" Rule 3:- Access control of parent class and child class is also same as shown in the code i.e. “PUBLIC”.

" Access control in inheritance
" Public:- The member which is declared public can be accessed from inside and outside the class.
" Protected:- The member which is defined as protected can be accessed within the class and it’s sub-class only.
" Private:- The member which is defined as private can be accessed with the class only.


" =================================================================
" =================================================================

" Abstract class vs interface

" Abstract class Bank Ex:

" Definition an abstract class: BankAccount and an abstract method: calculateInterest
CLASS BankAccount DEFINITION ABSTRACT.
    PUBLIC SECTION.
        METHODS:
            constructor,
            caculateInterest ABSTRACT.
        DATA:
            account_number TYPE i,
            banlance TYPE p DECIMALS 2.
ENDCLASS.

CLASS BankAccount IMPLEMENTATION.
    METHOD constructor.
        " Constructor implementation
    ENDMETHOD.

    METHOD calculateInterest.
        " Abstract method implementation (to be overridden by subclasses)
    ENDMETHOD.
ENDCLASS.

" Two subclass of BankAccount: SavingsAccount and CurrentAccount
CLASS SavingsAccount DEFINITION INHERITING FROM BankAccount.
    PUBLIC SECTION.
    METHODS:
        constructor,
        calculateInterest REDEFINITION.
ENDCLASS.

CLASS SavingsAccount IMPLEMENTATION.
    METHOD constructor.
        " Constructor implementation
    ENDMETHOD.

    METHOD calculateInterest.
        " Implementation of calculateInterest for SavingsAccount
    ENDMETHOD.
ENDCLASS.

CLASS CurrentAccount DEFINITION INHERITING FROM BankAccount.
    PUBLIC SECTION.
    METHODS:
        constructor,
        calculateInterest REDEFINITION.
ENDCLASS.

CLASS CurrentAccount IMPLEMENTATION.
    METHOD constructor.
        " Constructor implementation
    ENDMETHOD.

    METHOD calculateInterest.
        " Implementation of calculateInterst for CurrentAccount
    ENDMETHOD.
ENDCLASS.

" Interaface: can not have any implementation like the class.
" Ex:
" Definition Employee interface:
INTERFACE EmployeeInterface.
    METHODS:
        getEmployeeId,
        getEmployeeName,
        calculateSalary.
ENDINTERFACE.

" Create classes for type of employee
CLASS PermanentEmployee DEFINITION.
    PUBLIC SECTION.
        INTERFACES: EmployeeInterface.
    PRIVATE SECTION.
        DATA:
            employeeId TYPE i,
            employeeName TYPE string,
            salary TYPE p DECIMALS 2.
ENDCLASS.

CLASS PermanentEmployee IMPLEMENTATION.
    METHOD EmployeeInterface ~ getEmployeeId.
        " Implement getEmployeeId for PermanentEmployee
    ENDMETHOD.

    METHOD EmployeeInterface ~ getEmployeeName.
        " Implement getEmployeeName for PermanentEmployee
    ENDMETHOD.

    METHOD EmployeeInterface ~ calculateSalary.
        " Implement calculateSalary for PermanentEmployee
    ENDMETHOD.
ENDCLASS.

CLASS ContractEmployee DEFINITION.
    PUBLIC SECTION.
        INTERFACES: EmployeeInterface.
    PRIVATE SECTION.
        DATA:
            employeeId TYPE i,
            employeeName TYPE string,
            hourlyRate TYPE p DECIMALS 2,
            hoursWorked TYPE i.
ENDCLASS.

CLASS ContractEmployee IMPLEMENTATION.
    METHOD EmployeeInterface ~ getEmployeeId.
        " Implement getEmployeeId for ContractEmployee
    ENDMETHOD.

    METHOD EmployeeInterface ~ getEmployeeName.
        " Implement getEmployeeName for ContractEmployee
    ENDMETHOD.

    METHOD EmployeeInterface~calculateSalary.
        " Implement calculateSalary for ContractEmployee
    ENDMETHOD.
ENDCLASS.
