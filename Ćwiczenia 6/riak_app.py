import riak

client = riak.RiakClient(pb_port=8087)

bucket = client.bucket('books')

book = {
    'isbn': "1111979723",
    'title': "Moby Dick",
    'author': "Robert Melville",
}

new_book = bucket.new(book['isbn'], data=book)
new_book.store()

fetched_book = bucket.get(book['isbn'])

print('POBRANE Z BAZY:')
print(fetched_book.encoded_data)


book_updated = {
    'isbn': "1111979723",
    'title': "Moby Dick",
    'author': "Herman Melville",
    'release_year': 1851
}

new_book_updated = bucket.new(book_updated['isbn'], data=book_updated)
new_book_updated.store()

fetched_updated_book = bucket.get(book_updated['isbn'])

print('ZAKTUALIZOWANE DANE:')
print(fetched_updated_book.encoded_data)

fetched_updated_book.delete()

print('PO USUNIECIU:')
print(bucket.get(book_updated['isbn']).encoded_data)
