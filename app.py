from pyArango import connection

conn = connection.Connection(arangoURL="http+tcp://arangodb:8529", username="root", password="openSesame")

print(conn)