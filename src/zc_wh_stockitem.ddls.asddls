@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Stock Item Projection View'
@Metadata.allowExtensions: true
define view entity ZC_WH_StockItem
  provider contract transactional_query
  as projection on ZI_WH_StockItem
{
  key StockUUID,
      WarehouseUUID,
      ProductID,
      ProductName,
      BaseUom,
      Quantity,
      ReorderLevel,
      UnitPrice,
      CurrencyCode,
      LastInventoryCheckOn,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _Warehouse : redirected to parent ZC_WH_Warehouse
}
