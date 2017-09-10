<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="top.css">
<title>Top stats</title>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/jquery.dataTables.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});

	$(document).ready(function() {
		$('#s0').dataTable({
			"sDom" : 't<"text-center"p>',
			"bFilter": false,
			"bLengthChange" : false,
			"iDisplayLength" : 60,
			"aaSorting" : [ [ 1, "desc" ] ],
			"aoColumns" : [ 
			null, /* Date */
			null, /* Type */
			null, /* eu */
			null, /* us */
			null, /* kr */
			null, /* tw */
			{"bSearchable" : false,"bVisible" : false},/* last */
			]
		});
	});

	$(document).ready(function() {
		$('#add').on('submit', function() {

			// je récupère les valeurs
			var tag = $('#bTagIn').val();
			// appel Ajax
			$.ajax({
				url : $(this).attr('action'), // le nom du fichier indiqu� dans le formulaire
				type : $(this).attr('method'), // la méthode indiquée dans le formulaire (get ou post)
				data : $(this).serialize(), // je s�rialise les données (voir plus loin), ici les $_POST
				success : function(html) { // je récupère la réponse
					$('#labelContainer').html(html);
				}
			});
			return false; // no post
		});
	});
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
 
  ga('create', 'UA-46712970-1', 'diablo3stats.appspot.com');
  ga('send', 'pageview');
 
</script>
</head>
<body style="max-width:1024px;">
	<div id="tabs" style="float: left;">
		<ul>
			<li><a href="#tabs-1">VSOP</a></li>
		</ul>
		<div id="profiles" style="background:#FA5858;border-radius: 5px;font-size: 9px;color: white;text-align: center;padding:5px;font-weight:bold;text-shadow: 0pt 1px 2px rgba(0, 0, 0, 0.4);">Current ${season}</div>
		<div id="tabs-1">
			<div >

				<table id="s0" class="display dataTable"
					align="center">
					<thead>
						<TR>
							<TH>Name / FirstName</TH>
							<TH>Rank</TH>
					</thead>
					<c:forEach var="player" items="${players}">
						<TR class="gradeX">
							<TD class="center">${player.name}</TD>
							<TD class="center">${player.firstName}</TD>
							<TD class="center">${player.rank.name}</TD>
						</TR>
					</c:forEach>
				</table>
				<br/>			
			</div>
			<div id="footer" style="margin-top: 25px;font-size: 9px;text-align: center;vertical-align: middle;border-radius: 10px;">
  				<p><a style="text-decoration:none;cursor:pointer;"  href="mailto:Christophe.lechenne@gmail.com">Contact me</a>.</p>
  			</div>
		</div>
	</div>
	
</body>
</html>