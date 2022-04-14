// 5. Wszystkie filmy osób, które grały w Matrix

MATCH (movies:Movie)<-[:ACTED_IN]-(actor:Person)-[:ACTED_IN]->(matrix:Movie)
WHERE matrix.title = 'The Matrix'
RETURN DISTINCT movies;