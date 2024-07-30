*&---------------------------------------------------------------------*
*& Report  Z_STRUCTURE_VARIABLE
*&---------------------------------------------------------------------*
*& Simple program to display student details using structure
*&---------------------------------------------------------------------*

REPORT  Z_STRUCTURE_VARIABLE.

* Declaring the structure type for student details
* Student class
DATA: BEGIN OF  student,
        no TYPE n,
        name(25) TYPE c,
        class(10) TYPE c,
        END OF student.

* Assigning values to the structure
* student-no = 1.
MOVE 1 TO student-no.

MOVE 'John' TO student-name.

MOVE '1st class' TO student-class.

* Displaying the student details
WRITE: / 'Student Number:', student-no,
       / 'Student Name:', student-name,
       / 'Student Class:', student-class.

* Output:
* Student Number: 1
* Student Name: John
* Student Class: 1st class