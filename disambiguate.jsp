<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="example.DBpediaLookupClient"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="org.apache.commons.httpclient.HttpClient"%>
<%@ page import="org.apache.commons.httpclient.HttpException"%>
<%@ page import="org.apache.commons.httpclient.HttpMethod"%>
<%@ page import="org.apache.commons.httpclient.methods.GetMethod"%>
<%@ page import="org.xml.sax.Attributes"%>
<%@ page import="org.xml.sax.SAXException"%>
<%@ page import="org.xml.sax.helpers.DefaultHandler"%>
<%@ page import="javax.xml.parsers.SAXParser"%>
<%@ page import="javax.xml.parsers.SAXParserFactory"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
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

<style>
.overflow {
    width: 398px;
  
  margin: 0 0 0 0;
  
  /**
   * Required properties to achieve text-overflow
   */
      white-space: nowrap;
    overflow: hidden;
}
.ellipsis { overflow: auto; }
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
		<h3>Step 3- Disambiguate</h3>
		<br> <br>
		<form ACTION="relate.jsp" METHOD="POST" style="display:inline;">
		<table style="display: inline-table; text-align: left; border: 1px; width:400px;" border="1">
			<tr>

				<td>Recognized Image - 1</td>
			</tr>
			<%

		String selection= request.getParameter("userselection");
				try {
	        DBpediaLookupClient db = new DBpediaLookupClient (selection);
	        for(Map<String,String> var : db.variableBindings())
	        {

            	out.println("<tr><td>");
	            for(String bind: var.keySet())
	            {
	            	
	            	  if(bind=="URI"){
		                     out.println("<input type = \"radio\" name = \"dis1\" value=\"" + var.get(bind) + "\">"+var.get(bind)); 
		              out.println("<br>");

	            	  }
	 	         }
	 	     
	            for(String bind: var.keySet())
	            {
	            	   if(bind=="Description"){
	 	               out.println("<p class=\"overflow ellipsis\">"+var.get(bind)+"</p>");
	 	               }
	 	            
	        
	            }
	            out.println("<br>");
	        	out.println("</tr></td>");
	        }
	        List <Map<String,String>> var =db.variableBindings(); 
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
		%>


		</table>
		<table style="display: inline-table; text-align: left; border: 1px; width:400px;" border="1">
			<tr>

				<td>Recognized Image - 2</td>
			</tr>
			<%

		String selection2= request.getParameter("userselection2");
				try {
	        DBpediaLookupClient db = new DBpediaLookupClient (selection2);
	        for(Map<String,String> var : db.variableBindings())
	        {

            	out.println("<tr><td>");
	            for(String bind: var.keySet())
	            {
	            	
	            	  if(bind=="URI"){
		                     out.println("<input type = \"radio\" name = \"dis2\" value=\"" + var.get(bind) + "\">"+var.get(bind)); 
		              out.println("<br>");

	            	  }
	 	         }
	 	     
	            for(String bind: var.keySet())
	            {
	            	   if(bind=="Description"){
	 	               out.println("<p class=\"overflow ellipsis\">"+var.get(bind)+"</p>");
	 	               }
	 	            
	        
	            }
	            out.println("<br>");
	        	out.println("</tr></td>");
	        }
	        List <Map<String,String>> var =db.variableBindings(); 
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
		%>


		</table>
			<INPUT TYPE="SUBMIT" value="Submit" class="btn btn-dark btn-lg">

			</form>
	</div>
	</header>
	

</body>
</html>