// 8. Listę filmów, w których grał zarówno Hugo Weaving jak i Keanu Reeves

// Do utworzenia wizualizacji:
MATCH (hugo:Person)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(keanu:Person)
WHERE hugo.name = 'Hugo Weaving' AND keanu.name = 'Keanu Reeves'
RETURN hugo, movies, keanu;

// Do utworzenia JSONa z wynikami:
MATCH (hugo:Person)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(keanu:Person)
WHERE hugo.name = 'Hugo Weaving' AND keanu.name = 'Keanu Reeves'
RETURN movies.title;