CLASS zcl_wh_load_mock_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS load
      RETURNING VALUE(rv_message) TYPE string.
ENDCLASS.

CLASS zcl_wh_load_mock_data IMPLEMENTATION.
  METHOD load.
    DATA: lt_wh    TYPE STANDARD TABLE OF zwh_whouse,
          lt_stock TYPE STANDARD TABLE OF zwh_stock.

    GET TIME STAMP FIELD DATA(lv_ts).

    DELETE FROM zwh_stock.
    DELETE FROM zwh_whouse.

    lt_wh = VALUE #(
      ( client = sy-mandt warehouse_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_id = 'NYC001' warehouse_name = 'New York Main DC' city = 'New York' country_code = 'USA' manager_name = 'Olivia Carter' is_active = abap_true )
      ( client = sy-mandt warehouse_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_id = 'DAL001' warehouse_name = 'Dallas Regional Hub' city = 'Dallas' country_code = 'USA' manager_name = 'Ethan Brooks' is_active = abap_true )
      ( client = sy-mandt warehouse_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_id = 'MIA001' warehouse_name = 'Miami Cross-Dock' city = 'Miami' country_code = 'USA' manager_name = 'Sophia Ramirez' is_active = abap_true )
      ( client = sy-mandt warehouse_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_id = 'CHI001' warehouse_name = 'Chicago Overflow Site' city = 'Chicago' country_code = 'USA' manager_name = 'Liam Bennett' is_active = abap_false )
    ).

    LOOP AT lt_wh ASSIGNING FIELD-SYMBOL(<ls_wh>).
      <ls_wh>-created_by            = sy-uname.
      <ls_wh>-created_at            = lv_ts.
      <ls_wh>-last_changed_by       = sy-uname.
      <ls_wh>-last_changed_at       = lv_ts.
      <ls_wh>-local_last_changed_at = lv_ts.
    ENDLOOP.

    INSERT zwh_whouse FROM TABLE @lt_wh.

    READ TABLE lt_wh WITH KEY warehouse_id = 'NYC001' INTO DATA(ls_nyc).
    READ TABLE lt_wh WITH KEY warehouse_id = 'DAL001' INTO DATA(ls_dal).
    READ TABLE lt_wh WITH KEY warehouse_id = 'MIA001' INTO DATA(ls_mia).
    READ TABLE lt_wh WITH KEY warehouse_id = 'CHI001' INTO DATA(ls_chi).

    lt_stock = VALUE #(
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_nyc-warehouse_uuid product_id = 'FG-LAP-15' product_name = '15-inch Business Laptop' base_uom = 'EA' quantity = '145.000' reorder_level = '60.000' unit_price = '980.00' currency_code = 'USD' last_inventory_check_on = '20260225' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_nyc-warehouse_uuid product_id = 'ACC-DOCK-01' product_name = 'USB-C Docking Station' base_uom = 'EA' quantity = '420.000' reorder_level = '120.000' unit_price = '129.00' currency_code = 'USD' last_inventory_check_on = '20260227' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_dal-warehouse_uuid product_id = 'FG-MON-27' product_name = '27-inch 4K Monitor' base_uom = 'EA' quantity = '96.000' reorder_level = '40.000' unit_price = '315.00' currency_code = 'USD' last_inventory_check_on = '20260226' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_dal-warehouse_uuid product_id = 'ACC-KBD-M' product_name = 'Mechanical Keyboard' base_uom = 'EA' quantity = '380.000' reorder_level = '150.000' unit_price = '74.50' currency_code = 'USD' last_inventory_check_on = '20260224' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_mia-warehouse_uuid product_id = 'NET-AP-6E' product_name = 'WiFi 6E Access Point' base_uom = 'EA' quantity = '210.000' reorder_level = '90.000' unit_price = '189.00' currency_code = 'USD' last_inventory_check_on = '20260228' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_mia-warehouse_uuid product_id = 'PWR-UPS-2K' product_name = '2kVA Rack UPS' base_uom = 'EA' quantity = '54.000' reorder_level = '20.000' unit_price = '640.00' currency_code = 'USD' last_inventory_check_on = '20260223' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_chi-warehouse_uuid product_id = 'CAB-CAT6-3' product_name = 'Cat6 Patch Cable 3m' base_uom = 'EA' quantity = '1250.000' reorder_level = '400.000' unit_price = '4.20' currency_code = 'USD' last_inventory_check_on = '20260220' )
      ( client = sy-mandt stock_uuid = cl_system_uuid=>create_uuid_x16_static( ) warehouse_uuid = ls_chi-warehouse_uuid product_id = 'CAB-CAT6-5' product_name = 'Cat6 Patch Cable 5m' base_uom = 'EA' quantity = '820.000' reorder_level = '300.000' unit_price = '5.80' currency_code = 'USD' last_inventory_check_on = '20260220' )
    ).

    LOOP AT lt_stock ASSIGNING FIELD-SYMBOL(<ls_stock>).
      <ls_stock>-created_by            = sy-uname.
      <ls_stock>-created_at            = lv_ts.
      <ls_stock>-last_changed_by       = sy-uname.
      <ls_stock>-last_changed_at       = lv_ts.
      <ls_stock>-local_last_changed_at = lv_ts.
    ENDLOOP.

    INSERT zwh_stock FROM TABLE @lt_stock.
    COMMIT WORK.
    rv_message = |Warehouses loaded: { lines( lt_wh ) }, Stock items loaded: { lines( lt_stock ) }|.
  ENDMETHOD.
ENDCLASS.
