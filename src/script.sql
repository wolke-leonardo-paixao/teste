SET @sql = CONCAT('
    CREATE OR REPLACE VIEW `', 'dlh-dev-brlm-qr8', '.publishedClientRelationship.dimDistrict`
    OPTIONS(
      description="Bairro é uma subdivisão da localidade. Para saber mais, acesse: https://leroypedia.leroymerlin.com.br/wiki/Bairro"
    )
    AS SELECT * FROM ', 'dlh-dev-brlm-qr8', '.semantic.dimDistrict;'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
--teste
