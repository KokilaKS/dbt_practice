{{ config (materialized = "table") }}
SELECT
    PAYMENT_ID,
    ORDER_ID,
    PAYMENT_METHOD,
    PAYMENT_DATE,
    PAYMENT_STATUS,
    AMOUNT
FROM
    {{ source('raw', 'RAW_PAYMENTS') }} a