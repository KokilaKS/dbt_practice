{{ config (materialized = "table") }}
SELECT
    CUSTOMER_ID,
    "name" as CUSTOMER_NAME,
    EMAIL,
    CITY,
    STATE,
    COUNTRY,
    REGISTRATION_DATE
FROM
    {{ source('raw', 'RAW_CUSTOMERS') }} a
    ----- dim_customers
    