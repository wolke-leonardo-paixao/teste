DECLARE branch_name STRING;
SET branch_name = ARGUMENTS[OFFSET(0)];

SET branch_name = REGEXP_REPLACE(branch_name, r'^feature/', '');

-- Define o nome da view
DECLARE view_name STRING;
SET view_name = (
    CASE 
        WHEN branch_name = 'dev' THEN 'dlh-dev-brlm-qr8'
        WHEN branch_name = 'prod' THEN 'dlh-prd-brlm-zcb'
        ELSE 'Branch desconhecida.'
    END
);

PRINT 'O nome da view é: ' || view_name;

-- query
--DECLARE sql_query STRING;
--SET sql_query = CONCAT('
--    CREATE OR REPLACE VIEW `', view_name, '.publishedClientRelationship.dimDistrict`
--    OPTIONS(
--      description="Bairro é uma subdivisão da localidade. Para saber mais, acesse: https://leroypedia.leroymerlin.com.br/wiki/Bairro"
--    )
--    AS SELECT * FROM ', view_name, '.semantic.dimDistrict;'
--);

--PREPARE stmt FROM @sql_query;
--EXECUTE stmt;
--DEALLOCATE PREPARE stmt;
--sim
