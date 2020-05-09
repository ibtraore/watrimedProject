import psycopg2
from flask import Flask, render_template, url_for, flash, redirect,request,jsonify,json
from flask_paginate import Pagination, get_page_parameter
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

app.config['SECRET_KEY'] = '113fa56d424bfbb293bcbae3dec4465c'
app.config.from_object("project.config.Config")

db = SQLAlchemy(app)


class User(db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(128), unique=True, nullable=False)
    active = db.Column(db.Boolean(), default=True, nullable=False)

    def __init__(self, email):
        self.email = email


posts =[
	{
		'author':'Borlli Michel Jonas SOME',
		'title':'Enabling West African Herbal Traditional Medicine Digitalization.',
		'content':'Like many parts in the world, Africa is facing great challenges in terms of healthcare. Tradition Medicine (TM) represents a great opportunity to address the inaccessibility, unaffordability or unavailability of conventional medicines and services. Nevertheless, the lack of formalisation (oral transmission) and regulation prevents a large share of the population in accessing African TM knowledge and raises some safety issues. Citizens living in remote or rural areas and with low literacy are particularly underserved and remain at risk of ineffectiveness, potential misuse and adverse reactions',
		'date_posted':'October 20,2019'
	},
	{
		'author':'Gayo DIALLO',
		'title':'Mapping the HTM Ontology to a foundational (upper-level) ontology.',
		'content':'In comparison with a domain ontology, like the HTM Ontology, a foundational (or upper level) ontology consists in very general categories that are common for a large set of domains. It contains entities that can be used to bridge the knowledge represented by domain-specific ontologies. Foundational Ontologies can ensure the interoperability between domain Ontologies',
		'date_posted':'October 25,2019'
	},
	{
		'author':'Frantz Thiessard',
		'title':'The Herbal Traditional Medicine Knowledge Model.',
		'content':' The schema of the Herbal Traditional Medicine knowledge model, refered as the HTM Ontology comprises 13 main Concepts and 36 Properties. The latter are subdivised into 17 Datatype Properties and 19 Object Properties. The major component is the MedicinalPlant entity',
		'date_posted':'October 28,2019'
	}
]

def get_plants(offset=0, per_page=10):
    return rows[offset: offset + per_page]

def change_exp(text):
    for ch in ['_',',','(',')','-']:
        if ch in text:
        	text = text.replace(ch,"")
    for ch in ['é','è','ê']:
        if ch in text:
            text = text.replace(ch,"e")
    #text = text.strip("\'")
    text = text.replace("\'","")
    text = text.replace(" ","")
    text = text.replace("ô","o")
    text = text.replace("à","a")
    text = text.replace("î","i")
    text = text.replace("ï","i")   
    return text

@app.route('/')
@app.route('/home')
def home():
        return render_template('home.html',posts=posts)

@app.route('/about')
def about():
        return render_template('about.html',title='About')

@app.route('/plants', defaults={'page': 1})
@app.route('/plants/<page>')
def plants(page):
	conn = psycopg2.connect("dbname='db_plant' user='watrimed' host='db' password='watrimed'")
	page = request.args.get(get_page_parameter(), type=int, default=int(page))
	cur2 = conn.cursor()
	cur2.execute('SELECT * FROM plant WHERE botanicname IN (SELECT botanicname FROM nameindialect)')
	rows = cur2.rowcount
	if(page == 1):
		cur = conn.cursor()
		cur.execute('SELECT * FROM plant WHERE botanicname IN (SELECT botanicname FROM nameindialect) ORDER BY botanicname ASC LIMIT {limit} offset {offset}'.format(limit = 10, offset = 0))
		data = cur.fetchall()
	else:
		cur = conn.cursor()
		cur.execute('SELECT * FROM plant WHERE botanicname IN (SELECT botanicname FROM nameindialect) ORDER BY botanicname ASC LIMIT {limit} offset {offset}'.format(limit = 10, offset = (5 * int(page))))
		data = cur.fetchall()
	pagination = Pagination(page=page, total=rows, css_framework='bootstrap4', record_name='plants')
	return render_template('plantes.html', plants=data, pagination=pagination)

@app.route('/recipes', defaults={'page': 1})
@app.route('/recipes/<page>')
def recipes(page):
	conn = psycopg2.connect("dbname='db_plant' user='watrimed' host='db' password='watrimed'")
	page = request.args.get(get_page_parameter(), type=int, default=int(page))
	cur2 = conn.cursor()
	cur2.execute('SELECT * FROM recipe')
	rows = cur2.rowcount
	if(page == 1):
		cur = conn.cursor()
		cur.execute('SELECT * FROM recipe LIMIT {limit} offset {offset}'.format(limit = 10, offset = 0))
		data = cur.fetchall()
	else:
		cur = conn.cursor()
		cur.execute('SELECT * FROM recipe LIMIT {limit} offset {offset}'.format(limit = 10, offset = (5 * int(page))))
		data = cur.fetchall()
	pagination = Pagination(page=page, total=rows, css_framework='bootstrap4', record_name='plants')
	return render_template('recettes.html', plants=data, pagination=pagination)
	

