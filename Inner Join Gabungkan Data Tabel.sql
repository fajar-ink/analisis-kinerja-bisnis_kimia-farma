CREATE TABLE kimia_farma.contoh_table AS
SELECT transaction_id, date, branch_id, kota, provinsi, rating_cabang, customer_name, product_id, product_name, actual_price, discount_percentage, persentase_gross_laba, nett_sales, (actual_price * persentase_gross_laba) - (actual_price - nett_sales) nett_profit, rating_transaksi

FROM (
  SELECT ft.transaction_id, ft.date, kc.branch_id, kc.kota, kc.provinsi, kc.rating rating_cabang, ft.customer_name, p.product_id, p.product_name, p.price actual_price, ft.discount_percentage,
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 then 0.30
  END persentase_gross_laba,
  p.price-(p.price*discount_percentage) nett_sales, ft.rating rating_transaksi

  FROM kimia_farma.kf_final_transaction AS ft
  INNER JOIN kimia_farma.kf_kantor_cabang AS kc
  ON ft.branch_id = kc.branch_id
  INNER JOIN kimia_farma.kf_product AS p
  ON ft.product_id = p.product_id
);
