{{ config (materialized = "table") }}
SELECT
    ORDER_ITEM_ID,
    ORDER_ID,
    PRODUCT_ID,
    QUANTITY,
    PRICE_PER_UNIT,
    DISCOUNT
FROM
    {{ source('raw', 'RAW_ORDER_ITEMS') }} a