{{ config (materialized = "table") }}
SELECT
  d_order.ORDER_ID ,
  d_order.ORDER_DATE ,
    d_customer.CUSTOMER_ID,
    p.PAYMENT_ID ,
    p.PAYMENT_METHOD ,
    p.PAYMENT_DATE,
    p.AMOUNT PAID_AMOUNT,
    p.payment_status
FROM {{ ref('DIM_PAYMENTS') }} p
LEFT JOIN {{ ref('DIM_ORDERS') }} d_order      ON p.order_id = d_order.order_id
INNER JOIN {{ref('DIM_CUSTOMERS') }} d_customer ON d_order.customer_id = d_customer.customer_id 
--WHERE d_customer.CUSTOMER_ID  IS NOT null
