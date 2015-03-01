﻿CREATE OR REPLACE VIEW vwClinical AS 
SELECT tblbrca_breast_cancer_surgery_margin_status_valuecolumn AS breast_cancer_surgery_margin_status,
tblbrca_axillary_lymph_node_stage_method_type_valuecolumn AS axillary_lymph_node_stage_method_type_iffy,
tblbrca_axillary_lymph_node_stage_other_method_descriptive_text_valuecolumn AS axillary_lymph_node_stage_other_method_descriptive_text_iffy,
tblbrca_distant_metastasis_present_ind2_valuecolumn AS distant_metastasis_present_ind2,
tblbrca_first_nonlymph_node_metastasis_anatomic_site_valuecolumn AS first_nonlymph_node_metastasis_anatomic_site,
tblbrca_shared_breast_carcinoma_estrogen_receptor_status_valuecolumn AS breast_carcinoma_estrogen_receptor_status,
tblbrca_shared_breast_carcinoma_immunohistochemistry_pos_cell_score_valuecolumn AS breast_carcinoma_immunohistochemistry_postitive_cell_score_iffy,
tblbrca_shared_breast_carcinoma_progesterone_receptor_status_valuecolumn AS breast_carcinoma_progesterone_receptor_status,
tblbrca_shared_er_level_cell_percentage_category_valuecolumn AS er_level_cell_percentage_category,
tblbrca_shared_her2_erbb_pos_finding_cell_percent_category_valuecolumn AS her2_erbb_pos_finding_cell_percent_category,
tblbrca_shared_her2_immunohistochemistry_level_result_valuecolumn AS her2_immunohistochemistry_level_result,
tblbrca_shared_her2_neu_and_centromere_17_copy_number_analysis_input_total_number_count_valuecolumn AS shared_her2_neu_and_centromere_17_copy_number_analysis_input_total_number_count,
tblbrca_shared_her2_neu_and_centromere_17_copy_number_metastatic_breast_carcinoma_analysis_input_total_number_count_valuecolumn
tblbrca_shared_her2_neu_breast_carcinoma_copy_analysis_input_total_number_count_valuecolumn,
tblbrca_shared_her2_neu_chromosone_17_signal_ratio_value_valuecolumn,
tblbrca_shared_her2_neu_metastatic_breast_carcinoma_copy_analysis_input_total_number_valuecolumn,
tblbrca_shared_immunohistochemistry_positive_cell_score_valuecolumn,
tblbrca_shared_lab_proc_her2_neu_immunohistochemistry_receptor_status_valuecolumn,
tblbrca_shared_lab_procedure_her2_neu_in_situ_hybrid_outcome_type_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_erbb2_immunohistochemistry_level_result_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_estrogen_receptor_level_cell_percent_category_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_estrogen_receptor_status_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_fluorescence_in_situ_hybridization_diagnostic_proc_centromere_17_signal_result_range_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_her2_erbb_pos_finding_cell_percent_category_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_her2_neu_chromosone_17_signal_ratio_value_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_pos_cell_score_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_positive_finding_scale_type_valuecolumn AS tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_positive_finding_scale_type_iffy,
tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_pr_pos_cell_score_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_progesterone_receptor_positive_finding_scale_type_valuecolumn AS tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_progesterone_receptor_positive_finding_scale_type_iffy,
tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_immunohistochemistry_receptor_status_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_in_situ_hybridization_outcome_type_valuecolumn AS tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_in_situ_hybridization_outcome_type_iffy,
tblbrca_shared_metastatic_breast_carcinoma_progesterone_receptor_level_cell_percent_category_valuecolumn,
tblbrca_shared_metastatic_breast_carcinoma_progesterone_receptor_status_valuecolumn,
tblbrca_shared_progesterone_receptor_level_cell_percent_category_valuecolumn,
tblbrca_surgical_procedure_purpose_other_text_valuecolumn,
tblrad_anatomic_treatment_site_valuecolumn,
tblrad_bcr_radiation_uuid_valuecolumn,
tblrad_course_number_valuecolumn,
tblrad_days_to_radiation_therapy_start_valuecolumn AS tblrad_days_to_radiation_therapy_start_iffy,
tblrad_days_to_radiation_therapy_end_valuecolumn AS tblrad_days_to_radiation_therapy_end_iffy,
tblrad_numfractions_valuecolumn AS tblrad_numfractions_iffy, --the quantity of tot radiation therapy fractions.
tblrad_radiation_dosage_valuecolumn,
tblrad_radiation_treatment_ongoing_valuecolumn,
tblrad_radiation_type_valuecolumn,
tblrad_units_valuecolumn,
tblnte_additional_pharmaceutical_therapy_valuecolumn,
tblnte_additional_radiation_therapy_valuecolumn,
tblnte_additional_surgery_locoregional_procedure_valuecolumn,
tblnte_days_to_additional_surgery_locoregional_procedure_valuecolumn,
tblnte_days_to_additional_surgery_metastatic_procedure_valuecolumn,
tblnte_days_to_new_tumor_event_additional_surgery_procedure_valuecolumn,
tblnte_days_to_new_tumor_event_after_initial_treatment_valuecolumn,
tblnte_new_neoplasm_event_occurrence_anatomic_site_valuecolumn,
tblnte_new_neoplasm_event_type_valuecolumn,
tblnte_new_tumor_event_additional_surgery_procedure_valuecolumn,
tblnte_new_tumor_event_after_initial_treatment_valuecolumn,
tblrx_bcr_drug_uuid_valuecolumn,
tblrx_total_dose_valuecolumn,
tblrx_total_dose_units_valuecolumn,
tblrx_number_cycles_valuecolumn,
tblrx_days_to_drug_therapy_start_valuecolumn


