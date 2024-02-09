-- Exibir o nome do branch
SELECT CONCAT('O nome do branch é: ', @BRANCH_NAME);

-- Definir o nome da view com base no branch
SET @view_name = CASE 
    WHEN @BRANCH_NAME = 'dev' THEN 'dlh-dev-brlm-qr8'
    WHEN @BRANCH_NAME = 'prod' THEN 'dlh-prd-brlm-zcb'
    ELSE 'Branch desconhecida.'
END;

-- Exibir o nome da view
SELECT CONCAT('O nome da view é: ', @view_name);

-- Criar a consulta SQL dinâmica para criar a view
SET @sql_query = CONCAT('
    CREATE OR REPLACE VIEW `', @view_name, '.publishedClientRelationship.dimDistrict`
    OPTIONS(
      description="Bairro é uma subdivisão da localidade. Para saber mais, acesse: https://leroypedia.leroymerlin.com.br/wiki/Bairro"
    )
    AS SELECT * FROM ', @view_name, '.semantic.dimDistrict;'
);

-- Executar a consulta SQL dinâmica
PREPARE stmt FROM @sql_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
