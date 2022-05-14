// 1. Znajdź trasy którymi można dostać się z Darjeeling na Sandakphu, mające najmniejszą ilość etapów

match p = allShortestPaths((n:town {name:"Rimbik"})-[*]->(m:peak {name: "Sandakphu"}))
return p, length(p);

// 2. Znajdź mające najmniej etapów trasy którymi można dostać się z Darjeeling na Sandakphu i które mogą być wykorzystywane zimą

match (source:town {name:"Darjeeling"}), (target:peak {name:"Sandakphu"}),
p = allShortestPaths((source)-[*]->(target))
with p, relationships(p) as rel
where all (x in rel where x.winter = "true")
return p, relationships(p), length(p);

// 3. Uszereguj trasy którymi można dostać się z Darjeeling na Sandakphu według dystansu

match (source:town {name:"Darjeeling"}), (target:peak {name:"Sandakphu"}), p = (source)-[r *]->(target)
unwind r as rel
with p, collect(rel.distance) as distances
with p, reduce(acc = 0, x in distances | acc + x) as total_distance
return p, total_distance
order by total_distance asc;

// 4. Znajdź wszystkie miejsca do których można dotrzeć przy pomocy roweru (twowheeler) z Darjeeling latem

match (source:town {name:"Darjeeling"}), (target), 
p = (source)-[r:twowheeler*]->(target)
where all (r in relationships(p) where r.summer = "true")
return target;

// Wynik: Brak takich miejsc


// 5. Uszereguj porty lotnicze według ilości rozpoczynających się w nich lotów

match (n:Airport)<-[r:ORIGIN]-(f)
return n, count(f) as flights
order by flights desc;

// 6. Znajdź wszystkie porty lotnicze, do których da się dolecieć (bezpośrednio lub z przesiadkami) z Los Angeles (LAX) wydając mniej niż 3000

match (origin:Airport)<-[:ORIGIN]-(flight:Flight)-[:DESTINATION]->(destination:Airport), 
(flight)<-[:ASSIGN]-(ticket:Ticket {class:"economy"})
with origin,destination,flight,ticket
create (origin)-[r:PLANE_TICKET {price: ticket.price, class:ticket.class, origin: origin.name, destination: destination.name}]->(destination)
return r;

match p=(origin: Airport {name: 'LAX'})-[:PLANE_TICKET*..6]->(destination: Airport)
with *, reduce(total_price=0, r IN relationships(p) | total_price + r.price) as total_price
where total_price < 3000
and destination.name <> 'LAX'
and all(i in relationships(p) where i.destination <> 'LAX')
return distinct destination.name

// 7. Uszereguj połączenia, którymi można dotrzeć z Los Angeles (LAX) do Dayton (DAY) według ceny biletów

match p=(origin: Airport {name: 'LAX'})-[:PLANE_TICKET*1..6]->(destination: Airport {name: 'DAY'})
with reduce(total_price=0, r in relationships(p) | total_price + r.price) as total_price, p
where destination.name <> 'LAX'
and all(i in relationships(p) where i.destination <> 'LAX')
return p, total_price
order by total_price asc

// Wynik: Brak takich połączeń


// 8. Znajdź najtańsze połączenie z Los Angeles (LAX) do Dayton (DAY)

match p=(origin: Airport {name: 'LAX'})-[:PLANE_TICKET*1..6]->(destination: Airport {name: 'DAY'})
with reduce(total_price=0, r in relationships(p) | total_price + r.price) as total_price, p
where destination.name <> 'LAX'
and all(i in relationships(p) where i.destination <> 'LAX')
return p, total_price
order by total_price asc
limit 1

// Wynik: Brak takich połączeń


// 9. Uszereguj linie lotnicze według ilości miast, pomiędzy którymi oferują połączenia (unikalnych miast biorących udział w relacjach :ORIGIN i :DESTINATION węzłów typu Flight obsługiwanych przez daną linię)

match (origin:Airport)<-[:ORIGIN]-(flight:Flight)-[:DESTINATION]->(destination:Airport)
unwind [origin, destination] as routes
return flight.airline as airline, count(distinct routes) as routes
order by routes desc

// 10. Znajdź najtańszą trasę łączącą 3 różne porty lotnicze

match p=(origin:Airport)-[ft1:PLANE_TICKET]->(middle:Airport)-[ft2:PLANE_TICKET]->(destination:Airport)
with reduce(total_price=0, r in relationships(p) | total_price + r.price) as total_price, p
where  origin.name <> middle.name
and origin.name <> destination.name
and destination.name <> middle.name
return p, total_price
order by total_price asc
limit 1