SET @branch_name = ?;

SELECT CONCAT('O nome do branch é: ', @branch_name);

SET @view_name = CASE 
    WHEN '$BRANCH_NAME' = 'dev' THEN 'dlh-dev-brlm-qr8'
    WHEN '$BRANCH_NAME' = 'prod' THEN 'dlh-prd-brlm-zcb'
    ELSE 'Branch desconhecida.'
END;

SELECT CONCAT('O nome da view é: ', @view_name);

SET @sql = CONCAT('
    CREATE OR REPLACE VIEW `', @view_name, '.publishedClientRelationship.dimDistrict`
    OPTIONS(
      description="Bairro é uma subdivisão da localidade. Para saber mais, acesse: https://leroypedia.leroymerlin.com.br/wiki/Bairro"
    )
    AS SELECT * FROM ', @view_name, '.semantic.dimDistrict;'
);

PREPARE stmt FROM @sql_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

