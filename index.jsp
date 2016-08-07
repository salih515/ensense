<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="example.Test2"%>
<!--        @page import=com.hp.hpl.jena.rdf.model.Model;
    
    @page import=com.hp.hpl.jena.rdf.model.RDFNode;
    @page import=com.hp.hpl.jena.rdf.model.Resource;
    @page import=com.hp.hpl.jena.rdf.model.Statement;
    @page import=com.hp.hpl.jena.rdf.model.StmtIterator;
    @page import=com.hp.hpl.jena.util.FileManager;
    
     -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>EnSense</title>
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<!-- <style>
* {
	margin: 0;
	padding: 0;
}

html {
	background: url(images/bg.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
body{
opacity:50%;
}
.btn-class{
 display: inline-block;
 border:1px solid #bfbfbf;
 color: #8c8c8c;
 border-radius: 5px 5px 5px 5px;
 -webkit-border-radius: 5px 5px 5px 5px;
 -moz-border-radius: 5px 5px 5px 5px;
 font-family: Verdana;
 width: auto;
 height: auto;
 font-size: 16px;
 padding: 10px 31px;
 cursor:pointer;
 box-shadow: inset 0 1px 0 0 #fff,inset 0 -1px 0 0 #d9d9d9,inset 0 0 0 1px #f2f2f2,0 2px 4px 0 #f2f2f2;
 -moz-box-shadow: inset 0 1px 0 0 #fff,inset 0 -1px 0 0 #d9d9d9,inset 0 0 0 1px #f2f2f2,0 2px 4px 0 #f2f2f2;
 -webkit-box-shadow: inset 0 1px 0 0 #fff,inset 0 -1px 0 0 #d9d9d9,inset 0 0 0 1px #f2f2f2,0 2px 4px 0 #f2f2f2;
 text-shadow: 0 1px 0 #fff;
 background-image: linear-gradient(to top, #f2f2f2, #f2f2f2);
 background-color: #f2f2f2;
}
.btn-class:hover, .btn-class:active{
 border:1px solid #8c8c8c;
 color: #8c8c8c;
 box-shadow: inset 0 1px 0 0 #ffffff,inset 0 -1px 0 0 #d9d9d9,inset 0 0 0 1px #f2f2f2;
 -moz-box-shadow: inset 0 1px 0 0 #ffffff,inset 0 -1px 0 0 #d9d9d9,inset 0 0 0 1px #f2f2f2;
 -webkit-box-shadow: inset 0 1px 0 0 #ffffff,inset 0 -1px 0 0 #d9d9d9,inset 0 0 0 1px #f2f2f2;
 background-color: #f2f2f2;
}
body{
    font-family: Helvetica, sans-serif;
    font-size: 14px;

}
#page-wrap {
	width: 400px;
	margin: 50px auto;
	padding: 20px;
	background: white;
	-moz-box-shadow: 0 0 20px black;
	-webkit-box-shadow: 0 0 20px black;
	box-shadow: 0 0 20px black;
}

p {
	font: 14px/2;
	font-family: Helvetica, sans-serif;
	
	margin: 0 0 30px 0;
	text-indent: 40px;
}

.progress {
	position: relative;
	width: 400px;
	border: 1px solid #ddd;
	padding: 1px;
	border-radius: 3px;
}

.bar {
	background-color: #B4F5B4;
	width: 0%;
	height: 20px;
	border-radius: 3px;
}

.percent {
	position: absolute;
	display: inline-block;
	top: 3px;
	left: 48%;
}
</style> -->
</head>
<body>

<%-- 
	<center>
	</br>
	</br>
		<h1>EnSense - A Commonality Checker between Semantic Entities</h1>
		<div id="page-wrap">
			Select two images to upload and find commonalities between them: <br />
			<form action="UploadServlet" method="post"
				enctype="multipart/form-data" name="form1" id="form1">

				<table border="1">

<!-- 					<tr> -->
<!-- 						<td align="center"><b>Multiple file Upload</b></td> -->
<!-- 					</tr> -->
					<tr>

						<td><center>
								Select image1: <input name="file" type="file" id="file" class="btn-class">
							</center></td>

					</tr>

					<tr>
						<td><center>
								Select image2: <input name="file" type="file" id="file" class="btn-class">
							</center></td>
					</tr>
					<tr>
						<td align="center" style="margin-top: 5px;"><input
							type="submit" name="Submit" value="Submit files" class="btn-class"/></td>
					</tr>

				</table>

			</form>
			<!-- <div class="progress">
				<div class="bar"></div>
				<div class="percent">0%</div>
			</div>

			<div id="status"></div>

			<script
				src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
			<script src="http://malsup.github.com/jquery.form.js"></script>
			<script>
				(function() {
				    
				var bar = $('.bar');
				var percent = $('.percent');
				var status = $('#status');
				   
				$('form').ajaxForm({
				    beforeSend: function() {
				        status.empty();
				        var percentVal = '0%';
				        bar.width(percentVal)
				        percent.html(percentVal);
				    },
				    uploadProgress: function(event, position, total, percentComplete) {
				        var percentVal = percentComplete + '%';
				        bar.width(percentVal)
				        percent.html(percentVal);
						//console.log(percentVal, position, total);
				    },
				    success: function() {
				        var percentVal = '100%';
				        bar.width(percentVal)
				        percent.html(percentVal);
				    },
					complete: function(xhr) {
						status.html(xhr.responseText);
					}
				}); 
				
				})();       
			</script> -->
		</div>
	</center>
 --%>
 
 
    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
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

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
        
            <h1>EnSense</h1>
            <h3>A Commonality Checker between Semantic Entities</h3>
            <br>
          
            
           <div style="display:inline;">
            <form action="UploadServlet" method="post"
				enctype="multipart/form-data" name="form1" id="form1" style="text-align:center;display:inline;">

				<table border="1" style="text-align:center; display:inline-table;">

<!-- 					<tr> -->
<!-- 						<td align="center"><b>Multiple file Upload</b></td> -->
<!-- 					</tr> -->
					<tr>

						<td><center>
								Select Image1: <input name="file" type="file" id="file" class="btn btn-dark btn-lg12">
							</center></td>

					</tr>

					<tr>
						<td><center>
								Select Image2: <input name="file" type="file" id="file" class="btn btn-dark btn-lg12">
							</center></td>
					</tr>
					<tr>
						<td align="center" style="margin-top: 5px;"></td>
					</tr>

				</table>

		
			<br>
			<br>
			<input type="submit" name="Submit" value="Submit Images" class="btn btn-dark btn-lg"/>
<!--             <a href="#about" class="btn btn-dark btn-lg">More Information</a> -->
			
			
			</form>
					
			<br>
			<br>
			 </div>
			 
			 
			 
			 
			 
			 
			 <div style="display:inline;">
            <form action="UploadServlet" method="post"
				enctype="multipart/form-data" name="form1" id="form1" style="text-align:center;display:inline;">

				<table border="1" style="text-align:center; display:inline-table;">

<!-- 					<tr> -->
<!-- 						<td align="center"><b>Multiple file Upload</b></td> -->
<!-- 					</tr> -->
					<tr>

						<td><center>
								Type Tag1: <input name="file" type="text" id="text" class="btn btn-dark btn-lg12">
							</center></td>

					</tr>

					<tr>
						<td><center>
								Type Tag2: <input name="file" type="text" id="text" class="btn btn-dark btn-lg12">
							</center></td>
					</tr>
					<tr>
						<td align="center" style="margin-top: 5px;"></td>
					</tr>

				</table>

		
			<br>
			<br>
			<input type="submit" name="Submit" value="Submit Tags" class="btn btn-dark btn-lg"/>
<!--             <a href="#about" class="btn btn-dark btn-lg">More Information</a> -->
			</form>
					
			
			 </div>
			 
			 
			 
				
<!-- 							        <h1 style="display:inline;">OR</h1> -->
				
		</div>
        
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
                    <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>EnSense Uses</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-cloud fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Imgur</strong>
                                </h4>
                                <p>Uses Imagur, a reliable image hosting service to upload the user images anonymously. </p>
                                <a href="http://imagga.com/" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-compass fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Jena</strong>
                                </h4>
                                <p>Uses Jena, a Java library for manipulating semantic RDFS, parsing RDF/XML, and storage.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-flask fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Imagga</strong>
                                </h4>
                                <p>Uses Imagga, one of the most effective image recognition API to provide a list of possible image tags.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-shield fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Bootstrap</strong>
                                </h4>
                                <p>Uses Bootstrap, a framework for providing mobile access to the EnSense website.</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center">
            <h1>Using Semantic Web Technology</h1>
        </div>
    </aside>

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2>Our Work</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-1.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-2.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-3.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="img/portfolio-4.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>Go on try it out.</h3>
                    <a href="#top" class="btn btn-lg btn-light">Try EnSense</a>
<!--                     <a href="#" class="btn btn-lg btn-dark">Look at Me!</a> -->
                </div>
            </div>
        </div>
    </aside>

    <!-- Map -->
    <section id="contact" class="map">
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
        <br />
        <small>
            <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
        </small>
        </iframe>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>EnSense</strong>
                    </h4>
                    <!-- <p>3481 Melrose Place
                        <br>Beverly Hills, CA 90210</p> -->
                    <ul class="list-unstyled">
<!--                         <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li> -->
                        <li><i class="fa fa-envelope-o fa-fw"></i> <a href="mailto:name@example.com">si8@hw.ac.uk</a>
                        </li>
                    </ul>
               <!--      <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul> -->
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; EnSense 2016</p>
                </div>
            </div>
        </div>
        <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    //#to-top button appears after scrolling
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                // $('#to-top').css({position:'fixed', display:'block'});
                $('#to-top').show("slow", function() {
                    $('#to-top').css({
                        position: 'fixed',
                        display: 'block'
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $('#to-top').hide("slow", function() {
                    $('#to-top').css({
                        display: 'none'
                    });
                });
            }
        }
    });
    // Disable Google Maps scrolling
    // See http://stackoverflow.com/a/25904582/1607849
    // Disable scroll zooming and bind back the click event
    var onMapMouseleaveHandler = function(event) {
        var that = $(this);
        that.on('click', onMapClickHandler);
        that.off('mouseleave', onMapMouseleaveHandler);
        that.find('iframe').css("pointer-events", "none");
    }
    var onMapClickHandler = function(event) {
            var that = $(this);
            // Disable the click handler until the user leaves the map area
            that.off('click', onMapClickHandler);
            // Enable scrolling zoom
            that.find('iframe').css("pointer-events", "auto");
            // Handle the mouse leave event
            that.on('mouseleave', onMapMouseleaveHandler);
        }
        // Enable map zooming with mouse scroll when the user clicks the map
    $('.map').on('click', onMapClickHandler);
    </script>

 </body>
</html>
