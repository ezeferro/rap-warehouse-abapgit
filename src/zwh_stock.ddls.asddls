@EndUserText.label: 'Warehouse Stock Item'
@AbapCatalog.enhancement.category: #NOT_EXTENSIBLE
@AbapCatalog.tableCategory: #TRANSPARENT
@AbapCatalog.deliveryClass: #A
@AbapCatalog.dataMaintenance: #RESTRICTED
define table zwh_stock {
  key client                 : abap.clnt not null;
  key stock_uuid             : sysuuid_x16 not null;
  warehouse_uuid             : sysuuid_x16;
  product_id                 : abap.char(18);
  product_name               : abap.char(60);
  base_uom                   : abap.unit(3);
  quantity                   : abap.dec(15,3);
  reorder_level              : abap.dec(15,3);
  unit_price                 : abap.dec(15,2);
  currency_code              : abap.cuky;
  last_inventory_check_on    : abap.dats;
  created_by                 : abp_creation_user;
  created_at                 : abp_creation_tstmpl;
  last_changed_by            : abp_lastchange_user;
  last_changed_at            : abp_lastchange_tstmpl;
  local_last_changed_at      : abp_locinst_lastchange_tstmpl;
}
