{{ config (materialized = "table") }}
SELECT
    RETURN_ID,
    ORDER_ID,
    PRODUCT_ID,
    RETURN_REASON,
    RETURN_DATE,
    REFUND_AMOUNT
FROM
    {{ source('raw', 'RAW_RETURNS') }} a