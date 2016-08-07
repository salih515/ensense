<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="example.jena"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.jena.query.Query"%>
<%@ page import="org.apache.jena.query.QueryExecution"%>
<%@ page import="org.apache.jena.query.QueryExecutionFactory"%>
<%@ page import="org.apache.jena.query.QueryFactory"%>
<%@ page import="org.apache.jena.query.ResultSetFactory"%>
<%@ page import="org.apache.jena.query.ResultSetFormatter"%>
<%@ page import="org.apache.jena.query.ResultSetRewindable"%>
<%@ page import="org.apache.jena.rdf.model.Model"%>
<%@ page import="org.apache.jena.rdf.model.ModelFactory"%>
<%@ page import="org.apache.jena.rdf.model.RDFNode"%>
<%@ page import="org.apache.jena.rdf.model.Resource"%>
<%@ page import="org.apache.jena.rdf.model.Statement"%>
<%@ page import="org.apache.jena.rdf.model.StmtIterator"%>
<%@ page import="org.apache.jena.util.FileManager"%>
<%@ page import="org.apache.commons.lang3.StringUtils"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>EnSense</title>
<script type="text/javascript" src="http://visjs.org/dist/vis.js"></script>
<link href="http://visjs.org/dist/vis.css" rel="stylesheet"
	type="text/css" />

<style type="text/css">
#mynetwork {
	width: auto;
	height: 600px;
	border: 1px solid lightgray;
}
</style>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">


</head>
<body>

	<%
	
jena tc = new jena();
String selectdis1= request.getParameter("dis1");
String selectdis2= request.getParameter("dis2");

List<String> listOfString = new ArrayList<String>();
List<String> listOfString2 = new ArrayList<String>();

String queryString = "PREFIX owl: <http://www.w3.org/2002/07/owl#>"
		+ "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>"
		+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
		+ "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
		+ "PREFIX foaf: <http://xmlns.com/foaf/0.1/>" + "PREFIX dc: <http://purl.org/dc/elements/1.1/>"
		+ "PREFIX dbr: <http://dbpedia.org/resource/>" + "PREFIX dbpedia2: <http://dbpedia.org/property/>"
		+ "PREFIX dbpedia: <http://dbpedia.org/>" + "PREFIX skos: <http://www.w3.org/2004/02/skos/core#>"
		+ "PREFIX dbo: <http://dbpedia.org/ontology/>" + 
		"CONSTRUCT {<"+selectdis1+"> ?p ?o} where {"
		+ "<"+selectdis1+"> ?p ?o BIND(datatype(?o) as ?dt) FILTER(IF(isliteral(?o) && !bound(?dt), langMatches(lang(?o),'en'), true))" +
"OPTIONAL{?o rdfs:label ?label . FILTER(langMatches(lang(?label),'en'))}}";

Query query = QueryFactory.create(queryString);
QueryExecution qexec = QueryExecutionFactory.sparqlService("http://dbpedia.org/sparql", query);


