{% snapshot customers_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols=['email', 'city'],
    )
}}

select * from {{ ref('DIM_CUSTOMERS') }}

{% endsnapshot %}