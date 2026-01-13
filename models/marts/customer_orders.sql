{{ config(materialized='table') }}

select
    c.CustomerID,
    c.CustomerName,
    c.City,
    count(o.OrderID) as total_orders,
    sum(o.Amount) as total_amount
from {{ source('sf_raw', 'Customers') }} c
left join {{ source('sf_raw', 'Orders') }} o
    on c.CustomerID = o.CustomerID
group by 1,2,3
