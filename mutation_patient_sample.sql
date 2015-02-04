SELECT DISTINCT tblparticipant_id_valuecolumn AS patient_id, tblsample_id_valuecolumn AS sample_id, filepref AS mutation_set_id
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
 JOIN tblsample_id ON tblsample_id.tblresult_id_key = tblresult.tblresult_id_key
/*
 LEFT OUTER JOIN tblshared_bcr_patient_uuid 
  ON UPPER(tblparticipant_id.tblparticipant_id_valuecolumn)
   = UPPER(tblshared_bcr_patient_uuid_valuecolumn)
 LEFT OUTER JOIN tblbrca_patient
  ON tblbrca_patient.tblbrca_patient_id_key
   = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
 LEFT OUTER JOIN tblbio_patient
  ON tblbio_patient.tblbio_patient_id_key = tblshared_bcr_patient_uuid.tblbio_patient_id_key
 LEFT OUTER JOIN tblomf_patient
  ON tblomf_patient.tblomf_patient_id_key = tblshared_bcr_patient_uuid.tblomf_patient_id_key
*/
ORDER BY patient_id, sample_id, mutation_set_id