SELECT vwclinicalrx.*, vwsample.*
FROM vwsample
JOIN vwclinicalrx
ON vwclinicalrx.patient_uuid = vwsample.patient_uuid
AND 	((drug_therapy_start_date < collection_date 
	AND drug_therapy_stop_date > collection_date)
	OR (drug_therapy_stop_date < collection_date
	AND (collection_date - drug_therapy_stop_date) < 30))
LIMIT 5