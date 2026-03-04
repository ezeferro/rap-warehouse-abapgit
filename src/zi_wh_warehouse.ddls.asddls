@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define root view entity ZI_WH_Warehouse
  as select from zwh_whouse
  composition [0..*] of ZI_WH_StockItem as _StockItems
{
  key warehouse_uuid         as WarehouseUUID,
      warehouse_id           as WarehouseID,
      warehouse_name         as WarehouseName,
      city                   as City,
      country_code           as CountryCode,
      manager_name           as ManagerName,
      is_active              as IsActive,
      created_by             as CreatedBy,
      created_at             as CreatedAt,
      last_changed_by        as LastChangedBy,
      last_changed_at        as LastChangedAt,
      local_last_changed_at  as LocalLastChangedAt,
      _StockItems
}
