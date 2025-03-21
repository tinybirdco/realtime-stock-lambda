SELECT
    concat('ITEM_', toString(rand() % 1000)) AS item_id,
    ['NYC', 'LAX', 'CHI', 'MIA', 'SEA'][(rand() % 5) + 1] AS location,
    ['in_stock', 'out_of_stock', 'low_stock', 'reserved'][(rand() % 4) + 1] AS status,
    rand() % 1000 AS quantity,
    now() - rand() % 86400 AS created_at,
    now() - rand() % 43200 AS updated_at
FROM numbers(10)