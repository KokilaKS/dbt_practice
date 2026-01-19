{{ config (materialized = "table") }}
SELECT
    SHIPMENT_ID,
    ORDER_ID,
    WAREHOUSE_ID,
    SHIPPED_DATE,
    DELIVERY_DATE,
    CARRIER,
    STATUS
FROM
    {{ source('raw', 'RAW_SHIPMENTS') }} a