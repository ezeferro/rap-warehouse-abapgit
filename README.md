# RAP Warehouse Stock - abapGit Repo

This folder is packaged in abapGit format (`.abapgit.xml` + `src/*`) so you can pull directly in SAP via abapGit.

## Included objects
- TABL: `ZWH_WHOUSE`, `ZWH_STOCK`
- DDLS: `ZI_WH_WAREHOUSE`, `ZI_WH_STOCKITEM`
- DDLS: `ZC_WH_WAREHOUSE`, `ZC_WH_STOCKITEM`
- BDEF: `ZI_WH_WAREHOUSE`, `ZC_WH_WAREHOUSE`
- CLAS: `ZBP_I_WH_WAREHOUSE`
- SRVD: `ZUI_WH_STOCK`
- DDLX: `ZC_WH_WAREHOUSE`, `ZC_WH_STOCKITEM`
- CLAS (data loader): `ZCL_WH_LOAD_MOCK_DATA` (método estático `LOAD`)

## Import steps (abapGit)
1. Push this folder to a GitHub repository root (or keep it as a subfolder and set folder logic/path in abapGit accordingly).
2. In SAP GUI, open abapGit and create/link an online repo to your GitHub URL.
3. Choose your target package and pull.
4. Activate inactive objects if needed.
5. In ADT, create service binding for `ZUI_WH_STOCK` (OData V4 UI), activate and publish.
6. Ejecuta la carga llamando `ZCL_WH_LOAD_MOCK_DATA=>LOAD( )` desde un reporte/clase runner local.

## Notes
- Service binding (`SRVB`) is intentionally not included; it is system-specific and should be generated in target.
- If your system enforces strict auth, add DCL and replace `#NOT_REQUIRED` as needed.
