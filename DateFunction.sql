/*SELECT procurement_date 
FROM tblbio_month_of_creation,tblbio
CREATE FUNCTION make_date(year integer, month integer, day integer) AS procurement_date
SELECT format('%s-%s-%s', year, month, day)::date;
procurement_date LANGUAGE sql STRICT IMMUTABLE;*/

--SELECT * FROM tblbio_day_of_creation

/*CREATE OR REPLACE FUNCTION make_date(year integer, month integer, day integer) RETURNS date AS $$
SELECT tblbio_year_of_creation.tblbio_year_of_creation_valuecolumn to_date('01012014','DD Mon YYYY'),
tblbio_month_of_creation.tblbio_month_of_creation_valuecolumn,tblbio_day_of_creation.tblbio_day_of_creation_valuecolumn
FROM tblbio_year_of_creation, tblbio_month_of_creation, tblbio_day_of_creation
$$ LANGUAGE sql STRICT IMMUTABLE;*/

CREATE OR REPLACE FUNCTION get_start_date(date date, num_of_days integer) RETURNS date AS $$
SELECT $1 + $2;
$$ LANGUAGE sql STRICT IMMUTABLE;


CREATE OR REPLACE FUNCTION get_end_date(date date, num_of_days integer) RETURNS date AS $$
SELECT $1 - $2;
$$ LANGUAGE sql STRICT IMMUTABLE;

SELECT get_start_date('20140216', '7');
SELECT get_end_date('20140216', '7');


SELECT to_date(concat(tblbio_year_of_creation.tblbio_year_of_creation_valuecolumn, 
to_char(tblbio_month_of_creation.tblbio_month_of_creation_valuecolumn, '09'),
to_char(tblbio_day_of_creation.tblbio_day_of_creation_valuecolumn, '09')), 'YYYY MM DD')
FROM tblbio_year_of_creation JOIN tblbio_month_of_creation ON tblbio_year_of_creation.tblbio_portion_id_key=tblbio_month_of_creation.tblbio_portion_id_key
JOIN tblbio_day_of_creation ON tblbio_month_of_creation.tblbio_portion_id_key=tblbio_day_of_creation.tblbio_portion_id_key

--CREATE OR REPLACE FUNCTION within_range(get_start_date date, get_end_date date, procurement_date_start date, procurement_date_end date) RETURNS

SELECT(DATE'20140101',DATE'20140101') OVERLAPS ((SELECT get_start_date('20140216', '7')),(SELECT get_end_date('20140216', '7')))