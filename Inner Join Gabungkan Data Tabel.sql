CREATE TABLE kimia_farma.contoh_table AS
SELECT transaction_id, date, branch_id, kota, provinsi, rating_cabang, customer_name, product_id, product_name, actual_price
FROM (
  SELECT ft.transaction_id, ft.date, kc.branch_id, kc.kota, kc.provinsi, kc.rating rating_cabang, ft.customer_name, p.product_id, p.product_name, p.price actual_price

  FROM kimia_farma.kf_final_transaction AS ft
  INNER JOIN kimia_farma.kf_kantor_cabang AS kc
  ON ft.branch_id = kc.branch_id
  INNER JOIN kimia_farma.kf_product AS p
  ON ft.product_id = p.product_id
);
