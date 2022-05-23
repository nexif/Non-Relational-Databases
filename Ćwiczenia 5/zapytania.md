1. Umieść w bazie (nazwa bucketa ma być Twoim numerem indeksu poprzedzonym literą „s”) 5 wartości, gdzie każda z nich ma być dokumentem json mającym 4 pola co najmniej dwóch różnych typów.

```bash
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":1, "forename": "Adam", "surname": "Nowak", "employed": false}' http://localhost:8098/buckets/s26430/keys/1
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":2, "forename": "Andrzej", "surname": "Kowalski", "employed": true}' http://localhost:8098/buckets/s26430/keys/2
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":3, "forename": "Jan", "surname": "Kot", "employed": true}' http://localhost:8098/buckets/s26430/keys/3
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":4, "forename": "Piotr", "surname": "Lis", "employed": true}' http://localhost:8098/buckets/s26430/keys/4
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":5, "forename": "Roman", "surname": "Wiśniewski", "employed": false}' http://localhost:8098/buckets/s26430/keys/5
```

2. Pobierz z bazy jedną z dodanych przez Ciebie wartości.

```bash
curl -i -XGET http://localhost:8098/buckets/s26430/keys/1
```

3. Zmodyfikuj jedną z wartości – dodając dodatkowe pole do dokumentu.

```bash
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":1, "forename": "Adam", "surname": "Nowak", "employed": false, "retired": false}' http://localhost:8098/buckets/s26430/keys/1
```

4. Zmodyfikuj jedną z wartości – usuwając jedną pole z wybranego dokumentu.

```bash
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":1, "forename": "Adam", "surname": "Nowak", "retired": false}' http://localhost:8098/buckets/s26430/keys/1
```

5. Zmodyfikuj jedną z wartości – zmieniając wartość jednego z pól.

```bash
curl -i -XPUT -H "Content-Type: application/json" -d '{"id":1, "forename": "Adam", "surname": "Nowak", "retired": true}' http://localhost:8098/buckets/s26430/keys/1
```

6. Usuń jeden z dokumentów z bazy.

```bash
curl -i -XDELETE http://localhost:8098/buckets/s26430/keys/2
```

7. Spróbuj pobrać z bazy wartość, która nie istnieje w tej bazie.

```bash
curl -i -XDELETE http://localhost:8098/buckets/s26430/keys/2
```

8. Dodaj do bazy 1 dokument json (zawierający 1 pole), ale nie specyfikuj klucza.

```bash
curl -i -XPOST -H "Content-Type: application/json" -d '{"employed": false}' http://localhost:8098/buckets/s26430/keys
```

9. Pobierz z bazy element z zadania 8.

```bash
curl -i -XGET http://localhost:8098/buckets/s26430/keys/66xUGuZln7ZXGUwSZzWTKCE9IB2
```

10. Usuń z bazy element z zadania 8.

```bash
curl -i -XDELETE http://localhost:8098/buckets/s26430/keys/66xUGuZln7ZXGUwSZzWTKCE9IB2
```
