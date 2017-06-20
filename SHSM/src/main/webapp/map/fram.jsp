<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Google Maps JavaScript API Example</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAG_4i2swR3KOd-nGYrlrt8RTkyS8SRe_kYPTAbwTumvAqao01PRRUcCtCzTBnNH2kRURGR8RhQQoZ3w" type="text/javascript"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    /*<!--地圖標點-->*/

    function load() {

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

        if (GBrowserIsCompatible()) {
            var myMap = new GMap2(document.getElementById("my_map"));
            var myLatLng = new GLatLng(25.04763902653048, 121.51715755462646);
            myMap.setCenter(myLatLng, 14);
            myMap.addControl(new GLargeMapControl());

            var myMarker = new GMarker(myLatLng);
            myMap.addOverlay(myMarker);

            GEvent.addListener(myMap, "click", function(overlay, point) {
                if (point) {
                    //設定標註座標
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
        /*
        var strLatLng = document.getElementById('inLatLng').value;
        strLatLng = strLatLng.replace("(", "[");
        strLatLng = strLatLng.replace(")", "]");
        var arrLatLng = eval(strLatLng);
        
        var myLatLng = new GLatLng(arrLatLng[0], arrLatLng[1]);
        //移動地圖中心點
        myMap.panTo(myLatLng);
        */

    }

    function getAddress() {

    }
    </script>
</head>

<body onload="load()" onunload="GUnload()">
    <input id="inLatLng" name="inLatLng" type="text" size="40" value="" />
    <input id="inLatLng" name="inLatLng" type="text" size="40" value="" />
    <div id="my_map" style="width: 1400px; height: 1200px"></div>
    <!--顯示進階選項按鈕-->
    <div id="divId">

        <img src="img/a.png">
        <button id="test"><a href="createcase.jsp">新增案件</a></button>
        <button id="test">編輯</button>
        <button id="test">刪除案件</button>
    </div>
</body>

</html>
