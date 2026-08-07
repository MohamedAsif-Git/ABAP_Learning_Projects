CLASS zcl_as_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_as_rap_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    MODIFY ENTITIES OF zi_as_employee
*      ENTITY zi_as_employee
*      CREATE
*      FROM VALUE #(
*        (
*          %cid = 'EMP000'
*
*          EmployeeId   = 'EMP004'
*          EmployeeName = 'Rasiq'
*          Department   = 'IT'
*          Designation  = 'Insurance Manager'
*          Salary       = '50000'
*          Email        = 'rasiq@test.com'
*          Phone        = '9876543210'
*          JoinDate     = '20260805'
*          Status       = 'ACTIVE'
*
*          %control-EmployeeId   = if_abap_behv=>mk-on
*          %control-EmployeeName = if_abap_behv=>mk-on
*          %control-Department   = if_abap_behv=>mk-on
*          %control-Designation  = if_abap_behv=>mk-on
*          %control-Salary       = if_abap_behv=>mk-on
*          %control-Email        = if_abap_behv=>mk-on
*          %control-Phone        = if_abap_behv=>mk-on
*          %control-JoinDate     = if_abap_behv=>mk-on
*          %control-Status       = if_abap_behv=>mk-on
*        )
*      )
*      FAILED   DATA(failed)
*      REPORTED DATA(reported)
*      MAPPED   DATA(mapped).

**Update Record
    MODIFY ENTITIES OF zi_as_employee
      ENTITY zi_as_employee
      UPDATE
      FROM VALUE #(
        (
           EmployeeId   = 'EMP003'
           Salary       = '50000'

           %control-Salary = if_abap_behv=>mk-on
           )
           ).


    COMMIT ENTITIES
    RESPONSE OF zi_as_employee
    FAILED DATA(failed_commit)
    REPORTED DATA(reported_commit).

    IF failed_commit-zi_as_employee IS INITIAL.
      "Only for console
      "General practice - success message handled in ACTIONS not in VALIDATIONS
      out->write( 'Employee created/updated successfully' ).
    ELSE.
      LOOP AT reported_commit-zi_as_employee INTO DATA(ls_reported_commit).
        out->write( ls_reported_commit-%msg->if_message~get_text(  ) ).
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
