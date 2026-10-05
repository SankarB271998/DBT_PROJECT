{% set configs = [
    {
        "table":"AIRBNB.gold.OBT",
        "columns": "gold_obt.booking_id,gold_obt.listing_id,gold_obt.host_id,gold_obt.total_amount,gold_obt.cleaning_fee,gold_obt.service_fee,gold_obt.accommodates,gold_obt.bedrooms,gold_obt.bathrooms,gold_obt.price_per_night,gold_obt.response_rate",
        "alias": "gold_obt"
    },
    {
        "table":"AIRBNB.gold.DIM_LISTINGS",
        "columns": "",
        "alias": "DIM_listings",
        "join_condition": "gold_obt.listing_id = DIM_listings.listing_id"        
    },
    {
        "table":"AIRBNB.gold.DIM_HOSTS",
        "columns": "",
        "alias": "DIM_hosts",
        "join_condition": "gold_obt.host_id = DIM_hosts.host_id"        
    }

] %}


SELECT
    
        {{ configs[0]['columns'] }}

FROM
    {% for config in configs %}
    {% if loop.first %}
        {{ config['table'] }} AS {{ config ['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config ['join_condition'] }}
    {% endif %}
    {% endfor %}
