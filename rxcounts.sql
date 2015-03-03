SELECT vwclinicalrx.*, vwsample.*
FROM vwsample
JOIN vwclinicalrx
ON vwclinicalrx.patient_uuid = vwsample.patient_uuid
AND 	((therapy_start_date < collection_date 
	AND therapy_stop_date > collection_date)
	OR (therapy_stop_date < collection_date
	AND (collection_date - therapy_stop_date) < 30))
LIMIT 5