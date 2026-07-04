CLASS zcl_as_table_data_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_as_table_data_insert IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_airline TYPE STANDARD TABLE OF zas_airline.

    DELETE FROM zas_airline.

    lt_airline = VALUE #(

    ( airline_id = 'AI'
      airline_name = 'Air India'
      country = 'IND'
      currency = 'INR'
      created_by = sy-uname
      created_on = sy-datum )

    ).

    INSERT zas_airline FROM TABLE @lt_airline.

    COMMIT WORK.

  ENDMETHOD.
ENDCLASS.

