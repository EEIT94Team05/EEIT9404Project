<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Google Maps JavaScript API Example</title>
<script
	src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyDyRk2QLNN4DSoTEnn2jrn8iFhsC6R9nlw"
	type="text/javascript"></script>


<link href="css/pushy-buttons.min.css" rel="stylesheet">
<link
	href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>
<style>
.title {
	height: 25px;
	padding-left: 10px;
	font-family: 微軟正黑體;
	font-size: 16px;
	outline: none;
}

.container {
	width: 600px;
	margin: 30px auto;
}

.container div {
	margin-bottom: 20px;
}

a, a:focus {
	outline: none;
}
</style>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/jquery.session.js"></script>
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
	   		 i++;
	   		 }
	    })
		//載入後動作
		$("#divId").hide();
		$(function() {
			$("div").on("click", function() {
				$("#divId").show().css({
					position : "absolute",
					top : event.pageY,
					left : event.pageX
				});
				$("#divId").mouseleave(function() {
					$("#divId").hide();
				});
			});
		});
		})
		function createNode(lat,lng,myMap){
			var point = new GPoint(lng, lat);
            var marker = new GMarker(point);
            
            myMap.addOverlay(marker);
		}
		/*<!--地圖標點-->*/
		function addresstolatlng(address){
    	var lat;
    	var lng;
		var geocoder = new google.maps.Geocoder();
		 geocoder.geocode({'address': address}, function(results, status) {
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
			createNode(lat,lng,myMap);

			GEvent.addListener(	myMap,"click",
				function(overlay, point) {
					if (point) {
						//設定標註座標 把point 轉成 字串 存放到 id = inLatLng  的 input/text 內
						myMarker.setLatLng(point);
						document.getElementById('inLatLng','getpoint').value = point.toString();
						var myGeocoder = new GClientGeocoder();

						myGeocoder.getLocations(point,function(addresses) {
									if (addresses.Status.code != 200) {
// 										alert("此處為機密地段"+ point.toUrlValue());
								
									} else {
										var result = addresses.Placemark[0];
	                                    var add = result.address;
	                                    
	                                    console.log(add);
	                                    $('input[name="caseaddress"]').val(add);
	                                    
										myMarker.openInfoWindowHtml(result.address);
										document.getElementById(
											'inLatLng','getpoint').value = result.address;
									}
						})
					}
				})
	           		 }
				 }
			 )
		 }
		 
	
</script>
</head>

<body>
	<div id="my_map" style="width: 100%; height: 600px"></div>
	<div style="margin: 6px 0 6px 50px">
		<input id="inLatLng" name="inLatLng" type="text" size="40" value="" />
		<span>點擊左鍵並選取新增案件</span>
	</div>
	<!--顯示進階選項按鈕-->
	<div class="container">
		<!-- modal examples -->
		<div class="modExample">
			<a href="#myModal1" role="button" data-target="#myModal1"
				class="btn btn-default" data-toggle="modal" id="divId">新增案件</a>
			<div id="myModal1" class="modal" data-easein="fadeIn" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="title" id="myModalLabel">新增案件</h4>
							</center>
						</div>
						<div class="modal-body">
							<!--內文-->
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="name" class="col-sm-4 control-label"> <font
										color="#FF0000">*</font>案件種類
									</label>
									<div class="row">
										<div class="col-xs-6">
											<select class="selectpicker" style="margin: 0 0 0 10px">
												<option>水電類</option>
												<option>電氣類</option>
												<option>建築類</option>
												<option>家用類</option>
												<option>汽機車類</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label"> <font
										color="#FF0000">*</font>案件標題
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="firstname"
											placeholder="請輸入標題">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label"> <font
										color="#FF0000">*</font>地址
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="firstname" name="caseaddress"
											placeholder="请輸入地址" id="getpoint">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label"> <font
										color="#FF0000">*</font>維修日期
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="firstname"
											placeholder="请輸入日期">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label"> <font
										color="#FF0000">*</font>維修地點
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="firstname"
											placeholder="请輸入地點">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">照片上傳</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="firstname"
											placeholder="照片上傳">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">影片上傳</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="firstname"
											placeholder="影片上傳">
									</div>
								</div>
								<div class="input-group" style="margin: 0 0 0 30px">
									<textarea placeholder="請輸入詳細說明" id="comment" name="comment"
										cols="45" rows="3" maxlength="65525" aria-required="true"
										required="required"></textarea>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-8 col-sm-10">
										<button type="submit" class="btn btn-default">送出新增</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"
						type="text/javascript"></script>
					<script>
						window.jQuery
								|| document
										.write('<script src="js/jquery-1.11.0.min.js"><\/script>')
					</script>
					<script
						src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
					<script
						src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.2/velocity.min.js'></script>
					<script
						src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.2/velocity.ui.min.js'></script>
					<script type="text/javascript">
						// add the animation to the modal
// 						$(".modal").each(function(index){$(this)}.on('show.bs.modal',function(e) {
// 								var open = $(this).attr('data-easein');
// 								if (open == 'shake') {
// 									$('.modal-dialog').velocity('callout.'+ open);
// 								} else if (open == 'pulse') {
// 									$('.modal-dialog').velocity('callout.'+ open);
// 								} else if (open == 'tada') {
// 									$('.modal-dialog').velocity('callout.'+ open);
// 								} else if (open == 'flash') {
// 									$('.modal-dialog').velocity('callout.'+ open);
// 								} else if (open == 'bounce') {
// 									$('.modal-dialog').velocity('callout.'+ open);
// 								} else if (open == 'swing') {
// 									$('.modal-dialog').velocity('callout.'+ open);
// 								} else {
// 									$('.modal-dialog').velocity('transition.'+ open);
// 								}

// 							})
						
// 						);
					</script>
</body>

</html>
