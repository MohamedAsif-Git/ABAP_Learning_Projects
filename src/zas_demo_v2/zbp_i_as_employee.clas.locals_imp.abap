CLASS lhc_ZI_AS_EMPLOYEE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_as_employee RESULT result.
    METHODS validateemployee FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_as_employee~validateemployee.

ENDCLASS.

CLASS lhc_ZI_AS_EMPLOYEE IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validateEmployee.
*Get Data from the entity
    READ ENTITIES OF zi_as_employee
    IN LOCAL MODE
    ENTITY zi_as_employee
    FIELDS ( EmployeeName Salary Email )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_employee).

*Validate the records
    LOOP AT lt_employee INTO DATA(ls_employee).
      "Validate Employee Name should not be empty
      IF ls_employee-EmployeeName IS INITIAL.
        "{ Failed-Entity } - To Stop the SAVE operation
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-zi_as_employee.

        "{ Reported-Entity } - To return the messages UI
        "new_message - Shows the message
        APPEND VALUE #( %tky = ls_employee-%tky
                        %msg = new_message( id       = 'ZAS_EMP_MSG'
                                            number   = '001'
                                            severity = if_abap_behv_message=>severity-error )
        ) TO reported-zi_as_employee.

      ENDIF.

      "Validate Salary cannot be less than or equal to 0
      IF ls_employee-Salary <= '0'.
        "FAILED
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-zi_as_employee.
        "REPORTED
        APPEND VALUE #( %tky = ls_employee-%tky
                        %msg = new_message( id = 'ZAS_EMP_MSG'
                                            number = '002'
                                            severity = if_abap_behv_message=>severity-error )
        ) TO reported-zi_as_employee.
      ENDIF.

      "Validate the email
      IF ls_employee-Email IS NOT INITIAL AND
         ls_employee-Email NS '@'.
        "FAILED
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-zi_as_employee.
        "REPORTED
        APPEND VALUE #( %tky = ls_employee-%tky
                        %msg = new_message( id = 'ZAS_EMP_MSG'
                                            number = '003'
                                            severity = if_abap_behv_message=>severity-error )
        ) TO reported-zi_as_employee.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.



ENDCLASS.
