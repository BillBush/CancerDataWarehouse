﻿DROP VIEW vwClinicalRx;
CREATE OR REPLACE VIEW vwClinicalRx AS 
SELECT 
mainview.tblshared_bcr_patient_uuid_valuecolumn AS pat_uuid,
(mainview.form_complete_date + CAST(mainview.tblrx_days_to_drug_therapy_start_valuecolumn AS INT)) AS drug_therapy_start_date,
(mainview.form_complete_date + CAST(mainview.tblrx_days_to_drug_therapy_end_valuecolumn AS INT)) AS drug_therapy_stop_date, 
UPPER(TRIM(BOTH ' ' FROM mainview.tblrx_drug_name_valuecolumn)) AS drug_name,
mainview.tblrx_bcr_drug_uuid_valuecolumn AS drug_uuid
FROM
(SELECT
tblshared_bcr_patient_uuid_valuecolumn,
to_date(concat(tblshared_year_of_form_completion_valuecolumn,
	to_char(tblshared_month_of_form_completion_valuecolumn, '09'),
	to_char(tblshared_day_of_form_completion_valuecolumn, '09')), 'YYYY MM DD') AS form_complete_date,
tblrx_bcr_drug_uuid_valuecolumn,
tblrx_total_dose_valuecolumn,
tblrx_total_dose_units_valuecolumn,
tblrx_number_cycles_valuecolumn,
tblrx_days_to_drug_therapy_start_valuecolumn,
tblrx_days_to_drug_therapy_end_valuecolumn,
tblrx_drug_name_valuecolumn
FROM tblbrca_patient
LEFT JOIN tblshared_bcr_patient_uuid 
	ON tblbrca_patient.tblbrca_patient_id_key = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
LEFT JOIN tblrx_drugs ON tblbrca_patient.tblbrca_patient_id_key=tblrx_drugs.tblbrca_patient_id_key
LEFT JOIN tblrx_drug ON tblrx_drugs.tblrx_drugs_id_key=tblrx_drug.tblrx_drugs_id_key
LEFT JOIN tblrx_bcr_drug_uuid ON tblrx_drug.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_total_dose ON tblrx_total_dose.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_total_dose_units 
	ON tblrx_total_dose_units.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_number_cycles 
	ON tblrx_number_cycles.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_days_to_drug_therapy_start 
	ON tblrx_days_to_drug_therapy_start.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_days_to_drug_therapy_end 
	ON tblrx_days_to_drug_therapy_end.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_drug_name 
	ON tblrx_drug_name.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblshared_day_of_form_completion 
	ON tblshared_day_of_form_completion.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblshared_month_of_form_completion 
	ON tblshared_month_of_form_completion.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblshared_year_of_form_completion 
	ON tblshared_year_of_form_completion.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
) AS mainview
--LIMIT 5
;