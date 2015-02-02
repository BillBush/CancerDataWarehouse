-- Table: tblcosmic

DROP TABLE tblcosmic;
DROP SEQUENCE tblcosmic_cos_id_seq;
CREATE SEQUENCE tblcosmic_cos_id_seq;
CREATE TABLE tblcosmic
(
  cos_id integer NOT NULL DEFAULT nextval('tblcosmic_cos_id_seq'::regclass),
  cos_genename character varying(500),
  cos_accessionnumber character varying(500),
  cos_genecdslength character varying(500),
  cos_hgncid character varying(500),
  cos_samplename character varying(500),
  cos_idsample character varying(500),
  cos_idtumour character varying(500),
  cos_primarysite character varying(500),
  cos_sitesubtype character varying(500),
  cos_primaryhistology character varying(500),
  cos_histologysubtype character varying(500),
  cos_genomewidescreen character varying(500),
  cos_mutationid character varying(500),
  cos_mutationcds character varying(500),
  cos_mutationaa character varying(500),
  cos_mutationdescription character varying(500),
  cos_mutationzygosity character varying(500),
  cos_mutationgrch37genomeposition character varying(500),
  cos_mutationgrch37strand character varying(500),
  cos_snp character varying(500),
  cos_fathmmscore character varying(500),
  cos_fathmmprediction character varying(500),
  cos_mutationsomaticstatus character varying(500),
  cos_pubmedpmid character varying(500),
  cos_idstudy character varying(500),
  cos_samplesource character varying(500),
  cos_tumourorigin character varying(500),
  cos_age character varying(500),
  cos_comments character varying(500),
  cos_mutationgrch37genomepositionchromosome integer,
  cos_mutationgrch37genomepositionstart integer,
  cos_mutationgrch37genomepositionstop integer,
  CONSTRAINT tblcosmic_pkey PRIMARY KEY (cos_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblcosmic
  OWNER TO postgres;

-- Index: cos_genename_idx

-- DROP INDEX cos_genename_idx;

CREATE INDEX cos_genename_idx
  ON tblcosmic
  USING btree
  (cos_genename COLLATE pg_catalog."default");

-- Index: cos_mutationgrch37genomeposition_idx

-- DROP INDEX cos_mutationgrch37genomeposition_idx;

CREATE INDEX cos_mutationgrch37genomeposition_idx
  ON tblcosmic
  USING btree
  (cos_mutationgrch37genomepositionchromosome, cos_mutationgrch37genomepositionstart, cos_mutationgrch37genomepositionstop);

-- Index: cos_mutationgrch37genomepositionchromosome_idx

-- DROP INDEX cos_mutationgrch37genomepositionchromosome_idx;

CREATE INDEX cos_mutationgrch37genomepositionchromosome_idx
  ON tblcosmic
  USING btree
  (cos_mutationgrch37genomepositionchromosome);

-- Index: cos_mutationgrch37genomepositionstart_idx

-- DROP INDEX cos_mutationgrch37genomepositionstart_idx;

CREATE INDEX cos_mutationgrch37genomepositionstart_idx
  ON tblcosmic
  USING btree
  (cos_mutationgrch37genomepositionstart);

-- Index: cos_mutationgrch37genomepositionstop_idx

-- DROP INDEX cos_mutationgrch37genomepositionstop_idx;

CREATE INDEX cos_mutationgrch37genomepositionstop_idx
  ON tblcosmic
  USING btree
  (cos_mutationgrch37genomepositionstop);

