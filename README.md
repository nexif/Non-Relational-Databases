# Non-Relational-Databases

My projects for "Non-relational databases" course


---
# MongoDB:
### Ćwiczenia 1:
1.	Jedna osoba znajdująca się w bazie; 
2.	Jedna kobieta narodowości chińskiej; 
3.	Lista mężczyzn narodowości niemieckiej;
4.	Lista wszystkich osób znajdujących się w bazie o wadze z przedziału <68, 71.5);
5.	Lista imion i nazwisk wszystkich osób znajdujących się w bazie oraz miast, w których mieszkają, ale tylko dla osób urodzonych w XXI wieku; 
6.	Dodaj siebie do bazy, zgodnie z formatem danych użytych dla innych osób (dane dotyczące karty kredytowej, adresu zamieszkania i wagi mogą być fikcyjne); 
7.	Usuń z bazy osoby o wzroście przekraczającym 190; 
8.	 Zastąp nazwę miasta „Moscow” przez „Moskwa” u wszystkich osób w bazie; 
9.	Dodaj do wszystkich osób o imieniu Antonio własność „hobby” o wartości „pingpong”; 
10.	Usuń u wszystkich osób o zawodzie „Editor” własność „email”. 

### Ćwiczenia 2:
Przy pomocy operacji map-reduce i  frameworku do agregacji znajdź następujące informacje: 
1.	Średnią wagę i wzrost osób w bazie z podziałem na płeć (tzn. osobno mężczyzn, osobno kobiet); 
2.	Łączną ilość środków pozostałych na kartach kredytowych osób w bazie, w podziale na waluty; 
3.	Listę unikalnych zawodów; 
4.	Średnie, minimalne i maksymalne BMI (waga/wzrost^2) dla osób w bazie, w podziale na narodowości; 
5.	Średnia i łączna ilość środków na kartach kredytowych kobiet narodowości polskiej w podziale na waluty.


---
# Neo4j:
### Ćwiczenia 3:
1.	Wszystkie filmy
2.	Wszystkie filmy, w których grał Hugo Weaving 
3.	Reżyserzy filmów, w których grał Hugo Weaving 
4.	Wszystkie osoby, z którymi Hugo Weaving grał w tych samych filmach 
5.	Wszystkie filmy osób, które grały w Matrix
6.	Listę aktorów (aktor = osoba, która grała przynajmniej w jednym filmie) wraz z ilością filmów, w których grali 
7.	Listę osób, które napisały scenariusz filmu, które wyreżyserowały wraz z tytułami takich filmów (koniunkcja – ten sam autor scenariusza i reżyser) 
8.	Listę filmów, w których grał zarówno Hugo Weaving jak i Keanu Reeves 
9.	Zestaw zapytań powodujących uzupełnienie bazy danych o film Captain America: The First Avenger wraz z uzupełnieniem informacji o reżyserze, scenarzystach i odtwórcach głównych ról (w oparciu o skrócone informacje z IMDB - http://www.imdb.com/title/tt0458339/) + zapytanie pokazujące dodany do bazy film wraz odtwórcami głównych ról, scenarzystą i reżyserem. Plik SVG ma pokazywać wynik ostatniego zapytania.  

### Ćwiczenia 4:
Część 1 – Wycieczki górskie

Zaimportuj dane uruchamiając skrypt task2.cypher. Napisz następujące zapytania:  
1.	Znajdź trasy którymi można dostać się z Darjeeling na Sandakphu, mające najmniejszą ilość etapów 
2.	Znajdź mające najmniej etapów trasy którymi można dostać się z Darjeeling na Sandakphu i które mogą być wykorzystywane zimą 
3.	Uszereguj trasy którymi można dostać się z Darjeeling na Sandakphu według dystansu 
4.	Znajdź wszystkie miejsca do których można dotrzeć przy pomocy roweru (twowheeler) z Darjeeling latem

Część 2 – Połączenia lotnicze

Zaimportuj dane uruchamiając skrypt task3.cypher. Napisz następujące zapytania:

5.	Uszereguj porty lotnicze według ilości rozpoczynających się w nich lotów
6.	Znajdź wszystkie porty lotnicze, do których da się dolecieć (bezpośrednio lub z przesiadkami) z Los Angeles (LAX) wydając mniej niż 3000 
7.	Uszereguj połączenia, którymi można dotrzeć z Los Angeles (LAX) do Dayton (DAY) według ceny biletów 
8.	Znajdź najtańsze połączenie z Los Angeles (LAX) do Dayton (DAY) 
9.	Uszereguj linie lotnicze według ilości miast, pomiędzy którymi oferują połączenia (unikalnych miast biorących udział w relacjach :ORIGIN i :DESTINATION węzłów typu Flight obsługiwanych przez daną linię) 
10.	Znajdź najtańszą trasę łączącą 3 różne porty lotnicze


---
# Riak:
### Ćwiczenia 5:
1.	Umieść w bazie (nazwa bucketa ma być Twoim numerem indeksu poprzedzonym literą „s”) 5 wartości, gdzie każda z nich ma być dokumentem json mającym 4 pola co najmniej dwóch różnych typów. 
2.	Pobierz z bazy jedną z dodanych przez Ciebie wartości. 
3.	Zmodyfikuj jedną z wartości – dodając dodatkowe pole do dokumentu. 
4.	Zmodyfikuj jedną z wartości – usuwając jedną pole z wybranego dokumentu. 
5.	Zmodyfikuj jedną z wartości – zmieniając wartość jednego z pól.  
6.	Usuń jeden z dokumentów z bazy. 
7.	Spróbuj pobrać z bazy wartość, która nie istnieje w tej bazie. 
8.	Dodaj do bazy 1 dokument json (zawierający 1 pole), ale nie specyfikuj klucza. 
9.	Pobierz z bazy element z zadania 8. 
10.	Usuń z bazy element z zadania 8. 

### Ćwiczenia 6:
Napisz program, który wrzuci do bazy dokument, pobierze go i wypisze, zmodyfikuje go, następnie pobierze i wypisze, a na końcu usunie go i spróbuje pobrać z bazy. Sam program może być napisany w jednym z następujących języków programowania: 

•	Python 
•	Java (wyeksportowany projekt z Eclipse, NetBeans lub IntelliJ) 
•	Scala (wyeksportowany projekt z Eclipse, NetBeans, ScalaIDE lub IntelliJ)
