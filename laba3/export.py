import cx_Oracle
import csv
import pandas as pd

user_name = 'system'
password = '12345Aa'
host = 'DESKTOP-9JDL5ND/database'

connection = cx_Oracle.connect(user_name, password, host)
cursor = connection.cursor()
tables = ['wineid', 'winetype', 'score', 'company', 'country', 'province']

for table in tables:
    cursor.execute("SELECT * FROM {}".format(table))
    data = pd.DataFrame(data=[row for row in cursor], columns=[header[0] for header in cursor.description])
    data.to_csv('{}.csv'.format(table), index=False, header=True)

cursor.close()
connection.close()
