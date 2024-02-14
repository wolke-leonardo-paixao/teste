SET @sql = CONCAT('
    CREATE OR REPLACE VIEW `', 'dlh-prd-brlm-zcb', '.publishedClientRelationship.dimDistrict`
    OPTIONS(
      description="Bairro é uma subdivisão da localidade. Para saber mais, acesse: https://leroypedia.leroymerlin.com.br/wiki/Bairro"
    )
    AS SELECT * FROM ', 'dlh-prd-brlm-zcb', '.semantic.dimDistrict;'
);

PREPARE stmt FROM @sql_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
--teste