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

	<p>
	<input type="text" id="address" size="25">
	<input type="button" value="Geocode" id="submit" onClick="geocodeAddress(geocoder, resultsMap)">
	</p>
	<div id="map"></div>
	
	<script>
	
	var map;
	var geocoder;
	function initMap(){
		map=new google.maps.Map(document.getElementById('map'),{
				center:{lat:25.1023554,lng:121.54849250000007},
				zoom:10
				});
		geocoder=new google.maps.Geocoder();
		
		document.getElementById('submit').addEventListener('click',function(){
			geocodeAddress(geocoder,map);
		});
	}
	var resultsMap;
	function geocodeAddress(geocoder, resultsMap){
		var address=document.getElementById('address').value;
		geocoder.geocode({'address':address},function(results,status){
			if(status==google.maps.GeocoderStatus.OK){
				resultsMap.setCenter(results[0].geometry.location);
				var marker=new google.maps.Marker({
					map:resultsMap,
					position:results[0].geometry.location
				});
			}else{
				alert('error');
			}
		});
	}
	

	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCBhl0-jqVW9O6osIL3tKw7Qo8_qjvbxH0&callback=initMap" 
	async defer></script>
	

</body>
</html>
