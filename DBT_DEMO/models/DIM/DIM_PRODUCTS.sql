{{ config (materialized = "table") }}
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    PRICE,
    SUPPLIER_ID,
    CREATED_AT
FROM
    {{ source('raw', 'RAW_PRODUCTS') }} a