@app.route('/represent/<code>')
def represent(code):
	return render_template('graph_recipe.html', code=code)

@app.route('/representation/<name>')
def representation(name):
	return render_template('graph2.html', name=name)


@app.route('/graph_recipe/<code>')
def graph_recipe(code):
	conn = psycopg2.connect("dbname='db_plant' user='watrimed' host='db' password='watrimed'")
	cur = conn.cursor()
	cur2 = conn.cursor()
	cur3 = conn.cursor()
	sql = "SELECT * FROM plantsinrecipe WHERE recipecode = %s"
	#sql2 = "SELECT * FROM plantsinrecipe p INNER JOIN recipetherapeuticindication r ON p.recipecode = r.recipecode INNER JOIN therapeuticindication t ON t.ticode = r.ticode INNER JOIN recipecontraindications rc ON rc.recipecode = r.recipecode INNER JOIN contraindications c ON rc.cicode = c.cicode WHERE botanicname = %s"
	sql2 = "SELECT * FROM recipetherapeuticindication r INNER JOIN therapeuticindication t ON t.ticode = r.ticode WHERE recipecode = %s"
	sql3 = "SELECT * FROM recipecontraindications r INNER JOIN contraindications c ON r.cicode = c.cicode WHERE recipecode = %s"
	cur.execute(sql,(code,))
	cur2.execute(sql2,(code,))
	cur3.execute(sql3,(code,))
	#code = change_exp[code]
	nodes = [
		{
			'classes':'recipe',
			'data':{
				'id':code,
				'name':code,
				'faveColor':'#1f77b4',
				"info": "<b>Recipe</b> <br> Code: "+ code
			}
		}
	]
	edges = []

	if(cur.rowcount > 0):
		rows = cur.fetchall()
		for row in rows:
			val1 = change_exp(row[1])
			print(val1)
			node ={'classes':'plant','data': {'id':val1,'name':row[1],'faveColor':'#ff7f0e',"info": " <b>Plant</b> <br> Botanic Name: "+ row[1] +"<br> Part : "+row[2]+"<br> Quantity : "+str(row[3])} }
			nodes.append(node)
			edge = { "data": { "source":code, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)
			

	if(cur2.rowcount > 0):
		rows = cur2.fetchall()
		for row in rows:
			#print(row[0])
			val1 = "ther"+ str(row[1])
			node ={'classes':'ther','data': {'id':val1,'name':row[3],'faveColor':'#2ca02c',"info": "<b>Therapeutique</b> <br> Name : "+ row[3]} }
			nodes.append(node)
			edge = { "data": { "source":code, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)


	if(cur3.rowcount > 0):
		rows = cur3.fetchall()
		for row in rows:
			val1 = "ther"+ str(row[1])
			node ={'classes':'contra','data': {'id':val1,'name':row[3],'faveColor':'#98df8a',"info": "<b>ContraIndication</b> <br> Name : "+ row[3]} }
			nodes.append(node)
			edge = { "data": { "source":code, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)		

	data = {'nodes':nodes, 'edges':edges}
	return jsonify(data)

@app.route('/graph/<name>')
def graph(name):
	conn = psycopg2.connect("dbname='db_plant' user='watrimed' host='db' password='watrimed'")
	cur = conn.cursor()
	cur2 = conn.cursor()
	cur3 = conn.cursor()
	cur4 = conn.cursor()
	sql = "SELECT * FROM nameindialect WHERE botanicname = %s"
	#sql2 = "SELECT * FROM plantsinrecipe p INNER JOIN recipetherapeuticindication r ON p.recipecode = r.recipecode INNER JOIN therapeuticindication t ON t.ticode = r.ticode INNER JOIN recipecontraindications rc ON rc.recipecode = r.recipecode INNER JOIN contraindications c ON rc.cicode = c.cicode WHERE botanicname = %s"
	sql2 = "SELECT * FROM planttherapeuticindications p INNER JOIN therapeuticindication t ON t.ticode = p.ticode WHERE botanicname = %s"
	sql3 = "SELECT * FROM plantcomponents p INNER JOIN chimicalcomponent c ON c.ccname = p.ccname WHERE botanicname = %s"
	sql4 = "SELECT * FROM plantcontraindications p INNER JOIN contraindications c ON c.cicode = p.cicode WHERE botanicname = %s"
	cur.execute(sql,(name,))
	cur2.execute(sql2,(name,))
	cur3.execute(sql3,(name,))
	cur4.execute(sql4,(name,))
	name = name.replace(" ", "")
	nodes = [
		{
			'classes':'plant',
			'data':{
				'id':name,
				'name':name,
				'faveColor':'#1f77b4',
				"info": "<b>Plant</b> <br> Botanic Name: "+ name
			}
		}
	]
	edges = []
	x = 0
	y = 0

	if(cur.rowcount > 0):
		rows = cur.fetchall()
		for row in rows:
			val1 = change_exp(row[0])
			#val1 = val1.strip("\'")
			#val1 = val1.replace(" ", "")
			#val1 = val1.replace("-", "")
			#val1 = val1.replace(",", "")
			#val1 = val1.replace("(", "")
			#val1 = val1.replace(")", "")
			#val1 = val1.replace("é", "e")
			node ={'classes':'namein','data': {'id':val1,'name':row[0],'faveColor':'#ff7f0e',"info": "<b>Name in Dialect</b> <br> Name : "+ row[0] + " <br> Dialect: "+ row[1]} }
			nodes.append(node)
			val2 = change_exp(row[2])
			#val2 = val2.replace(" ", "")
			#val2 = val2.replace("-", "")
			#val2 = val2.replace(",", "")
			#val2 = val2.replace("(", "")
			#val2 = val2.replace(")", "")
			#val2 = val2.replace("'", "_")
			#val2 = val2.replace("ô", "o")
			#val2 = val2.replace("é", "e")
			node ={'classes':'country','data': {'id':val2,'name':row[2],'faveColor':'#aec7e8',"info": "<b>Country</b> <br> target : "+ row[2] } }
			nodes.append(node)
			#val3 = row[1]
			#val3 = val3.replace(" ", "")
			#val3 = val3.replace("-", "")
			#val3 = val3.replace(",", "")
			#val3 = val3.replace("(", "")
			#val3 = val3.replace(")", "")
			#val3 = val3.replace("'", "_")
			#val3 = val3.replace("ô", "o")
			#val3 = val3.replace("é", "e")
			#node ={'classes':'dial','data': {'id':val3,'name':row[1],'faveColor':'red'},'position':{'x':150, 'y':-100} }
			#nodes.append(node)
			edge = { "data": { "source":name, "target":val2, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)
			edge = { "data": { "source":val2, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)
			#edge = { "data": { "source":val3, "target":val2, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			#edges.append(edge)
			

	if(cur2.rowcount > 0):
		rows = cur2.fetchall()
		for row in rows:
			#print(row[0])
			val1 = "ther"+ str(row[2])
			#val1 = change_exp(row[2])
			#val1 = val1.strip("\'")
			#val1 = val1.replace(" ", "")
			#val1 = val1.replace("-", "")
			#val1 = val1.replace(",", "")
			#val1 = val1.replace("(", "")
			#val1 = val1.replace(")", "")
			#val1 = val1.replace("é", "e")
			#node ={'classes':'part','data': {'id':val1,'name':row[2],'faveColor':'#2ca02c',"info": "Part <br> target : "+ row[2]} }
			node ={'classes':'ther','data': {'id':val1,'name':row[3],'faveColor':'#2ca02c',"info": "<b>Therapeuthique</b> <br> Name : "+ row[3]} }
			nodes.append(node)
			#val2 = "tind"+ str(row[6])
			#node ={'classes':'tind','data': {'id':val2,'name':row[7],'faveColor':'black'} }
			#nodes.append(node)
			#val3 = "cont"+ str(row[10])
			#node ={'classes':'cont','data': {'id':val3,'name':row[11],'faveColor':'#ffbb78',"info": "Contraindication <br> target : "+ row[11]} }
			#nodes.append(node)
			edge = { "data": { "source":name, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)
			#edge = { "data": { "source":val1, "target":val2, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			#edges.append(edge)
			#edge = { "data": { "source":val1, "target":val3, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			#edges.append(edge)

	if(cur3.rowcount > 0):
		rows = cur3.fetchall()
		for row in rows:
			val1 = change_exp(row[1])
			#val1 = val1.strip("\'")
			#val1 = val1.replace(" ", "")
			#val1 = val1.replace("-", "")
			#val1 = val1.replace(",", "")
			#val1 = val1.replace("(", "")
			#val1 = val1.replace(")", "")
			#val1 = val1.replace("é", "e")
			node ={'classes':'comp','data': {'id':val1,'name':row[1],'faveColor':'#98df8a',"info": "<b>Composent</b> <br> target : "+ row[1]} }
			nodes.append(node)
			edge = { "data": { "source":name, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)


	if(cur4.rowcount > 0):
		rows = cur4.fetchall()
		for row in rows:
			#print(row[0])
			val1 = "pcont"+ str(row[2])
			node ={'classes':'pcont','data': {'id':val1,'name':row[3],'faveColor':'#98df8a',"info": "<b>Contraindacation</b> <br> Content : "+ row[3]} }
			nodes.append(node)
			edge = { "data": { "source":name, "target":val1, "method":"method","pubmed":"linky","sourcedb": "source","confidence":"500" }}
			edges.append(edge)

			

	data = {'nodes':nodes, 'edges':edges}
	return jsonify(data)


