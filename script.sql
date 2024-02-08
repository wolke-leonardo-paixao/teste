DECLARE view_name STRING;

CREATE TEMP FUNCTION GetViewName() RETURNS STRING LANGUAGE js AS '''
    var fs = require("fs");
    var viewName = fs.readFileSync("view_name.txt", "utf8").trim();
    return viewName;
''';

SET view_name = GetViewName();

SET @sql = CONCAT('
    CREATE OR REPLACE VIEW `', @view_name, '.publishedClientRelationship.dimDistrict`
    OPTIONS(
      description="Bairro é uma subdivisão da localidade. Para saber mais, acesse: https://leroypedia.leroymerlin.com.br/wiki/Bairro"
    )
    AS SELECT * FROM ', @view_name, '.semantic.dimDistrict;'
);

PRINT (view_name);

PREPARE stmt FROM @sql_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
