SELECT ft.transaction_id, ft.date, kc.branch_id, kc.branch_name, kc.kota, kc.provinsi, kc.rating as rating_cabang, ft.customer_name, p.product_id, p.product_name, p.price as actual_price, ft.discount_percentage, 

FROM rakamin-kf-analytics-418715.kimia_farma.kf_final_transaction as ft
INNER JOIN rakamin-kf-analytics-418715.kimia_farma.kf_kantor_cabang as kc
ON ft.branch_id = kc.branch_id
INNER JOIN rakamin-kf-analytics-418715.kimia_farma.kf_product as p
ON ft.product_id = p.product_id;
