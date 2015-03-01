
CREATE OR REPLACE VIEW vwSample AS 
SELECT vw_patient_sample_mutation.patient_id AS patient_id,vw_patient_sample_mutation.mutation_set_id AS mutation_set_id,
vw_patient_sample_mutation.sample_id AS sample_id,tblbio_sample_type_valuecolumn AS sample_value_column,tblbio_sample_type_id_valuecolumn AS sample_type_id,
tblbio_initial_weight_valuecolumn AS initial_weight,tblbio_percent_lymphocyte_infiltration_valuecolumn AS percent_lymphocyte_infiltration,
tblbio_percent_monocyte_infiltration_valuecolumn AS percent_monocyte_infiltration,tblbio_percent_necrosis_valuecolumn AS percent_necrosis,
tblbio_percent_neutrophil_infiltration_valuecolumn AS percent_infiltration,tblbio_percent_normal_cells_valuecolumn AS percent_normal_cells,
tblbio_percent_stromal_cells_valuecolumn AS percent_stromal_cells,tblbio_percent_tumor_cells_valuecolumn AS percent_tumor_cells,
tblbio_percent_tumor_nuclei_valuecolumn AS percent_tumor_nuclei,tblbio_section_location_valuecolumn AS section_location,
tblbio_weight_valuecolumn AS tblbio_weight

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
 JOIN tblsample_id ON tblsample_id.tblresult_id_key = tblresult.tblresult_id_key
) AS vw_patient_sample_mutation
LEFT OUTER JOIN tblbio_bcr_sample_uuid ON tblbio_bcr_sample_uuid.tblbio_bcr_sample_uuid_valuecolumn = vw_patient_sample_mutation.sample_id
LEFT OUTER JOIN tblbio_sample ON tblbio_bcr_sample_uuid.tblbio_sample_id_key = tblbio_sample.tblbio_sample_id_key
LEFT OUTER JOIN tblbio_samples ON (tblbio_samples.tblbio_samples_id_key=tblbio_sample.tblbio_samples_id_key) 
LEFT OUTER JOIN tblbio_sample_type ON (tblbio_sample.tblbio_sample_id_key=tblbio_sample_type.tblbio_sample_id_key)
LEFT OUTER JOIN tblbio_sample_type_id ON (tblbio_sample.tblbio_sample_id_key=tblbio_sample_type_id.tblbio_sample_id_key)
LEFT OUTER JOIN tblbio_initial_weight ON (tblbio_sample.tblbio_sample_id_key=tblbio_initial_weight.tblbio_sample_id_key)
LEFT OUTER JOIN tblbio_portions ON (tblbio_sample.tblbio_sample_id_key=tblbio_portions.tblbio_sample_id_key)
LEFT OUTER JOIN tblbio_portion ON (tblbio_portions.tblbio_portions_id_key=tblbio_portion.tblbio_portions_id_key)
LEFT OUTER JOIN tblbio_slides ON (tblbio_slides.tblbio_portion_id_key=tblbio_portion.tblbio_portions_id_key)
LEFT OUTER JOIN tblbio_slide ON (tblbio_slide.tblbio_slides_id_key=tblbio_slides.tblbio_slides_id_key)
LEFT OUTER JOIN tblbio_percent_lymphocyte_infiltration ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_lymphocyte_infiltration.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_monocyte_infiltration ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_monocyte_infiltration.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_necrosis ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_necrosis.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_neutrophil_infiltration ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_neutrophil_infiltration.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_normal_cells ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_normal_cells.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_stromal_cells ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_stromal_cells.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_tumor_cells ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_tumor_cells.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_percent_tumor_nuclei ON (tblbio_slide.tblbio_slide_id_key=tblbio_percent_tumor_nuclei.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_section_location ON (tblbio_slide.tblbio_slide_id_key=tblbio_section_location.tblbio_slide_id_key)
LEFT OUTER JOIN tblbio_weight ON (tblbio_portion.tblbio_portion_id_key=tblbio_weight.tblbio_portion_id_key)
