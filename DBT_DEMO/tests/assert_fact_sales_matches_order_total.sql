-- This test fails if the sum of unit prices in items doesn't match the order total
with item_totals as (
    select order_id, sum(unit_price * quantity_ordered) as calculated_total
    from {{ ref('FACT_SALES') }}
    group by 1
),
order_totals as (
    select order_id, total_amount
    from {{ ref('DIM_ORDERS') }}
)
select i.order_id
from item_totals i
join order_totals o on i.order_id = o.order_id
where abs(i.calculated_total - o.total_amount) > 0.01