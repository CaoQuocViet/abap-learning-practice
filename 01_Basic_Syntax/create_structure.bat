@echo off
setlocal enabledelayedexpansion

rem Define the base directory where the folders will be created
set "baseDir=%cd%"

rem Create main folders
mkdir "%baseDir%\05_Operators"
mkdir "%baseDir%\06_Decision_Control_Statements"
mkdir "%baseDir%\07_Loop_Statements"
mkdir "%baseDir%\08_Loop_Control_Statements"
mkdir "%baseDir%\09_Data_Dictionary"
mkdir "%baseDir%\10_Internal_Tables"
mkdir "%baseDir%\11_Modularization"
mkdir "%baseDir%\12_Screens"
mkdir "%baseDir%\13_Reports"
mkdir "%baseDir%\14_Dialog_Programs"
mkdir "%baseDir%\15_OPEN_SQL"
mkdir "%baseDir%\16_Native_SQL"
mkdir "%baseDir%\17_ABAP_Object_Oriented"
mkdir "%baseDir%\18_Other"
mkdir "%baseDir%\19_References"

rem Create files in 05_Operators
echo.> "%baseDir%\05_Operators\z_arithmetic_operators.abap"
echo.> "%baseDir%\05_Operators\z_bit_operators.abap"
echo.> "%baseDir%\05_Operators\z_string_operators.abap"
echo.> "%baseDir%\05_Operators\z_relational_operators.abap"
echo.> "%baseDir%\05_Operators\z_boolean_operators.abap"

rem Create files in 06_Decision_Control_Statements
echo.> "%baseDir%\06_Decision_Control_Statements\z_decision_control_statements_overview.abap"
echo.> "%baseDir%\06_Decision_Control_Statements\z_if_statement.abap"
echo.> "%baseDir%\06_Decision_Control_Statements\z_if_else_statement.abap"
echo.> "%baseDir%\06_Decision_Control_Statements\z_nested_if_statement.abap"
echo.> "%baseDir%\06_Decision_Control_Statements\z_case_statement.abap"

rem Create files in 07_Loop_Statements
echo.> "%baseDir%\07_Loop_Statements\z_loop_statements_overview.abap"
echo.> "%baseDir%\07_Loop_Statements\z_while_loop.abap"
echo.> "%baseDir%\07_Loop_Statements\z_do_loop.abap"
echo.> "%baseDir%\07_Loop_Statements\z_nested_loop.abap"

rem Create files in 08_Loop_Control_Statements
echo.> "%baseDir%\08_Loop_Control_Statements\z_loop_control_statements_overview.abap"
echo.> "%baseDir%\08_Loop_Control_Statements\z_continue_statement.abap"
echo.> "%baseDir%\08_Loop_Control_Statements\z_check_statement.abap"
echo.> "%baseDir%\08_Loop_Control_Statements\z_exit_statement.abap"

rem Create files in 09_Data_Dictionary
echo.> "%baseDir%\09_Data_Dictionary\z_data_dictionary_overview.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_domains.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_data_elements.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_structures.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_tables.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_views.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_search_help.abap"
echo.> "%baseDir%\09_Data_Dictionary\z_lock_objects.abap"

rem Create files in 10_Internal_Tables
echo.> "%baseDir%\10_Internal_Tables\z_internal_tables_overview.abap"
echo.> "%baseDir%\10_Internal_Tables\z_creating_internal_tables.abap"
echo.> "%baseDir%\10_Internal_Tables\z_populating_internal_tables.abap"
echo.> "%baseDir%\10_Internal_Tables\z_reading_internal_tables.abap"
echo.> "%baseDir%\10_Internal_Tables\z_copying_internal_tables.abap"
echo.> "%baseDir%\10_Internal_Tables\z_deleting_internal_tables.abap"

rem Create files in 11_Modularization
echo.> "%baseDir%\11_Modularization\z_modularization_overview.abap"
echo.> "%baseDir%\11_Modularization\z_macros.abap"
echo.> "%baseDir%\11_Modularization\z_include_programs.abap"
echo.> "%baseDir%\11_Modularization\z_subroutines.abap"
echo.> "%baseDir%\11_Modularization\z_function_modules.abap"

rem Create files in 12_Screens
echo.> "%baseDir%\12_Screens\z_sapscripts.abap"
echo.> "%baseDir%\12_Screens\z_smart_forms.abap"
echo.> "%baseDir%\12_Screens\z_customer_exits.abap"
echo.> "%baseDir%\12_Screens\z_user_exits.abap"

rem Create files in 13_Reports
echo.> "%baseDir%\13_Reports\z_report_programming.abap"

rem Create files in 14_Dialog_Programs
echo.> "%baseDir%\14_Dialog_Programs\z_dialog_programming.abap"

rem Create files in 15_OPEN_SQL
echo.> "%baseDir%\15_OPEN_SQL\z_open_sql_overview.abap"
echo.> "%baseDir%\15_OPEN_SQL\z_open_sql_select.abap"
echo.> "%baseDir%\15_OPEN_SQL\z_open_sql_insert.abap"
echo.> "%baseDir%\15_OPEN_SQL\z_open_sql_update.abap"
echo.> "%baseDir%\15_OPEN_SQL\z_open_sql_modify.abap"
echo.> "%baseDir%\15_OPEN_SQL\z_open_sql_delete.abap"

rem Create files in 16_Native_SQL
echo.> "%baseDir%\16_Native_SQL\z_native_sql_overview.abap"

rem Create files in 17_ABAP_Object_Oriented
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_classes.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_class_attributes.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_class_methods.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_class_constructors.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_class_events.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_objects.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_interfaces.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_encapsulation.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_inheritance.abap"
echo.> "%baseDir%\17_ABAP_Object_Oriented\z_polymorphism.abap"

rem Create files in 18_Other
echo.> "%baseDir%\18_Other\z_exception_handling.abap"
echo.> "%baseDir%\18_Other\z_business_add_ins.abap"
echo.> "%baseDir%\18_Other\z_web_dynpro.abap"

rem Create files in 19_References
echo.> "%baseDir%\19_References\z_standard_reports_list.abap"
echo.> "%baseDir%\19_References\z_system_fields_list.abap"
echo.> "%baseDir%\19_References\z_system_tables_list.abap"
echo.> "%baseDir%\19_References\z_transaction_codes.abap"

echo Folders and files created successfully.
pause
