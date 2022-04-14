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