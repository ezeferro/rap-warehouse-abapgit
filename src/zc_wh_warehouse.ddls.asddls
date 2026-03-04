@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Projection View'
@Metadata.allowExtensions: true
define root view entity ZC_WH_Warehouse
  provider contract transactional_query
  as projection on ZI_WH_Warehouse
{
  key WarehouseUUID,
      WarehouseID,
      WarehouseName,
      City,
      CountryCode,
      ManagerName,
      IsActive,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _StockItems : redirected to composition child ZC_WH_StockItem
}
