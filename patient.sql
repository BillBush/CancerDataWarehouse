SELECT mainview.patient_id, mainview.sample_id, mainview.mutation_set_id,
tblshared_prior_dx.tblshared_prior_dx_valuecolumn, tblshared_gender.tblshared_gender_valuecolumn, tblshared_days_to_birth.tblshared_days_to_birth_valuecolumn, tblshared_history_of_neoadjuvant_treatment.tblshared_history_of_neoadjuvant_treatment_valuecolumn, tblshared_race.tblshared_race_valuecolumn, tblshared_year_of_initial_pathologic_diagnosis.tblshared_year_of_initial_pathologic_diagnosis_valuecolumn, tblshared_ethnicity.tblshared_ethnicity_valuecolumn, tbladmin_day_of_dcc_upload.tbladmin_day_of_dcc_upload_valuecolumn, tbladmin_month_of_dcc_upload.tbladmin_month_of_dcc_upload_valuecolumn, tbladmin_year_of_dcc_upload.tbladmin_year_of_dcc_upload_valuecolumn
FROM
(SELECT DISTINCT tblparticipant_id_valuecolumn AS patient_id, tblsample_id_valuecolumn AS sample_id, filepref AS mutation_set_id
FROM
 (SELECT *
  FROM
   (SELECT DISTINCT tblmutation.dldir, tblmutation.filepref
    FROM
     (SELECT DISTINCT tblmutation.dldir
      FROM tblmutation
      LIMIT 5
     ) AS view2
    JOIN tblmutation ON tblmutation.dldir = view2.dldir
   ) AS view3
   LEFT OUTER JOIN tblanalysis_id ON UPPER(tblanalysis_id_valuecolumn) = UPPER(dldir)
 ) AS view1
 JOIN tblresult ON tblresult.tblresult_id_key = view1.tblresult_id_key
 JOIN tblparticipant_id ON tblparticipant_id.tblresult_id_key = tblresult.tblresult_id_key
 JOIN tblsample_id ON tblsample_id.tblresult_id_key = tblresult.tblresult_id_key) AS mainview
JOIN tblshared_bcr_patient_uuid ON mainview.patient_id = tblshared_bcr_patient_uuid.tblshared_bcr_patient_uuid_valuecolumn
JOIN tblbrca_patient ON tblbrca_patient.tblbrca_patient_id_key = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
JOIN tblshared_prior_dx ON tblshared_prior_dx.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
JOIN tblshared_gender ON tblshared_gender.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
JOIN tblshared_days_to_birth ON tblshared_days_to_birth.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
JOIN tblshared_history_of_neoadjuvant_treatment ON tblshared_history_of_neoadjuvant_treatment.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key 
JOIN tblshared_race ON tblshared_race.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key 
JOIN tblshared_year_of_initial_pathologic_diagnosis ON tblshared_year_of_initial_pathologic_diagnosis.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key 
JOIN tblshared_ethnicity ON tblshared_ethnicity.tblbrca_patient_id_key = tblbrca_patient.tblbrca_patient_id_key
JOIN tblbrca_tcga_bcr ON tblbrca_patient.tblbrca_tcga_bcr_id_key = 
tblbrca_tcga_bcr.tblbrca_tcga_bcr_id_key
JOIN tbladmin_admin ON tbladmin_admin.tblbrca_tcga_bcr_id_key =
tblbrca_tcga_bcr.tblbrca_tcga_bcr_id_key
JOIN tbladmin_day_of_dcc_upload ON tbladmin_day_of_dcc_upload.tbladmin_admin_id_key = 
tbladmin_admin.tbladmin_admin_id_key
JOIN tbladmin_month_of_dcc_upload ON tbladmin_month_of_dcc_upload.tbladmin_admin_id_key = 
tbladmin_admin.tbladmin_admin_id_key
JOIN tbladmin_year_of_dcc_upload ON tbladmin_year_of_dcc_upload.tbladmin_admin_id_key = 
tbladmin_admin.tbladmin_admin_id_key
