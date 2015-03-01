﻿CREATE OR REPLACE VIEW vwClinicalRad AS 
SELECT
tblshared_bcr_patient_uuid.tblshared_bcr_patient_uuid_valuecolumn,
tblshared_day_of_form_completion.tblshared_day_of_form_completion_valuecolumn,
tblshared_month_of_form_completion.tblshared_month_of_form_completion_valuecolumn,
tblshared_year_of_form_completion.tblshared_year_of_form_completion_valuecolumn,
tblrad_anatomic_treatment_site_valuecolumn,
tblrad_bcr_radiation_uuid_valuecolumn,
tblrad_course_number_valuecolumn,
tblrad_days_to_radiation_therapy_start_valuecolumn AS tblrad_days_to_radiation_therapy_start_iffy,
tblrad_days_to_radiation_therapy_end_valuecolumn AS tblrad_days_to_radiation_therapy_end_iffy,
tblrad_numfractions_valuecolumn AS tblrad_numfractions_iffy, --the quantity of tot radiation therapy fractions.
tblrad_radiation_dosage_valuecolumn,
tblrad_radiation_treatment_ongoing_valuecolumn,
tblrad_radiation_type_valuecolumn,
tblrad_units_valuecolumn
FROM tblbrca_patient
LEFT JOIN tblshared_bcr_patient_uuid 
	ON tblbrca_patient.tblbrca_patient_id_key = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
LEFT JOIN tblrad_radiations
	ON tblbrca_patient.tblbrca_patient_id_key=tblrad_radiations.tblbrca_patient_id_key
LEFT JOIN tblrad_radiation
	ON tblrad_radiations.tblrad_radiations_id_key=tblrad_radiation.tblrad_radiations_id_key
LEFT JOIN tblrad_anatomic_treatment_site
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_anatomic_treatment_site.tblrad_radiation_id_key
LEFT JOIN tblrad_bcr_radiation_uuid
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_bcr_radiation_uuid.tblrad_radiation_id_key
LEFT JOIN tblrad_course_number
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_course_number.tblrad_radiation_id_key
LEFT JOIN tblrad_days_to_radiation_therapy_start
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_days_to_radiation_therapy_start.tblrad_radiation_id_key
LEFT JOIN tblrad_days_to_radiation_therapy_end
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_days_to_radiation_therapy_end.tblrad_radiation_id_key
LEFT JOIN tblrad_numfractions
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_numfractions.tblrad_radiation_id_key
LEFT JOIN tblrad_radiation_dosage
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_radiation_dosage.tblrad_radiation_id_key
LEFT JOIN tblrad_radiation_treatment_ongoing
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_radiation_treatment_ongoing.tblrad_radiation_id_key
LEFT JOIN tblrad_radiation_type
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_radiation_type.tblrad_radiation_id_key
LEFT JOIN tblrad_units
	ON tblrad_radiation.tblrad_radiation_id_key=tblrad_units.tblrad_radiation_id_key
LEFT JOIN tblshared_day_of_form_completion
	ON tblrad_radiation.tblrad_radiation_id_key = tblshared_day_of_form_completion.tblrad_radiation_id_key
LEFT JOIN tblshared_month_of_form_completion
	ON tblrad_radiation.tblrad_radiation_id_key = tblshared_month_of_form_completion.tblrad_radiation_id_key
LEFT JOIN tblshared_year_of_form_completion
	ON tblrad_radiation.tblrad_radiation_id_key = tblshared_year_of_form_completion.tblrad_radiation_id_key
LIMIT 5