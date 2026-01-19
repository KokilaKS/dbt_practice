{{ config (materialized = "table") }}
SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    STATUS,
    TOTAL_AMOUNT
FROM
    {{ source('raw', 'RAW_ORDERS') }} a