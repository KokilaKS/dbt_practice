{{ config (materialized = "table") }}
SELECT
    SUPPLIER_ID,
    SUPPLIER_NAME,
    COUNTRY,
    CONTACT_EMAIL
FROM
    {{ source('raw', 'RAW_SUPPLIERS') }} a