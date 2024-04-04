CREATE TABLE kimia_farma.kf_rating AS
SELECT provinsi, rating_cabang, rating_transaksi

FROM (
  SELECT provinsi, rating_cabang, rating_transaksi FROM `kimia_farma.kf_analisis_kinerja_bisnis`
  ORDER BY rating_cabang DESC, rating_transaksi ASC
)
  LIMIT 5
;
