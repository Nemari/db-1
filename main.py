import cx_Oracle

username = 'system'
password = 'Nemari123'
databaseName = 'localhost/orcl.168.1.8'

connection = cx_Oracle.connect(username, password, databaseName)

cursor = connection.cursor()



query1 = """SELECT TRIM(variety), TRIM(AVG(grade)) FROM rate GROUP BY variety"""
print("\nFirst query: average grade for each wine variety.")
cursor.execute(query1)
for rec in  cursor.fetchall():
    print(rec[0], rec[1])


query2 = """select count(province)/(select count(province)from manufacture)*100 as Procent, province from manufacture group by province"""
print("\nSecond query: percent wineries in California among all provinces.")
cursor.execute(query2, provincee_id = 'California')


print(cursor.fetchone()[0], '%')


query3 = """SELECT winery, grade FROM wine JOIN rate ON wine.wine_id=rate.wine_id"""
print("\nThird query: dependancy between winery and grade.")
cursor.execute(query3)

for rec in  cursor.fetchall():
    print(rec[0], rec[1])

cursor.close()

connection.close()
