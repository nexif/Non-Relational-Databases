// 2. Wszystkie filmy, w których grał Hugo Weaving

MATCH (movies:Movie)<-[:ACTED_IN]-(actors:Person)
WHERE actors.name = 'Hugo Weaving'
RETURN movies;