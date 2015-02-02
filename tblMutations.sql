DROP TABLE IF EXISTS tblAltBases;
DROP SEQUENCE IF EXISTS tblAltBases_id_seq;
CREATE SEQUENCE tblAltBases_id_seq;
CREATE TABLE tblAltBases (
	id_Key BIGINT NOT NULL DEFAULT nextval('tblAltBases_id_seq') PRIMARY KEY,
	altBases VARCHAR NOT NULL
);

DROP TABLE IF EXISTS tblPhredScaledGenotypeLikelihood;
DROP SEQUENCE IF EXISTS tblPhredScaledGenotypeLikelihood_id_seq;
CREATE SEQUENCE tblPhredScaledGenotypeLikelihood_id_seq;
CREATE TABLE tblPhredScaledGenotypeLikelihood (
	id_Key BIGINT NOT NULL DEFAULT nextval('tblPhredScaledGenotypeLikelihood_id_seq') PRIMARY KEY,
	FORMAT_PL_PhredScaledGenotypeLikelihood BIGINT NOT NULL
);

DROP TABLE IF EXISTS tblAlleleCnt;
DROP SEQUENCE IF EXISTS tblAlleleCnt_id_seq;
CREATE SEQUENCE tblAlleleCnt_id_seq;
CREATE TABLE tblAlleleCnt (
	id_Key BIGINT NOT NULL DEFAULT nextval('tblAlleleCnt_id_seq') PRIMARY KEY,
	INFO_AC_AlleleCntInGenotypes BIGINT NOT NULL
);
DROP TABLE IF EXISTS tblMutation;
DROP SEQUENCE IF EXISTS tblMutation_id_seq;
CREATE SEQUENCE tblMutation_id_seq;
CREATE TABLE tblMutation (
	id_Key BIGINT NOT NULL DEFAULT nextval('tblMutation_id_seq') PRIMARY KEY,
	dlDir VARCHAR NOT NULL,
	filePref VARCHAR NOT NULL,
	gene VARCHAR NOT NULL,
	genePart BIGINT NOT NULL,
	chromosome VARCHAR NOT NULL,
	startPos BIGINT NOT NULL,
	endPos BIGINT NOT NULL DEFAULT 0,/*0=not calculated*/
	mutType INTEGER NOT NULL DEFAULT 0,/*0=not calculated, 1=snp, 2=indel, 3=ins, 4=del*/
	consequence INTEGER NOT NULL DEFAULT 0,/*0=not calculated, 1=missense, 2=nonsense, 3=synonimous*/
	refBases VARCHAR NOT NULL,
	quality DOUBLE PRECISION NOT NULL DEFAULT 0,
	trailingKey VARCHAR NULL,
	INFO_DP_RawReadDepth BIGINT NULL,
	INFO_MQ_RootMeanSqrMapQualCoveringReads BIGINT NULL,
	INFO_FQ_PhredProbAllSamplesSame DOUBLE PRECISION NULL,
	INFO_AF1_MaxLikelihoodEstFirstAltAlleleFreq DOUBLE PRECISION NULL,
	INFO_AC1_MaxLikelihoodEstFirstAltAlleleCnt DOUBLE PRECISION NULL,
	INFO_AN_TotNumAllelesInCalledGenotypes BIGINT NULL,
	INFO_HWE_Chi2BasedHweTestPValFromG3 DOUBLE PRECISION NULL,
	INFO_CLR_LogRatioGenotypeLikelihoods BIGINT NULL,
	INFO_UGT_MostProbableGenotypeConf VARCHAR NULL,
	INFO_CGT_MostProbableGenotypeConf VARCHAR NULL,
	INFO_PCHI2_PostWeightedChi2PValGroup1Group2 DOUBLE PRECISION NULL,
	INFO_QCHI2_PhredScaledPChi2 BIGINT NULL,
	INFO_PR_NumPermutationsYieldingSmallerPChi2 BIGINT NULL,
	INFO_QBD_QualityOverDepth DOUBLE PRECISION NULL,
	INFO_RPB_ReadPositionBias DOUBLE PRECISION NULL,
	INFO_MDV_MaxNumHighQualNonRefReads BIGINT NULL,
	INFO_VDB_VariantDistanceBias DOUBLE PRECISION NULL,
	FORMAT_GT_Genotype VARCHAR NULL,
	FORMAT_GQ_GenotypeQuality BIGINT NULL,
	FORMAT_DP_NumHighQualityBases BIGINT NULL,
	FORMAT_DV_NumHighQualityNonRefBases BIGINT NULL,
	FORMAT_SP_PhredScaledStrandBiasPVal BIGINT NULL,
	INFO_DP4_NumHighQualRefFwdBases BIGINT NULL,
	INFO_DP4_NumHighQualRefRevBases BIGINT NULL,
	INFO_DP4_NumHighQualAltFwdBases BIGINT NULL,
	INFO_DP4_NumHighQualAltRevBases BIGINT NULL,
	INFO_IS_MaxNumReadsSupportingIndel DOUBLE PRECISION NULL,
	INFO_IS_FractionOfIndelReads DOUBLE PRECISION NULL,
	INFO_G3_MaxLikelihoodEstGenotypeFreqA1A1 DOUBLE PRECISION NULL,
	INFO_G3_MaxLikelihoodEstGenotypeFreqA1A2 DOUBLE PRECISION NULL,
	INFO_G3_MaxLikelihoodEstGenotypeFreqA2A2 DOUBLE PRECISION NULL,
	INFO_PV4_PValStrandBias DOUBLE PRECISION NULL,
	INFO_PV4_PValBaseQBias DOUBLE PRECISION NULL,
	INFO_PV4_PValMapQBias DOUBLE PRECISION NULL,
	INFO_PV4_PValTailDistanceBias DOUBLE PRECISION NULL,
	INFO_PC2_PhredProbNonRefAlleleFreqGroup1LargerGroup2 BIGINT NULL,
	INFO_PC2_PhredProbNonRefAlleleFreqGroup1SmallerGroup2 BIGINT NULL,
	FORMAT_GL_LikelihoodOfRefRefGenotype DOUBLE PRECISION NULL,
	FORMAT_GL_LikelihoodOfRefAltGenotype DOUBLE PRECISION NULL,
	FORMAT_GL_LikelihoodOfAltAltGenotype DOUBLE PRECISION NULL
);

ALTER TABLE tblAlleleCnt
ADD tblMutation_id_key BIGINT NULL;
ALTER TABLE tblAlleleCnt
ADD CONSTRAINT fk_tblAlleleCnt_tblMutation
FOREIGN KEY (tblMutation_id_key)
REFERENCES tblMutation(id_key);

ALTER TABLE tblPhredScaledGenotypeLikelihood
ADD tblMutation_id_key BIGINT NULL;
ALTER TABLE tblPhredScaledGenotypeLikelihood
ADD CONSTRAINT fk_tblPhredScaledGenotypeLikelihood_tblMutation
FOREIGN KEY (tblMutation_id_key)
REFERENCES tblMutation(id_key);

ALTER TABLE tblAltBases
ADD tblMutation_id_key BIGINT NULL;
ALTER TABLE tblAltBases
ADD CONSTRAINT fk_tblAltBases_tblMutation
FOREIGN KEY (tblMutation_id_key)
REFERENCES tblMutation(id_key);
