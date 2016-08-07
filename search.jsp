<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="item">
  <b>Insert title here</b>
  <div>Insert description here</div>
</div>
<div class="item">
  <b>Insert title here</b>
  <div>Insert description here</div>
</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
function _set_html_from_dbpedia_description(selector, search_for) {
  $.ajax({
    url: "http://lookup.dbpedia.org/api/search/KeywordSearch",
    data: {
      "QueryString" : 'cristiano',
      "MaxHits" : 1,},
    dataType: 'json',
    success: function( response ) {
      if ( response.results[0] ) {
        $( selector ).html(response.results[0].description + " <i>[Source: Wikipedia]</i>");
      };
    },
    timeout: 2500,
  });
}
var data = [{"label" : "Cristiano", "desc" : "An organization"}, 
            {"label" : "SEPA" } //No desc!
           ];
$( ".item" ).each( function(index, dom_elem) {
  var item = data[index];
  $ ( dom_elem ).find( "b" ).text( item.label );
  if ( item.desc ) {
    $ ( dom_elem ).find( "div" ).text( item.desc );
  } else {
    _set_html_from_dbpedia_description( $ ( dom_elem ).find( "div" ), item.label );
  }
})  
</script>

</body>
</html>