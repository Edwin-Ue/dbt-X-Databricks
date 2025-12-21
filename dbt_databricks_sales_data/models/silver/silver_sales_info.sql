WITH sales AS
(
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('quantity', 'unit_price') }} AS calculated_gross_amount,
        gross_amount,
        payment_method
    FROM
        {{ ref('bronze_sales') }}
),

products AS
(
    SELECT
        product_sk,
        category
    FROM
        {{ ref('bronze_product') }}
),

customer AS
(
    SELECT
        bc.customer_sk,
        lg.explanation AS full_gender
    FROM
        {{ ref('bronze_customer') }} AS bc
    LEFT JOIN 
        {{ ref('lookup_gender') }} AS lg ON lg.gender = bc.gender
)

SELECT
    sales.sales_id,
    sales.gross_amount,
    sales.payment_method,
    products.category,
    customer.full_gender
FROM
    sales
LEFT JOIN 
    products ON sales.product_sk = products.product_sk
LEFT JOIN 
    customer ON sales.customer_sk = customer.customer_sk
