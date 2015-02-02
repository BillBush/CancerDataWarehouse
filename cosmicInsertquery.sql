COPY tblcosmic(
            cos_genename, cos_accessionnumber, cos_genecdslength, 
            cos_hgncid, cos_samplename, cos_idsample, cos_idtumour, cos_primarysite, 
            cos_sitesubtype, cos_primaryhistology, cos_histologysubtype, 
            cos_genomewidescreen, cos_mutationid, cos_mutationcds, cos_mutationaa, 
            cos_mutationdescription, cos_mutationzygosity, cos_mutationgrch37genomeposition, 
            cos_mutationgrch37strand, cos_snp, cos_fathmmscore, cos_fathmmprediction, 
            cos_mutationsomaticstatus, cos_pubmedpmid, cos_idstudy, cos_samplesource, 
            cos_tumourorigin, cos_age, cos_comments, cos_mutationgrch37genomepositionchromosome, 
            cos_mutationgrch37genomepositionstart, cos_mutationgrch37genomepositionstop
            )
FROM '/home/bill/CosmicBarSingleQuoteStrings.txt'
DELIMITER '|'
CSV
QUOTE '''';
/*Query returned successfully: 8493939 rows affected, 15575479 ms execution time.*/
/*Query returned successfully: 8493939 rows affected, 59228237 ms execution time.*/
