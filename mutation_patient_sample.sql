DROP VIEW vwpatientsamplemutation;
CREATE VIEW vwpatientsamplemutation AS
SELECT DISTINCT 
tblparticipant_id_valuecolumn AS pat_uuid, 
tblsample_id_valuecolumn AS sample_uuid,
dldir AS mutation_set_uuid
FROM
tbldldir
JOIN tblanalysis_id ON UPPER(tblanalysis_id_valuecolumn) = UPPER(dldir)
JOIN tblresult ON tblresult.tblresult_id_key = tblanalysis_id.tblresult_id_key
JOIN tblparticipant_id ON tblparticipant_id.tblresult_id_key = tblresult.tblresult_id_key
JOIN tblsample_id ON tblsample_id.tblresult_id_key = tblresult.tblresult_id_key
--ORDER BY patient_uuid, sample_uuid, mutation_set_uuid
