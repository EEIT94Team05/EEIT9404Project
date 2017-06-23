<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Google Maps JavaScript API Example</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyDyRk2QLNN4DSoTEnn2jrn8iFhsC6R9nlw" type="text/javascript"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    $(function () {
    	if (GBrowserIsCompatible()) {
             myMap = new GMap2(document.getElementById("my_map"));
            //搭配下方setcenter使用
             myLatLng = new GLatLng(25.04763902653048, 121.51715755462646);
            //決定你 Google 地圖的中心點位置和縮放大小
            myMap.setCenter(myLatLng, 14);
            //設定要顯示的控制項
            myMap.addControl(new GLargeMapControl());
            myMap.addControl(new GMapTypeControl());
    	}
    	$.getJSON("casesearch.controller",function(data){  
    	var i=0;	
   		 while(i<data.length){
   		 addresstolatlng(data[i].repaircase_address);
   		 i++
    	}
   		 });  
    	
        //載入後動作
        $("#divId").hide();
        $(function() {
            $("div").on("click", function() {
                $("#divId").show().css({
                    position: "absolute",
                    top: event.pageY,
                    left: event.pageX
                });
                $("#divId").mouseleave(function() {
                    $("#divId").hide();
                });
            });
        });
        /*<!--地圖標點-->*/
        

    });
    function addresstolatlng(address){
    	var lat;
    	var lng;
		var geocoder = new google.maps.Geocoder();
		 geocoder.geocode({
	            'address': address
	        }, function(results, status) {
	            if (status == google.maps.GeocoderStatus.OK) {

	            	lat=results[0].geometry.location.lat();
	            	lng=results[0].geometry.location.lng();
	            	
	                    /*
	                    Google Maps API 內建四種控制項：

	                    GLargeMapControl : 適合給大型地圖的控制項。
	                    GSmallMapControl : 適合給小型地圖的控制項。
	                    GSmallZoomControl : 只有 Zoom Level 的調整，沒有地圖移動控制。
	                    GMapTypeControl : 顯示地圖型態切換的控制項。
	                    */
	                    //設定座標值：var myMarker = new GMarker( 30 行 );
	                    var myMarker = new GMarker(myLatLng);
	                    //在地圖上放置標點 :myMap.addOverlay( 45 行 );
	                    myMap.addOverlay(myMarker);
// 	                    var point1 = new GPoint(121.516900, 25.047795);
// 	                    var marker1 = new GMarker(point1);
// 	                    myMap.addOverlay(marker1);

// 	                    var point2 = new GPoint(121.521481, 25.034730);
// 	                    var marker2 = new GMarker(point2);
// 	                    myMap.addOverlay(marker2);

// 	                    var point3 = new GPoint(121.237371, 25.081479);
// 	                    var marker3 = new GMarker(point3);
	                    
// 	                    myMap.addOverlay(marker3);
	                    
// 	                    console.log(lat+","+lng);
	                    createNode(lat,lng,myMap);
	                    
	                    
	                    GEvent.addListener(myMap, "click", function(overlay, point) {
	                        if (point) {
								//設定標註座標 把point 轉成 字串 存放到 id = inLatLng  的 input/text 內
	                            myMarker.setLatLng(point);
	                            document.getElementById('inLatLng').value = point.toString();
	                            
	                            var myGeocoder = new GClientGeocoder();

	                            myGeocoder.getLocations(point, function(addresses) {
	                                if (addresses.Status.code != 200) {
// 	                                    alert("此處為機密地段" + point.toUrlValue());
	                                } else {
	                                    var result = addresses.Placemark[0];
	                                    var add = result.address;
	                                    //
	                                    console.log(result.address);
	                                    var contextPath = "${pageContext.request.contextPath}";
	                                    var request = new XMLHttpRequest();
	                                    request.open("POST", contextPath+"/map/mapframe.jsp");
	                                    request.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
	                                    request.send(add);
	                                    //
	                                    
	                                    myMarker.openInfoWindowHtml(result.address);
	                                    document.getElementById('inLatLng').value = result.address;
	                                }
	                            });
	                        }
	                    });
	                
	            } else {
	                alert("失敗, 原因: " + status);
	            }
	        }
	        );
		} ;
		function createNode(lat,lng,myMap){
			var point4 = new GPoint(lng, lat);
            var marker4 = new GMarker(point4);
            
            myMap.addOverlay(marker4);
		}
//     function codeAddress() {
//         var address = document.getElementById("address").value;
//         geocoder.geocode({
//             'address': address
//         }, function(results, status) {
//             if (status == google.maps.GeocoderStatus.OK) {
//                 map.setCenter(results[0].geometry.location);

//                 document.getElementById("lat").value = results[0].geometry.location.lat();
//                 document.getElementById("lng").value = results[0].geometry.location.lng();
//                 var marker = new google.maps.Marker({
//                     map: map,
//                     position: results[0].geometry.location
//                 });

//                 showAddress(results[0], marker);
//             } else {
//                 alert("失敗, 原因: " + status);
//             }
//         });
//     }

//     function showAddress(result, marker) {
//         var popupContent = result.formatted_address;
//         popup.setContent(popupContent);
//         popup.open(map, marker);
//     }
    </script>
</head>
<body >
    <input id="inLatLng" name="inLatLng" type="text" size="40" value="" />

    <div id="my_map" style="width: 1520px; height: 600px"></div>
    <!--顯示進階選項按鈕-->
    <div id="divId">
        <img src="img/a.png">
        <button id="test"><a href="createcase.jsp">新增案件</a></button>
        <button id="test">編輯</button>
        <button id="test">刪除案件</button>
    </div>

</body>

</html>