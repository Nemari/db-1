import cx_Oracle
import pandas as pd
import numpy as np

max_item_size = 100
file_name = 'wine.csv'

user_name = 'system'
password = '12345Aa'
host = 'DESKTOP-9JDL5ND/database'

connection = cx_Oracle.connect(user_name, password, host)
cursor = connection.cursor()

cursor.execute("delete from company")
cursor.execute("delete from province")
cursor.execute("delete from country")
cursor.execute("delete from winetype")
cursor.execute("delete from score")
cursor.execute("delete from wineid")

connection.commit()

data = pd.read_csv(file_name, delimiter=',', encoding='utf-8')

unique_country = set()
unique_province = set()
unique_winery = set()
count = max_item_size
for wine in np.array(data[['Unnamed: 0', 'country', 'province', 'variety', 'points', 'winery']]):
    if count != 0:
        id = wine[0]
        country = wine[1]
        province = wine[2]
        variety = wine[3]
        score = wine[4]
        winery = wine[5]
        if country in unique_country:
            continue
        elif province in unique_province:
            continue
        elif winery in unique_winery:
            continue
        unique_country.add(country)
        unique_province.add(province)
        unique_winery.add(winery)
        cursor.execute("INSERT INTO WineId(wine_id) VALUES({})".format(id).encode("utf-8"))
        cursor.execute("INSERT INTO WineType(wine_id, wine_type) VALUES({}, '{}')".format(id, variety).encode("utf-8"))
        cursor.execute("INSERT INTO Country(wine_id, country, province) VALUES({}, '{}', '{}')".format(id, country, province).encode("utf-8"))
        cursor.execute("INSERT INTO Province(province, winery) VALUES('{}', '{}')".format(province, winery).encode("utf-8"))
        cursor.execute("INSERT INTO Company(winery, wine_id) VALUES('{}', {})".format(winery, id).encode("utf-8"))
        cursor.execute("INSERT INTO Score(wine_id, score) VALUES({}, '{}')".format(id, score).encode("utf-8"))
        connection.commit()
        count -= 1
    else:
        break

cursor.close()
connection.close()
print('\nFinish')
