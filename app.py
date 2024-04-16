from arango import ArangoClient

client = ArangoClient()

db = client.db('http://arangodb:8529', username='root', password='openSesame')

print(db)