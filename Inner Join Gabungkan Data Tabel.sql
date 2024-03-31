SELECT ft.transaction_id, ft.date, kc.branch_id, kc.branch_name
FROM rakamin-kf-analytics-418715.kimia_farma.kf_final_transaction as ft
INNER JOIN rakamin-kf-analytics-418715.kimia_farma.kf_kantor_cabang as kc
ON ft.branch_id = kc.branch_id;
