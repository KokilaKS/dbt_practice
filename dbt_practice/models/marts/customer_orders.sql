{{ config(materialized='table') }}
-- CI/CD test change from dev

select
    c.CustomerID,
    c.CustomerName,
    c.City,
    count(o.OrderID) as total_orders,
    sum(o.Amount) as total_amount
from {{ source('sf_raw', 'customers') }} c
left join {{ source('sf_raw', 'orders') }} o
    on c.CustomerID = o.CustomerID
group by 1,2,3
