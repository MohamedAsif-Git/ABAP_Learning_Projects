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
    MODIFY ENTITIES OF zi_as_employee
      ENTITY zi_as_employee
      CREATE
      FROM VALUE #(
        (
          %cid = 'EMP001'

          EmployeeId   = 'EMP001'
          EmployeeName = 'Asif'
          Department   = 'IT'
          Designation  = 'ABAP Developer'
          Salary       = '60000'
          Email        = 'asif@test.com'
          Phone        = '9876543210'
          JoinDate     = '20260805'
          Status       = 'ACTIVE'

          %control-EmployeeId   = if_abap_behv=>mk-on
          %control-EmployeeName = if_abap_behv=>mk-on
          %control-Department   = if_abap_behv=>mk-on
          %control-Designation  = if_abap_behv=>mk-on
          %control-Salary       = if_abap_behv=>mk-on
          %control-Email        = if_abap_behv=>mk-on
          %control-Phone        = if_abap_behv=>mk-on
          %control-JoinDate     = if_abap_behv=>mk-on
          %control-Status       = if_abap_behv=>mk-on
        )
      )
      FAILED   DATA(failed)
      REPORTED DATA(reported)
      MAPPED   DATA(mapped).

    COMMIT ENTITIES.

    out->write( mapped ).
    out->write( failed ).
    out->write( reported ).
  ENDMETHOD.
ENDCLASS.
