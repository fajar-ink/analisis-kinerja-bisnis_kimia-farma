CREATE TABLE kimia_farma.contoh_table AS
SELECT transaction_id, date, branch_id
FROM (
  SELECT ft.transaction_id, ft.date, kc.branch_id

  FROM kimia_farma.kf_final_transaction AS ft
  INNER JOIN kimia_farma.kf_kantor_cabang AS kc
  ON ft.branch_id = kc.branch_id
);
