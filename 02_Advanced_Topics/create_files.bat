@echo off
setlocal enabledelayedexpansion

rem Define the base directory where the files will be created
set "baseDir=%cd%"

rem Create files with the given names
echo.> "%baseDir%\01_internal_tables.abap"
echo.> "%baseDir%\02_structures.abap"
echo.> "%baseDir%\03_abap_sql.abap"
echo.> "%baseDir%\04_abap_object_orientation.abap"
echo.> "%baseDir%\05_constructor_expressions.abap"
echo.> "%baseDir%\06_dynamic_programming.abap"
echo.> "%baseDir%\07_string_processing.abap"
echo.> "%baseDir%\08_eml_abap_for_rap.abap"
echo.> "%baseDir%\09_bits_and_bytes.abap"
echo.> "%baseDir%\10_abap_sql_hierarchies.abap"
echo.> "%baseDir%\11_internal_tables_grouping.abap"
echo.> "%baseDir%\12_amdp.abap"
echo.> "%baseDir%\13_program_flow_logic.abap"
echo.> "%baseDir%\14_abap_unit_tests.abap"
echo.> "%baseDir%\15_cds_view_entities.abap"
echo.> "%baseDir%\16_data_types_and_objects.abap"
echo.> "%baseDir%\17_sap_luw.abap"
echo.> "%baseDir%\18_dynpro.abap"
echo.> "%baseDir%\19_abap_for_cloud_development.abap"
echo.> "%baseDir%\20_selection_screens_lists.abap"
echo.> "%baseDir%\21_xml_json.abap"
echo.> "%baseDir%\22_misc_abap_classes.abap"
echo.> "%baseDir%\23_date_and_time.abap"
echo.> "%baseDir%\24_misc_builtin_functions.abap"

echo Files created successfully.
pause
