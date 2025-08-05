SELECT TRIM('.,' FROM LOWER(UNNEST(STRING_TO_ARRAY(contents, ' ')))) AS word, COUNT(*) AS occurrences
FROM google_file_store
GROUP BY TRIM('.,' FROM LOWER(UNNEST(STRING_TO_ARRAY(contents, ' '))))
ORDER BY COUNT(*) DESC