FileOutputStream oFile;
try {
	oFile = new FileOutputStream("output4.ttl", false);
	Model result21 = qexec.execConstruct();
	result21.write(oFile, "TTL");

} catch (FileNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
qexec.close();
FileManager.get().addLocatorClassLoader(jena.class.getClassLoader());
try {
    Model model=ModelFactory.createDefaultModel();
	model.read(new FileInputStream("output4.ttl"),null,"TTL");


StmtIterator iter = model.listStatements();
try {
	while (iter.hasNext()) {
		Statement stmt = iter.next();
		Resource s = stmt.getSubject();
		Resource p = stmt.getPredicate();
		RDFNode o = stmt.getObject();
	
		if(o.isLiteral())
		{
			listOfString.add(o.asLiteral().getLexicalForm());
			} 
		if(o.isURIResource() && !StringUtils.isBlank(o.asResource().getLocalName())){
			listOfString.add(o.asResource().getLocalName());
		}
		//else {System.out.println(o);}
		//System.out.println("");
	}
} finally {
	if (iter != null)
		iter.close();
}
} catch (FileNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


String queryString2 = "PREFIX owl: <http://www.w3.org/2002/07/owl#>"
		+ "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>"
		+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
		+ "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
		+ "PREFIX foaf: <http://xmlns.com/foaf/0.1/>" + "PREFIX dc: <http://purl.org/dc/elements/1.1/>"
		+ "PREFIX dbr: <http://dbpedia.org/resource/>" + "PREFIX dbpedia2: <http://dbpedia.org/property/>"
		+ "PREFIX dbpedia: <http://dbpedia.org/>" + "PREFIX skos: <http://www.w3.org/2004/02/skos/core#>"
		+ "PREFIX dbo: <http://dbpedia.org/ontology/>" + 
		"CONSTRUCT {<"+selectdis2+"> ?p ?o} where {"
		+ "<"+selectdis2+"> ?p ?o BIND(datatype(?o) as ?dt) FILTER(IF(isliteral(?o) && !bound(?dt), langMatches(lang(?o),'en'), true))" +
		"OPTIONAL{?o rdfs:label ?label . FILTER(langMatches(lang(?label),'en'))}}";

Query query2 = QueryFactory.create(queryString2);
QueryExecution qexec2 = QueryExecutionFactory.sparqlService("http://dbpedia.org/sparql", query2);


FileOutputStream oFile2;
try {
	oFile2 = new FileOutputStream("output5.ttl", false);
	Model result212 = qexec2.execConstruct();
	result212.write(oFile2, "TTL");

} catch (FileNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
qexec2.close();
FileManager.get().addLocatorClassLoader(jena.class.getClassLoader());
//Model model = FileManager.get().loadModel("output4.xml", null, "RDF/XML");
try {
    Model model2=ModelFactory.createDefaultModel();
	model2.read(new FileInputStream("output5.ttl"),null,"TTL");


StmtIterator iter2 = model2.listStatements();
try {
	while (iter2.hasNext()) {
		Statement stmt = iter2.next();
		Resource s = stmt.getSubject();
		Resource p = stmt.getPredicate();
		RDFNode o = stmt.getObject();
		//System.out.println(s.toString());
	//	System.out.println(p.toString());
	//	System.out.println(o.toString());
		//listOfString2.add(o.toString());
		if(o.isLiteral())
		{
			listOfString2.add(o.asLiteral().getLexicalForm());
			} 
		if(o.isURIResource() && !StringUtils.isBlank(o.asResource().getLocalName())){
			listOfString2.add(o.asResource().getLocalName());
		}
		//	System.out.println("");
	}
} finally {
	if (iter2 != null)
		iter2.close();
}
} catch (FileNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
listOfString.retainAll(listOfString2);
List<String> common = new ArrayList<String>(listOfString);
common.retainAll(listOfString2);
%>

<!-- Navigation -->
	<a id="menu-toggle" href="index.jsp" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars">Home</i></a>
	<nav id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<a id="menu-close" href="#"
			class="btn btn-light btn-lg pull-right toggle"><i
			class="fa fa-times"></i></a>
		<li class="sidebar-brand"><a href="#top" onclick=$("#menu-close").click();>EnSense</a>
		</li>
		<li><a href="#top" onclick=$("#menu-close").click();>Home</a></li>
		<li><a href="#about" onclick=$("#menu-close").click();>About</a>
		</li>
		<li><a href="#services" onclick=$("#menu-close").click();>Technologies
				Used</a></li>
		<li><a href="#portfolio" onclick=$("#menu-close").click();>Screenshots</a>
		</li>
		<li><a href="#contact" onclick=$("#menu-close").click();>Contact</a>
		</li>
	</ul>
	</nav>
	<header id="top" class="header"
		style="opacity: 0.9;filter: alpha(opacity=90);">

	<div class="text-vertical-center">

		</br> </br>
		<h3>Step 4- Relate</h3>
		<br> <br>

	<div id="mynetwork"></div>

	<script type="text/javascript">
  // create an array with nodes
  var nodes = new vis.DataSet([
    {id: 0, label: '<%out.print(selectdis1);%>'},
    {id: 1, label: '<%out.print(selectdis2);%>'},
    <% 
    for(int i=2;i<common.size();i++){
		out.println("{id: "+i+", label:'"+common.get(i)+"'},");

	}
    %>
    /* {id: 3, label: 'Node 3'},
  {id: 4, label: 'Node 4'},
    {id: 5, label: 'Node 5'} */
  ]);

  // create an array with edges
  var edges = new vis.DataSet([
                               <% 
                               for(int i=2;i<common.size();i++){
                       			out.println("{from: 0,to:"+i+"},");

                           	}
                               %>
                               <% 
                               for(int i=2;i<common.size();i++){
                       			out.println("{from: 1,to:"+i+"},");

                           	}
                               %>
//     {from: 1, to: 3},
//     {from: 1, to: 2},
//     {from: 2, to: 4},
//     {from: 2, to: 5}
  ]);

  // create a network
  var container = document.getElementById('mynetwork');
  var data = {
    nodes: nodes,
    edges: edges
  };
  var options = {}
  var network = new vis.Network(container, data, options);
  
</script>

</div>
</header>

</body>
</html>