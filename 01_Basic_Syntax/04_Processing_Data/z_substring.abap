*&---------------------------------------------------------------------*
*& Report  Z_SUBSTRING
*&---------------------------------------------------------------------*
*& the substring processing in the ABAP application program
*&---------------------------------------------------------------------*

REPORT  Z_SUBSTRING.

* Declaring a W_Telephone with full telephone number
DATA: W_Telephone(15) TYPE C VALUE '+91-40-12348765'.

* Declaring different fields for country code,
* area code, and phone number
DATA: W_Country_code(3) TYPE C,
      W_Area_code(3) TYPE C,
      W_Phone_num(8) TYPE C.

* Assigning first three characters to W_Country_code
* to W_Country_code
W_Country_code = W_Telephone+0(3).
W_Country_code = W_Telephone(3).

* Assigning 2 characters from 4th position of W_Telephone
* to W_Area_code
W_Area_code = W_Telephone+4(2).

* Assigning 8 characters from 7th position of W_Telephone
* to W_Phone_num
W_Phone_num    = W_Telephone+7(8).

* Displaying the values of W_Telephone, W_Country_code, W_Area_code and W_Phone_num
WRITE: / 'Telephone:', W_Telephone,
       / 'Country Code:', W_Country_code,
       / 'Area Code:', W_Area_code,
       / 'Phone Number:', W_Phone_num.

* Output:
* W_Telephone: +91-40-12348765
* Country Code: +91
* Area Code: 40
* Phone Number: 12348765