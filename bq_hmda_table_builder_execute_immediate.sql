EXECUTE IMMEDIATE
  "SELECT  " ||
  (
    SELECT ARRAY_TO_STRING( ARRAY(
      SELECT
        IF(ARRAY_LENGTH(value_mapping) > 0, 'u_map_' || raw_field_name || '.value AS ' || raw_field_name, raw_field_name) || ''
      FROM
        `hmda.hmda_field_mapping`
      ORDER BY
        CAST(field_position AS INT64)
      ),', \n')
  )
  || ' \n'
  || 'FROM hmda.mlar_2022 mlar \n'
  || (
    SELECT ARRAY_TO_STRING( ARRAY(
      SELECT
        'LEFT JOIN hmda.hmda_field_mapping AS map_' || raw_field_name || ' ON ' || 'map_' || raw_field_name || ".raw_field_name = '"  || raw_field_name || "'"
        || ' LEFT JOIN UNNEST(' || 'map_' || raw_field_name || '.value_mapping) AS u_map_' || raw_field_name || ' ON u_map_' || raw_field_name || '.key = mlar.' || raw_field_name
      FROM
        `hmda.hmda_field_mapping`
      WHERE
        ARRAY_LENGTH(value_mapping) > 0
      ORDER BY
        CAST(field_position AS INT64)
      ),' \n')
  )
  || ' LIMIT 100'
