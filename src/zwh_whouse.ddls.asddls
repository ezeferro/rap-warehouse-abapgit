@EndUserText.label: 'Warehouse Header'
@AbapCatalog.enhancement.category: #NOT_EXTENSIBLE
@AbapCatalog.tableCategory: #TRANSPARENT
@AbapCatalog.deliveryClass: #A
@AbapCatalog.dataMaintenance: #RESTRICTED
define table zwh_whouse {
  key client                 : abap.clnt not null;
  key warehouse_uuid         : sysuuid_x16 not null;
  warehouse_id               : abap.char(8);
  warehouse_name             : abap.char(60);
  city                       : abap.char(40);
  country_code               : abap.char(3);
  manager_name               : abap.char(60);
  is_active                  : abap_boolean;
  created_by                 : abp_creation_user;
  created_at                 : abp_creation_tstmpl;
  last_changed_by            : abp_lastchange_user;
  last_changed_at            : abp_lastchange_tstmpl;
  local_last_changed_at      : abp_locinst_lastchange_tstmpl;
}
