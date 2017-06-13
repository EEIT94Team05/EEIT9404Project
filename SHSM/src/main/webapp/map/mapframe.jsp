<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Google Maps JavaScript API Example</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyAANfy7yVHE2MHmM2z_Rxm3YmXosQAT6b8" type="text/javascript"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    function load() {
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
        if (GBrowserIsCompatible()) {
            var myMap = new GMap2(document.getElementById("my_map"));
            //搭配下方setcenter使用
            var myLatLng = new GLatLng(25.04763902653048, 121.51715755462646);
            //決定你 Google 地圖的中心點位置和縮放大小
            myMap.setCenter(myLatLng, 14);
            //設定要顯示的控制項
            myMap.addControl(new GLargeMapControl());
            myMap.addControl(new GMapTypeControl());
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

            GEvent.addListener(myMap, "click", function(overlay, point) {
                if (point) {

                    //設定標註座標 把point 轉成 字串 存放到 id = inLatLng  的 input/text 內
                    myMarker.setLatLng(point);
                    document.getElementById('inLatLng').value = point.toString();
                    var myGeocoder = new GClientGeocoder();

                    myGeocoder.getLocations(point, function(addresses) {
                        if (addresses.Status.code != 200) {
                            alert("此處為機密地段" + point.toUrlValue());
                        } else {
                            var result = addresses.Placemark[0];
                            myMarker.openInfoWindowHtml(result.address);
                            document.getElementById('inLatLng').value = result.address;
                        }
                    });
                }
            });
        }

    }

    function codeAddress() {
        var address = document.getElementById("address").value;
        geocoder.geocode({
            'address': address
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);

                document.getElementById("lat").value = results[0].geometry.location.lat();
                document.getElementById("lng").value = results[0].geometry.location.lng();
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

                showAddress(results[0], marker);
            } else {
                alert("失敗, 原因: " + status);
            }
        });
    }

    function showAddress(result, marker) {
        var popupContent = result.formatted_address;
        popup.setContent(popupContent);
        popup.open(map, marker);
    }
    </script>
</head>
<body onload="load()">
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