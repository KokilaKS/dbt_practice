{{ config (materialized = "table") }}
SELECT
    WAREHOUSE_ID,
    WAREHOUSE_NAME,
    "location" WAREHOUSE_LOCATION,
    CAPACITY
FROM
    {{ source('raw', 'RAW_WAREHOUSES') }} a