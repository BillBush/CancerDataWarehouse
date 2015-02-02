SELECT *
FROM
(
SELECT *
from
(select distinct tblmutation.dldir, tblmutation.filepref
from
(SELECT DISTINCT tblmutation.dldir
from tblmutation
limit 5) as view2
join tblmutation on tblmutation.dldir = view2.dldir) as view3
JOIN tblanalysis_id ON UPPER(tblanalysis_id_valuecolumn) = UPPER(
dldir)
LIMIT 5) as view1
/*
(SELECT DISTINCT tblmutation.dldir, tblmutation.filepref, tblanalysis_id.tblresult_id_key
FROM tblmutation
JOIN tblanalysis_id ON UPPER(tblanalysis_id_valuecolumn) = UPPER(dldir)
LIMIT 5) as view1
*/
JOIN tblresult ON tblresult.tblresult_id_key = view1.tblresult_id_key
JOIN tblparticipant_id ON tblparticipant_id.tblresult_id_key = tblresult.tblresult_id_key
JOIN tblshared_bcr_patient_uuid ON UPPER(tblparticipant_id.tblparticipant_id_valuecolumn) = UPPER(tblshared_bcr_patient_uuid_valuecolumn)
LEFT OUTER JOIN tblbrca_patient ON tblbrca_patient.tblbrca_patient_id_key = tblshared_bcr_patient_uuid.tblbrca_patient_id_key
LEFT OUTER JOIN tblbio_patient ON tblbio_patient.tblbio_patient_id_key = tblshared_bcr_patient_uuid.tblbio_patient_id_key
LEFT OUTER JOIN tblomf_patient ON tblomf_patient.tblomf_patient_id_key = tblshared_bcr_patient_uuid.tblomf_patient_id_key
