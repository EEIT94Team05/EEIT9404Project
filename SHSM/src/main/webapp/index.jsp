<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Map</title>
<style>
	#map{
		height:100%;
	}
	html,body{
		height:100%;
		margin:0;
		padding:0;
	}
</style>
</head>
<body>
	<div id="map"></div>
	
	<script>
	var map;
	function initMap(){
		map=new google.maps.Map(document.getElementById('map'),{
				center:{lat:-34.397,lng:150.644},
				zoom:10
				});
	}
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBhl0-jqVW9O6osIL3tKw7Qo8_qjvbxH0&callback=initMap" 
	async defer></script>
</body>
</html>