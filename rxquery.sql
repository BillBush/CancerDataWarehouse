﻿SELECT tblrx_bcr_drug_uuid_valuecolumn, tblrx_total_dose_valuecolumn, tblrx_total_dose_units_valuecolumn,
tblrx_number_cycles_valuecolumn, tblrx_days_to_drug_therapy_start_valuecolumn
FROM tblrx_drug
LEFT JOIN tblrx_bcr_drug_uuid ON tblrx_drug.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_total_dose ON tblrx_total_dose.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_total_dose_units ON tblrx_total_dose_units.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_number_cycles ON tblrx_number_cycles.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LEFT JOIN tblrx_days_to_drug_therapy_start ON tblrx_days_to_drug_therapy_start.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
LIMIT 5