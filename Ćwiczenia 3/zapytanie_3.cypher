// 3. Reżyserzy filmów, w których grał Hugo Weaving

MATCH (directors:Person)-[:DIRECTED]->(movies:Movie)<-[:ACTED_IN]-(actors:Person)
WHERE actors.name = 'Hugo Weaving'
RETURN DISTINCT directors;