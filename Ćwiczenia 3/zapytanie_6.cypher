// 6. Listę aktorów (aktor = osoba, która grała przynajmniej w jednym filmie) wraz z ilością filmów, w których grali


// Do utworzenia wizualizacji:
MATCH (actors:Person)-[:ACTED_IN]->(movies:Movie)
RETURN actors, count(movies);

// Do utworzenia JSONa z wynikami:
MATCH (actors:Person)-[:ACTED_IN]->(movies:Movie)
RETURN actors.name, count(movies) as movies_count
ORDER BY movies_count DESC;