DELIMITER //
CREATE FUNCTION get_branch_name ()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE branch_name VARCHAR(255);
    SET branch_name = TRIM(TRAILING '\n' FROM CAST(SYSTEM_USER() AS CHAR));
    RETURN branch_name;
END;
//
DELIMITER ;

-- Use a função para obter o nome da branch
SET @branch_name = get_branch_name();

-- Exibir o nome da branch
SELECT CONCAT('O nome da branch é: ', @branch_name);

SET @view_name = CASE 
    WHEN '@branch_name' = 'dev' THEN 'dlh-dev-brlm-qr8'
    WHEN '@branch_name' = 'prod' THEN 'dlh-prd-brlm-zcb'
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

