<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" 
         import="wea5.shop.warehouse.ArticleData"
         import="java.util.*" %>
<jsp:include page="header.jsp" flush="true" />

<script type="text/javascript">

	function getXMLHttpRequest() {
		var http_request;
		if (window.XMLHttpRequest) { // Mozilla, Safari, ...
	    	http_request = new XMLHttpRequest();
		} 
		else if (window.ActiveXObject) { // IE
		    try {
		        http_request = new ActiveXObject("Msxml2.XMLHTTP");
		    } catch (e) {
		        try {
		            http_request = new ActiveXObject("Microsoft.XMLHTTP");
		        } catch (e) {}
		    }
		}
		return http_request;
	}
		
	function doRequestArticle(id) {
		http_request = getXMLHttpRequest();
		http_request.onreadystatechange = displayArticleDetail;
		http_request.open('GET', '/<%=application.getServletContextName() %>/BookShopXML?id='+id, true);
		http_request.send(null);
	}
	
	function displayArticleDetail() {
		var disp = document.getElementById('articledetail');
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
            	var xmldoc = http_request.responseXML;

            	if (xmldoc.getElementsByTagName('title').item(0) == null) 
            		alert('Fehler: der Artikel wurde nicht gefunden!');

            	var title = xmldoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
            	var author = xmldoc.getElementsByTagName("author")[0].childNodes[0].nodeValue;
            	var year = xmldoc.getElementsByTagName("year")[0].childNodes[0].nodeValue;
            	var publisher = xmldoc.getElementsByTagName("publisher")[0].childNodes[0].nodeValue;
            		
            	disp.innerHTML =  '<h1>' + title + '</h1>';
            	disp.innerHTML += '<p>' + author + '; ' + publisher + '(' + year + ')</p>';  
            } else {
                alert('Bei dem Request ist ein Problem aufgetreten.');
            }
        }	
	}
//
</script>

<h3>Article Overview</h3>

<table BGCOLOR="#C6EFF7" cellpadding="1">
<tr><th>Title</th><th>Price</th><th>buy</th></tr>
<%
Collection<ArticleData> articles  = (Collection<ArticleData>) request.getAttribute("articles");
for (Iterator it=articles.iterator(); it.hasNext();) { 
	ArticleData article = (ArticleData) it.next(); 
	%>
      <tr>
         <td><%= article.getTitle() %></td>
         <td><%=article.getPrice() %></td>
         <td><a href="/<%=application.getServletContextName() %>/BookShop?cmd=Addtocart&articleid=<%=article.getId() %>">buy</a></td>
      </tr>
	<% 
} 
%> 
</table>


<!-- -- WITH AJAX -- -->

<h3>Article Overview</h3>
<table BGCOLOR="#C6DFF7">
	<tr>
		<th>Title</th>
		<th>Price</th>
		<th>Buy</th>
	</tr>
	<c:forEach var="i" items="${articles}">
		<tr>
			<td><a href="javascript:doRequestArticle(${i.id})">${i.title}</a></td>
			<td>${i.price}</td>
			<td><a href="BookShop?cmd=Addtocart&articleid=${i.id}">buy</a></td>
		</tr>
	</c:forEach>

</table>
<hr noshade="noshade"/>
<div id="articledetail"></div>

<br />


<jsp:include page="footer.jsp" flush="true" />

