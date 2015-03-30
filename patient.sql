/*
CREATE OR REPLACE FUNCTION fnGetPatInfo(patuuid character varying) RETURNS integer AS $$
SELECT tblbrca_patient_id_key
FROM tblshared_bcr_patient_uuid
JOIN tblparticipant_id ON tblparticipant_id.tblparticipant_id_valuecolumn = tblshared_bcr_patient_uuid.tblshared_bcr_patient_uuid_valuecolumn
AND trim(both ' ' from tblparticipant_id.tblparticipant_id_valuecolumn) = trim(both ' ' from $1)
LIMIT 1
$$ LANGUAGE SQL;
*/
DROP VIEW vwPatient;
CREATE OR REPLACE VIEW vwPatient AS

SELECT
tblshared_bcr_patient_uuid_valuecolumn AS pat_uuid,
(tblshared_year_of_initial_pathologic_diagnosis_valuecolumn 
- tblshared_age_at_initial_pathologic_diagnosis_valuecolumn) AS pat_birth_yr,
tblshared_gender.tblshared_gender_valuecolumn AS pat_sex,
(CASE WHEN tblshared_race_valuecolumn IS NULL OR TRIM(BOTH ' ' FROM tblshared_race_valuecolumn) = '' THEN tblshared_ethnicity_valuecolumn ELSE tblshared_race_valuecolumn END) AS pat_race,
tblshared_year_of_initial_pathologic_diagnosis_valuecolumn AS pat_initial_dx_yr,
tblshared_prior_dx_valuecolumn AS pat_pior_dx,
tblshared_history_of_neoadjuvant_treatment_valuecolumn AS pat_history_of_neoadjuvant_treatment,
tblshared_vital_status_valuecolumn AS pat_vital_status,
(tblshared_year_of_initial_pathologic_diagnosis_valuecolumn + (tblshared_days_to_death_valuecolumn / 365)) AS pat_death_yr
FROM
tblshared_bcr_patient_uuid
JOIN tblbrca_patient
	ON tblshared_bcr_patient_uuid.tblbrca_patient_id_key 
	= fnGetPatInfo(tblshared_bcr_patient_uuid.tblshared_bcr_patient_uuid_valuecolumn)
	AND tblbrca_patient.tblbrca_patient_id_key = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
	--AND tblbrca_patient.tblbrca_patient_id_key = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
LEFT JOIN tblshared_prior_dx 
	ON tblshared_prior_dx.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
LEFT JOIN tblshared_gender 
	ON tblshared_gender.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
LEFT JOIN tblshared_history_of_neoadjuvant_treatment 
	ON tblshared_history_of_neoadjuvant_treatment.tblbrca_patient_id_key 
	= tblbrca_patient.tblbrca_patient_id_key 
LEFT JOIN tblshared_race 
	ON tblshared_race.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key 
LEFT JOIN tblshared_year_of_initial_pathologic_diagnosis 
	ON tblshared_year_of_initial_pathologic_diagnosis.tblbrca_patient_id_key 
	= tblbrca_patient.tblbrca_patient_id_key 
LEFT JOIN tblshared_ethnicity 
	ON tblshared_ethnicity.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
LEFT JOIN tblshared_age_at_initial_pathologic_diagnosis
	ON tblbrca_patient.tblbrca_patient_id_key 
	= tblshared_age_at_initial_pathologic_diagnosis.tblbrca_patient_id_key
LEFT JOIN tblshared_vital_status
	ON tblbrca_patient.tblbrca_patient_id_key 
	= tblshared_vital_status.tblbrca_patient_id_key
LEFT JOIN tblshared_days_to_death
	ON tblbrca_patient.tblbrca_patient_id_key 
	= tblshared_days_to_death.tblbrca_patient_id_key
--LIMIT 5
;
