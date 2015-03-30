DROP TABLE IF EXISTS tblVEPFeatureType;
DROP SEQUENCE IF EXISTS tblVEPFeatureType_id_seq;
CREATE SEQUENCE tblVEPFeatureType_id_seq;
CREATE TABLE tblVEPFeatureType (
	tblVEPFeatureType_id_Key BIGINT NOT NULL DEFAULT nextval('tblVEPFeatureType_id_seq') PRIMARY KEY,
	tblVEPFeatureType_Desc VARCHAR
);

INSERT INTO tblVEPFeatureType (tblvepfeaturetype_desc) 
VALUES 	('Transcript'),
	('RegulatoryFeature'),
	('MotifFeature');

DROP TABLE IF EXISTS tblVEPConsequence;
DROP SEQUENCE IF EXISTS tblVEPConsequence_id_seq;
CREATE SEQUENCE tblVEPConsequence_id_seq;
CREATE TABLE tblVEPConsequence (
	tblVEPConsequence_id_Key BIGINT NOT NULL DEFAULT nextval('tblVEPConsequence_id_seq') PRIMARY KEY,
	tblVEPConsequence_Desc VARCHAR
);

INSERT INTO tblVEPConsequence (tblVEPConsequence_Desc)
VALUES	('transcript_ablation'),
	('splice_acceptor_variant'),
	('splice_donor_variant'),
	('stop_gained'),
	('frameshift_variant'),
	('stop_lost'),
	('initiator_codon_variant'),
	('transcript_amplification'),
	('inframe_insertion'),
	('inframe_deletion'),
	('missense_variant'),
	('splice_region_variant'),
	('incomplete_terminal_codon_variant'),
	('stop_retained_variant'),
	('synonymous_variant'),
	('coding_sequence_variant'),
	('mature_miRNA_variant'),
	('5_prime_UTR_variant'),
	('3_prime_UTR_variant'),
	('non_coding_transcript_exon_variant'),
	('intron_variant'),
	('NMD_transcript_variant'),
	('non_coding_transcript_variant'),
	('upstream_gene_variant'),
	('downstream_gene_variant'),
	('TFBS_ablation'),
	('TFBS_amplification'),
	('TF_binding_site_variant'),
	('regulatory_region_ablation'),
	('regulatory_region_amplification'),
	('regulatory_region_variant'),
	('feature_elongation'),
	('feature_truncation'),
	('intergenic_variant');

DROP TABLE IF EXISTS tblVEPEffectConsequence;
DROP SEQUENCE IF EXISTS tblVEPEffectConsequence_id_seq;
CREATE SEQUENCE tblVEPEffectConsequence_id_seq;
CREATE TABLE tblVEPEffectConsequence (
	tblVEPEffectConsequence_id_Key BIGINT NOT NULL DEFAULT nextval('tblVEPEffectConsequence_id_seq') PRIMARY KEY,
	tblVEPEffect_id_Key BIGINT NOT NULL,
	tblVEPConsequence_id_Key BIGINT NOT NULL
);

DROP TABLE IF EXISTS tblVEPEffect;
DROP SEQUENCE IF EXISTS tblVEPEffect_id_seq;
CREATE SEQUENCE tblVEPEffect_id_seq;
CREATE TABLE tblVEPEffect (
	tblVEPEffect_id_Key BIGINT NOT NULL DEFAULT nextval('tblVEPEffect_id_seq') PRIMARY KEY,
	tblMutation_id_Key BIGINT NOT NULL,
	tblVEPFeatureType_id_Key BIGINT,
	tblVEPEffect_allele VARCHAR,
	tblVEPEffect_gene VARCHAR,
	tblVEPEffect_feature VARCHAR,
	tblVEPEffect_cdna_position BIGINT,
	tblVEPEffect_cds_position BIGINT,
	tblVEPEffect_protein_position BIGINT,
	tblVEPEffect_amino_acid_old VARCHAR,
	tblVEPEffect_amino_acid_new VARCHAR,
	tblVEPEffect_codon_old VARCHAR,
	tblVEPEffect_codon_new VARCHAR,
	tblVEPEffect_existing_variation VARCHAR,
	tblVEPEffect_strand INT,
	tblVEPEffect_pick INT,
	tblVEPEffect_sift VARCHAR,
	tblVEPEffect_polyphen VARCHAR,
	tblVEPEffect_distance BIGINT
);

ALTER TABLE tblVEPEffect
ADD CONSTRAINT fk_tblVEPEffect_tblVEPFeatureType
FOREIGN KEY (tblVEPFeatureType_id_Key)
REFERENCES tblVEPFeatureType(tblVEPFeatureType_id_Key);

ALTER TABLE tblVEPEffect
ADD CONSTRAINT fk_tblVEPEffect_tblMutation
FOREIGN KEY (tblMutation_id_Key)
REFERENCES tblMutation(id_Key);

ALTER TABLE tblVEPEffectConsequence
ADD CONSTRAINT fk_tblVEPEffectConsequence_tblVEPEffect
FOREIGN KEY (tblVEPEffect_id_Key)
REFERENCES tblVEPEffect(tblVEPEffect_id_Key);

ALTER TABLE tblVEPEffectConsequence
ADD CONSTRAINT fk_tblVEPEffectConsequence_tblVEPConsequence
FOREIGN KEY (tblVEPConsequence_id_Key)
REFERENCES tblVEPConsequence(tblVEPConsequence_id_Key);