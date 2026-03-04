@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Stock Item Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_WH_StockItem
  as select from zwh_stock
  association to parent ZI_WH_Warehouse as _Warehouse
    on $projection.WarehouseUUID = _Warehouse.WarehouseUUID
{
  key stock_uuid                 as StockUUID,
      warehouse_uuid             as WarehouseUUID,
      product_id                 as ProductID,
      product_name               as ProductName,
      @Semantics.unitOfMeasure: true
      base_uom                   as BaseUom,
      @Semantics.quantity.unitOfMeasure: 'BaseUom'
      quantity                   as Quantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUom'
      reorder_level              as ReorderLevel,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      unit_price                 as UnitPrice,
      @Semantics.currencyCode: true
      currency_code              as CurrencyCode,
      last_inventory_check_on    as LastInventoryCheckOn,
      created_by                 as CreatedBy,
      created_at                 as CreatedAt,
      last_changed_by            as LastChangedBy,
      last_changed_at            as LastChangedAt,
      local_last_changed_at      as LocalLastChangedAt,
      _Warehouse
}
