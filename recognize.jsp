<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="example.UploadServlet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EnSense</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

</head>
<body>
 <!-- Navigation -->
    <a id="menu-toggle" href="index.jsp" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars">Home</i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top" onclick=$("#menu-close").click();>EnSense</a>
            </li>
            <li>
                <a href="#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            <li>
                <a href="#about" onclick=$("#menu-close").click();>About</a>
            </li>
            <li>
                <a href="#services" onclick=$("#menu-close").click();>Technologies Used</a>
            </li>
            <li>
                <a href="#portfolio" onclick=$("#menu-close").click();>Screenshots</a>
            </li>
            <li>
                <a href="#contact" onclick=$("#menu-close").click();>Contact</a>
            </li>
        </ul>
    </nav>
 <header id="top" class="header" style="opacity: 0.9;filter: alpha(opacity=90);">
 
        <div class="text-vertical-center">

		</br> </br>
		<h3>Step 2- Recognize</h3>
		<br><br>
			<form ACTION="disambiguate.jsp" METHOD="POST" style="display:inline;">


				<%
					
					UploadServlet tc = new UploadServlet();

					ArrayList<String> a = (ArrayList<String>) request.getAttribute("List");
					ArrayList<String> b = (ArrayList<String>) request.getAttribute("List2");
					String img11 = (String) request.getAttribute("img1");
					String img22 = (String) request.getAttribute("img2");

					//out.println(a.size());
					//out.println(b.size());

					//out.print(a);
					//  out.println("<input type = \"radio\" name = \"userselection\" value=\"Paris\">Paris");
					//out.println("<input type = \"radio\" name = \"userselection2\" value=\"Dubai\">Dubai");
				%>


<!-- 				<div style="float: left;"> -->
					<table style="display:inline-table;text-align:left;border:1px;" border="1">

						<tr>
							<th rowspan="2">
								<%
									out.println("<img src=\"" + img11 + "\" height='280px' width='190px'>");
								%>
							</th>
							<td>
								<%
									for (int i = 0; i < 10; i++) {
										out.println(
												"<input type = \"radio\" name = \"userselection\" value=\"" + (a.get(i)) + "\">" + (a.get(i)));
										out.println("<br>");
									}
								%>
							</td>
						</tr>
					</table>

<!-- 				</div> -->
<!-- 				<div style="float: right;"> -->
					<table style="display:inline-table;text-align:left;"  border="1">

						<tr>
							<th rowspan="2">
								<%
									out.println("<img src=\"" + img22 + "\" height='280px' width='190px'>");
								%>
							</th>
							<td>
								<%
									for (int i = 0; i < 10; i++)

									{

										out.println(
												"<input type = \"radio\" name = \"userselection2\" value=\"" + (b.get(i)) + "\">" + (b.get(i)));
										out.println("<br>");

									}
								%>
							</td>
						</tr>
					</table>
<!-- 				</div> -->
<br>
				<INPUT TYPE="SUBMIT" value="Submit" class="btn btn-dark btn-lg">

			</form>
		  </div>
    </header>
	</center>
</body>
</html>