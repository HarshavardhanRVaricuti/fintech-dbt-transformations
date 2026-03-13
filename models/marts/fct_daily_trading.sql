with
    staging_stocks as (
        select * from {{ ref("stg_stocks") }}
    ),

    business_logic as (
        select
            trade_date,
            symbol,
            open_price,
            close_price,
            -- Calculate the dollar change and percentage change for the day
            (close_price - open_price) as daily_dollar_change,
            round(
                ((close_price - open_price) / open_price) * 100, 2
            ) as daily_percent_change,
            trading_volume
        from staging_stocks
    )

select *
from business_logic
