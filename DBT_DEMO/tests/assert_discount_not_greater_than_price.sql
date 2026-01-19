-- Any rows returned by this query represent a data quality failure.
SELECT
    order_item_id,
    unit_price,
    discount_amount
FROM {{ ref('FACT_SALES') }}
WHERE discount_amount > unit_price