FROM tblbrca_breast_cancer_surgery_margin_status 
	LEFT JOIN tblbrca_axillary_lymph_node_stage_method_type
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_axillary_lymph_node_stage_method_type.tblbrca_patient_id_key
	LEFT JOIN tblbrca_axillary_lymph_node_stage_other_method_descriptive_text
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_axillary_lymph_node_stage_other_method_descriptive_text.tblbrca_patient_id_key
	LEFT JOIN tblbrca_distant_metastasis_present_ind2
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_distant_metastasis_present_ind2.tblbrca_patient_id_key
	LEFT JOIN tblbrca_first_nonlymph_node_metastasis_anatomic_sites
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_first_nonlymph_node_metastasis_anatomic_sites.tblbrca_patient_id_key
	LEFT JOIN tblbrca_first_nonlymph_node_metastasis_anatomic_site
		ON tblbrca_first_nonlymph_node_metastasis_anatomic_sites.tblbrca_first_nonlymph_node_metastasis_anatomic_sites_id_key=tblbrca_first_nonlymph_node_metastasis_anatomic_site.tblbrca_first_nonlymph_node_metastasis_anatomic_site_id_key
	LEFT JOIN tblbrca_shared_breast_carcinoma_estrogen_receptor_status
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_breast_carcinoma_estrogen_receptor_status.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_breast_carcinoma_immunohistochemistry_pos_cell_score
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_breast_carcinoma_immunohistochemistry_pos_cell_score.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_breast_carcinoma_progesterone_receptor_status
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_breast_carcinoma_progesterone_receptor_status.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_er_level_cell_percentage_category
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_er_level_cell_percentage_category.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_her2_erbb_pos_finding_cell_percent_category
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_her2_erbb_pos_finding_cell_percent_category.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_her2_immunohistochemistry_level_result
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_her2_immunohistochemistry_level_result.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_her2_neu_metastatic_breast_carcinoma_copy_analysis_input_total_number
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_her2_neu_metastatic_breast_carcinoma_copy_analysis_input_total_number.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_her2_neu_and_centromere_17_copy_number_analysis_input_total_number_count
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_her2_neu_and_centromere_17_copy_number_analysis_input_total_number_count.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_her2_neu_and_centromere_17_copy_number_metastatic_breast_carcinoma_analysis_input_total_number_count
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_her2_neu_and_centromere_17_copy_number_metastatic_breast_carcinoma_analysis_input_total_number_count.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_her2_neu_chromosone_17_signal_ratio_value
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_her2_neu_chromosone_17_signal_ratio_value.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_immunohistochemistry_positive_cell_score
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_immunohistochemistry_positive_cell_score.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_lab_proc_her2_neu_immunohistochemistry_receptor_status
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_lab_proc_her2_neu_immunohistochemistry_receptor_status.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_lab_procedure_her2_neu_in_situ_hybrid_outcome_type
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_lab_procedure_her2_neu_in_situ_hybrid_outcome_type.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_erbb2_immunohistochemistry_level_result
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_erbb2_immunohistochemistry_level_result.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_estrogen_receptor_level_cell_percent_category
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_estrogen_receptor_level_cell_percent_category.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_estrogen_receptor_status
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_estrogen_receptor_status.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_fluorescence_in_situ_hybridization_diagnostic_proc_centromere_17_signal_result_range
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_fluorescence_in_situ_hybridization_diagnostic_proc_centromere_17_signal_result_range.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_her2_erbb_pos_finding_cell_percent_category
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_her2_erbb_pos_finding_cell_percent_category.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_her2_neu_chromosone_17_signal_ratio_value
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_her2_neu_chromosone_17_signal_ratio_value.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_pos_cell_score
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_pos_cell_score.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_pr_pos_cell_score
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_pr_pos_cell_score.tblbrca_patient_id_key
	LEFT JOIN tblbrca_nte_new_tumor_events
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_nte_new_tumor_events.tblbrca_patient_id_key
	LEFT JOIN tblbrca_nte_new_tumor_event
		ON tblbrca_nte_new_tumor_events.tblbrca_nte_new_tumor_events_id_key=tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_events_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_positive_finding_scale_type
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_er_positive_finding_scale_type.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_progesterone_receptor_positive_finding_scale_type
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblbrca_shared_metastatic_breast_carcinoma_immunohistochemistry_progesterone_receptor_positive_finding_scale_type.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_immunohistochemistry_receptor_status
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_immunohistochemistry_receptor_status.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_in_situ_hybridization_outcome_type
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_lab_proc_her2_neu_in_situ_hybridization_outcome_type.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_progesterone_receptor_level_cell_percent_category
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_progesterone_receptor_level_cell_percent_category.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_metastatic_breast_carcinoma_progesterone_receptor_status
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_metastatic_breast_carcinoma_progesterone_receptor_status.tblbrca_patient_id_key
	LEFT JOIN tblbrca_shared_progesterone_receptor_level_cell_percent_category
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_shared_progesterone_receptor_level_cell_percent_category.tblbrca_patient_id_key
	LEFT JOIN tblbrca_surgical_procedure_purpose_other_text
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_surgical_procedure_purpose_other_text.tblbrca_patient_id_key
	LEFT JOIN tblrad_radiations
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblrad_radiations.tblbrca_patient_id_key
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
	LEFT JOIN tblnte_additional_pharmaceutical_therapy
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_additional_pharmaceutical_therapy.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblnte_additional_radiation_therapy
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_additional_radiation_therapy.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblbrca_follow_ups
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblbrca_follow_ups_id_key
	LEFT JOIN tblfollow_up_V2_1_follow_up
		ON tblbrca_follow_ups.tblbrca_follow_ups_id_key=tblfollow_up_V2_1_follow_up.tblbrca_follow_ups_id_key
	LEFT JOIN tblfollow_up_V1_5_follow_up
		ON tblbrca_follow_ups.tblbrca_follow_ups_id_key=tblfollow_up_V1_5_follow_up.tblbrca_follow_ups_id_key
	LEFT JOIN tblnte_additional_surgery_locoregional_procedure
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_additional_surgery_locoregional_procedure.tblfollow_up_V1_5_follow_up_id_key
	LEFT JOIN tblnte_days_to_additional_surgery_locoregional_procedure
		ON tblfollow_up_V1_5_follow_up.tblfollow_up_V1_5_follow_up_id_key=tblnte_days_to_additional_surgery_locoregional_procedure.tblfollow_up_V1_5_follow_up_id_key
	LEFT JOIN tblnte_days_to_additional_surgery_metastatic_procedure
		ON tblfollow_up_V1_5_follow_up.tblfollow_up_V1_5_follow_up_id_key=tblnte_days_to_additional_surgery_metastatic_procedure.tblfollow_up_V1_5_follow_up_id_key
	LEFT JOIN tblnte_days_to_new_tumor_event_additional_surgery_procedure
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_days_to_new_tumor_event_additional_surgery_procedure.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblnte_days_to_new_tumor_event_after_initial_treatment
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_days_to_new_tumor_event_after_initial_treatment.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblnte_new_neoplasm_event_occurrence_anatomic_site
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_new_neoplasm_event_occurrence_anatomic_site.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblnte_new_neoplasm_event_type
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_new_neoplasm_event_type.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblnte_new_tumor_event_additional_surgery_procedure
		ON tblbrca_nte_new_tumor_event.tblbrca_nte_new_tumor_event_id_key=tblnte_new_tumor_event_additional_surgery_procedure.tblbrca_nte_new_tumor_event_id_key
	LEFT JOIN tblnte_new_tumor_event_after_initial_treatment
		ON tblfollow_up_V2_1_follow_up.tblfollow_up_V2_1_follow_up_id_key=tblnte_new_tumor_event_after_initial_treatment.tblfollow_up_V2_1_follow_up_id_key
	LEFT JOIN tblrx_drugs
		ON tblbrca_breast_cancer_surgery_margin_status.tblbrca_patient_id_key=tblrx_drugs.tblbrca_patient_id_key
	LEFT JOIN tblrx_drug
		ON tblrx_drugs.tblrx_drugs_id_key=tblrx_drug.tblrx_drugs_id_key
	LEFT JOIN tblrx_bcr_drug_uuid 
		ON tblrx_drug.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
	LEFT JOIN tblrx_total_dose 
		ON tblrx_total_dose.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
	LEFT JOIN tblrx_total_dose_units 
		ON tblrx_total_dose_units.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
	LEFT JOIN tblrx_number_cycles 
		ON tblrx_number_cycles.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key
	LEFT JOIN tblrx_days_to_drug_therapy_start 
		ON tblrx_days_to_drug_therapy_start.tblrx_drug_id_key = tblrx_bcr_drug_uuid.tblrx_drug_id_key