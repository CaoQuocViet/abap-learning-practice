*&---------------------------------------------------------------------*
*& Report  Z_STRUCTURE_VARIABLE
*&---------------------------------------------------------------------*
*& Program to get the understanding of Structure variable
*&---------------------------------------------------------------------*

REPORT  Z_STRUCTURE_VARIABLE.

* Declaring student structure with student no, student name and
* student class
DATA: BEGIN OF student,
      no            TYPE n,
      name(25)      TYPE c,
      class(10)     TYPE c,
      END OF student.

* Assigning value to student no
MOVE 1  TO student-no.

* Assigning value to student name
MOVE 'pawan' TO student-name.

* Assigning value to student class
MOVE '1st class' TO student-class.

* Displaying student structure details by using stucture appending
WRITE : 'student-no   :', student-no,
      / 'student-name :', student-name,
      / 'student-class:', student-class.