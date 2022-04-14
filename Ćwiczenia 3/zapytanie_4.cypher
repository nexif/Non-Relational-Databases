// 4. Wszystkie osoby, z którymi Hugo Weaving grał w tych samych filmach

MATCH (hugo:Person)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(actors:Person)
WHERE hugo.name = 'Hugo Weaving'
RETURN DISTINCT actors;