// 1. Wszystkie filmy

MATCH (n:Movie) RETURN n;

// 2. Wszystkie filmy, w których grał Hugo Weaving

MATCH (movies:Movie)<-[:ACTED_IN]-(actors:Person)
WHERE actors.name = 'Hugo Weaving'
RETURN movies;

// 3. Reżyserzy filmów, w których grał Hugo Weaving

MATCH (directors:Person)-[:DIRECTED]->(movies:Movie)<-[:ACTED_IN]-(actors:Person)
WHERE actors.name = 'Hugo Weaving'
RETURN DISTINCT directors;

// 4. Wszystkie osoby, z którymi Hugo Weaving grał w tych samych filmach

MATCH (hugo:Person)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(actors:Person)
WHERE hugo.name = 'Hugo Weaving'
RETURN DISTINCT actors;

// 5. Wszystkie filmy osób, które grały w Matrix

MATCH (movies:Movie)<-[:ACTED_IN]-(actor:Person)-[:ACTED_IN]->(matrix:Movie)
WHERE matrix.title = 'The Matrix'
RETURN DISTINCT movies;

// 6. Listę aktorów (aktor = osoba, która grała przynajmniej w jednym filmie) wraz z ilością filmów, w których grali

// Do utworzenia wizualizacji:
MATCH (actors:Person)-[:ACTED_IN]->(movies:Movie)
RETURN actors, count(movies);

// Do utworzenia JSONa z wynikami:
MATCH (actors:Person)-[:ACTED_IN]->(movies:Movie)
RETURN actors.name, count(movies) as movies_count
ORDER BY movies_count DESC;

// 7. Listę osób, które napisały scenariusz filmu, które wyreżyserowały wraz z tytułami takich filmów (koniunkcja – ten sam autor scenariusza i reżyser)

// Do utworzenia wizualizacji:
MATCH (directors_writers:Person)-[:DIRECTED]->(movies:Movie),
(directors_writers)-[:WROTE]->(movies)
RETURN directors_writers, movies;

// Do utworzenia JSONa z wynikami:
MATCH (directors_writers:Person)-[:DIRECTED]->(movies:Movie),
(directors_writers)-[:WROTE]->(movies)
RETURN directors_writers.name;

// 8. Listę filmów, w których grał zarówno Hugo Weaving jak i Keanu Reeves

// Do utworzenia wizualizacji:
MATCH (hugo:Person)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(keanu:Person)
WHERE hugo.name = 'Hugo Weaving' AND keanu.name = 'Keanu Reeves'
RETURN hugo, movies, keanu;

// Do utworzenia JSONa z wynikami:
MATCH (hugo:Person)-[:ACTED_IN]->(movies:Movie)<-[:ACTED_IN]-(keanu:Person)
WHERE hugo.name = 'Hugo Weaving' AND keanu.name = 'Keanu Reeves'
RETURN movies.title;

// 9. Zestaw zapytań powodujących uzupełnienie bazy danych o film Captain America: The First Avenger 
// wraz z uzupełnieniem informacji o reżyserze, scenarzystach i odtwórcach głównych ról (w oparciu o skrócone informacje 
// z IMDB http://www.imdb.com/title/tt0458339/) + zapytanie pokazujące dodany do bazy film wraz odtwórcami głównych ról, scenarzystą i reżyserem. 
// Plik SVG ma pokazywać wynik ostatniego zapytania.

MATCH (hugo:Person) WHERE hugo.name = 'Hugo Weaving'
CREATE p = (director:Person {name: 'Joe Johnston', born: '1950'})-[:DIRECTED]->(captain_america:Movie {title: 'Captain America: The First Avenger', released: '2011', tagline: 'When patriots become heroes'}),
    (writer1:Person {name: 'Christopher Markus', born: '1970'})-[:WROTE]->(captain_america),
    (writer2:Person {name: 'Stephen McFeely', born: '1970'})-[:WROTE]->(captain_america),
    (writer3:Person {name: 'Joe Simon', born: '1913'})-[:WROTE]->(captain_america),
    (actor1:Person {name: 'Chris Evans'})-[:ACTED_IN]->(captain_america),
    (actor2:Person {name: 'Samuel L. Jackson', born: '1948'})-[:ACTED_IN]->(captain_america),
    (hugo)-[:ACTED_IN]->(captain_america)
RETURN p;

MATCH (staff:Person)-[:ACTED_IN|:DIRECTED|:WROTE]->(captain_america:Movie)
WHERE captain_america.title = 'Captain America: The First Avenger'
RETURN staff, captain_america;