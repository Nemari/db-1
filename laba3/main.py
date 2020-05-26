import chart_studio
chart_studio.tools.set_credentials_file('Nemari', '4IXvHdK7WIJhR4iQor2V')
import plotly.graph_objects as go

import cx_Oracle
import chart_studio.plotly as py

connection = cx_Oracle.connect('system', '12345Aa', 'DESKTOP-9JDL5ND/database')
print("\nFirst query: average grade for each wine variety.")
query1 = """SELECT WineType.wine_type as wine_type, AVG(Score.score)
from Score
join WineType on Score.wine_id = WineType.wine_id
GROUP BY wine_type"""
cursor = connection.cursor()
cursor.execute(query1)
attributes=cursor.description
x1=[]
y1=[]
for rec in  cursor.fetchall():
    x1.append(rec[0])
    y1.append(rec[1])
fig = go.Figure([go.Bar(x=x1, y=y1)])
py.plot(fig, auto_open=True, filename='graph1')

print("\nSecond query: percent wineries in each province.")
query2 = """select count(province)/(select count(province)from Province)*100 as Procent, province from Province group by province"""
cursor.execute(query2)
x2=[]
y2=[]
for rec1 in cursor.fetchall():
    x2.append(rec1[0])
    y2.append(rec1[1])

colors = ['gold', 'mediumturquoise', 'lightgreen', 'cyan', '#E377C2']
fig2 = go.Figure(data=[go.Pie(labels=y2,
                             values=x2)])
fig2.update_traces(marker=dict(colors=colors))
py.plot(fig2, auto_open=True, filename='graph2')


print("\nThird query: dependancy between winery and grade.")
query3 = """select * from CompanyScore"""
cursor.execute(query3)
x3=[]
y3=[]
for rec in cursor.fetchall():
    x3.append(rec[0])
    y3.append(rec[1])

fig3= go.Figure(data=go.Scatter(x=x3, y=y3, mode='markers'))
py.plot(fig3, auto_open=True, filename='graph3')
cursor.close()

connection.close()
