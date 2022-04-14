// 7. Listę osób, które napisały scenariusz filmu, które wyreżyserowały wraz z tytułami takich filmów (koniunkcja – ten sam autor scenariusza i reżyser)

// Do utworzenia wizualizacji:
MATCH (directors_writers:Person)-[:DIRECTED]->(movies:Movie),
(directors_writers)-[:WROTE]->(movies)
RETURN directors_writers, movies;

// Do utworzenia JSONa z wynikami:
MATCH (directors_writers:Person)-[:DIRECTED]->(movies:Movie),
(directors_writers)-[:WROTE]->(movies)
RETURN directors_writers.name;