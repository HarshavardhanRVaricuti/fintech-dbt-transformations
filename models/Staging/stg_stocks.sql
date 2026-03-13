WITH raw_data AS (
    -- In dbt, we select from the raw table we created in Snowflake
    SELECT * FROM FINTECH_DB.RAW.RAW_STOCKS
),

renamed_and_cast AS (
    SELECT
        DATE::DATE AS trade_date,
        TICKER::VARCHAR AS symbol,
        OPEN::FLOAT AS open_price,
        HIGH::FLOAT AS high_price,
        LOW::FLOAT AS low_price,
        CLOSE::FLOAT AS close_price,
        VOLUME::BIGINT AS trading_volume
    FROM raw_data
)

SELECT * FROM renamed_and_cast