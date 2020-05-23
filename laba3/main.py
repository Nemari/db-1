import cx_Oracle

username = 'system'
password = 'Nemari123'
databaseName = 'localhost/orcl.168.1.8'

connection = cx_Oracle.connect(username, password, databaseName)

cursor = connection.cursor()



query1 = """SELECT WineType.wine_type as wine_type, AVG(Score.score)
from Score
join WineType on Score.wine_id = WineType.wine_id
GROUP BY wine_type"""
print("\nFirst query: average grade for each wine variety.")
cursor.execute(query1)
for rec in  cursor.fetchall():
    print(rec[0], rec[1])


query2 = """select count(province)/(select count(province)from Province)*100 as Procent, province from Province group by province"""
print("\nSecond query: percent wineries in each province.")
cursor.execute(query2, provincee_id = 'California')


print(cursor.fetchone()[0], '%')


query3 = """select * from CompanyScore;"""
print("\nThird query: dependancy between winery and grade.")
cursor.execute(query3)

for rec in  cursor.fetchall():
    print(rec[0], rec[1])

cursor.close()

connection.close()
