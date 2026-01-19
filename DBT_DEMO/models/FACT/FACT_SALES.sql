
   {{ config (materialized = "table") }}
   SELECT
        o.order_id,
        oi.order_item_id,
        o.customer_id,
        oi.product_id,
        s.shipment_id,
        w.warehouse_id,
        sp.supplier_id,
        oi.quantity        AS quantity_ordered,
        oi.PRICE_PER_UNIT	AS unit_price,
        oi.DISCOUNT		AS discount_amount,
        o.ORDER_DATE	created_at
    FROM {{ ref('DIM_ORDERS') }} o 
    JOIN {{ ref('DIM_ORDER_ITEMS') }}    oi  ON o.order_id = oi.order_id
    LEFT JOIN {{ ref('DIM_PRODUCTS') }}  p ON oi.product_id = p.product_id
    LEFT JOIN {{ ref('DIM_SHIPMENTS') }} s ON S.ORDER_ID = o.ORDER_ID  -- DIM_SHIPMENTS
    LEFT JOIN {{ ref('DIM_WAREHOUSE') }} w ON w.WAREHOUSE_ID = s.WAREHOUSE_ID  -- DIM_WAREHOUSE
    LEFT JOIN {{ ref('DIM_SUPPLIERS') }} sp ON sp.SUPPLIER_ID = p.SUPPLIER_ID 
