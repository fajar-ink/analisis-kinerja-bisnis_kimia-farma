SELECT ft.transaction_id, ft.date, kc.branch_id, kc.branch_name, kc.kota, kc.provinsi, kc.rating as rating_cabang, ft.customer_name, p.product_id, p.product_name, p.price as actual_price, ft.discount_percentage,
CASE
  when p.price <= 50000 then 0.1
  when p.price between 50000 and 100000 then 0.15
  when p.price between 100000 and 300000 then 0.2
  when p.price between 300000 and 500000 then 0.25
  else 0.3
end as persentase_gross_laba,
p.price-(p.price * ft.discount_percentage) as nett_sales,
CASE
  when p.price <= 50000 then 0.1 * (p.price-(p.price * ft.discount_percentage))
  when p.price between 50000 and 100000 then 0.15 * (p.price-(p.price * ft.discount_percentage))
  when p.price between 100000 and 300000 then 0.2 * (p.price-(p.price * ft.discount_percentage))
  when p.price between 300000 and 500000 then 0.25 * (p.price-(p.price * ft.discount_percentage))
  else 0.3 * (p.price-(p.price * ft.discount_percentage))
end as nett_profit


FROM rakamin-kf-analytics-418715.kimia_farma.kf_final_transaction as ft
INNER JOIN rakamin-kf-analytics-418715.kimia_farma.kf_kantor_cabang as kc
ON ft.branch_id = kc.branch_id
INNER JOIN rakamin-kf-analytics-418715.kimia_farma.kf_product as p
ON ft.product_id = p.product_id
;
