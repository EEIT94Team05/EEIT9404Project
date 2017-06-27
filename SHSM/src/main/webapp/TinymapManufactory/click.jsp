<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Google Maps JavaScript API Example</title>
<script src="http://hayageek.github.io/jQuery-Upload-File/jquery.uploadfile.min.js"></script>
<script
	src="http://hayageek.github.io/jQuery-Upload-File/jquery.uploadfile.min.js"></script>
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

#header {
	width: 500px;
	height: 600px;
	margin: 0 0 100px -50px;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 16px;
	padding: 15px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 4px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 30px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
</style>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/jquery.session.js"></script>
<script type="text/javascript">
      var abc;
      
	$(function() {
		$("#divid").hide();

		if (GBrowserIsCompatible()) {
			myMap = new GMap2(document.getElementById("my_map"));
			//搭配下方setcenter使用
			myLatLng = new GLatLng(25.04763902653048, 121.51715755462646);
			//決定你 Google 地圖的中心點位置和縮放大小
			myMap.setCenter(myLatLng, 14);
			myMap.disableDoubleClickZoom();
			//設定要顯示的控制項
			myMap.addControl(new GLargeMapControl());
			myMap.addControl(new GMapTypeControl());
		}
// 		setInterval( function () {
	    	  $.ajax({
				  url: "casesearch.controller",
				  dataType: 'json',
				  async: false,
				  success: function(data) {
						var i = 0;
						while (i < data.length) {
							addresstolatlng(data[i]);
							
							i++;
						}

					}
				});
// 			}, 1000 );
		
// 		$.getJSON("casesearch.controller", function(data) {
// 			var i = 0;
// 			while (i < data.length) {
// 				addresstolatlng(data[i]);
				
// 				i++;
// 			}

// 		})
		//載入後動作

	})
	function createNode(lat, lng, myMap, data) {
		var point = new GPoint(lng, lat);
		var marker = new GMarker(point);

		
		GEvent.addListener(marker,'mouseover',function() {marker.openInfoWindowHtml('<center>'

											+ '<h4 style='+'color:'+'black'+'>'
											+ '提案人'
											+ '</h4>'
											+ '<hr/>'
											+ '<h4 id='+'\"caseid\"'+' style='+'color:'+'black'+'>'
											+ data.repaircase_id
											+ '</h4>'
											+ '<hr/>'
											+ '<h4 style='+'color:'+'black'+'>'
											+ '案件標題'
											+ '</h4>'
											+ '<hr/>'
											+ '<h4 style='+'color:'+'black'+'>'
											+ data.repaircase_title
											+ '</h4>'
											+ '<hr/>'
											+ '<a href='+'\"#myModal1\"'+' role='+'\"button\"'+' data-target='+'\"#myModal1\"'
						                    +' class='+'\"btn btn-default\"'+' data-toggle='+'\"modal\"'+' id='+'\"divId\"'

						                    +' scrolling='+'\"no\"'+'>'+ '詳細資訊' + '</a>' + '</center>');



										$("a").on("click",function() {
											$("#divid").show().css({
												position : "absolute",
												top : event.pageY,
												left : event.pageX
											});
										abc = data;
										console.log(data.repaircase_title);
										$('td[name="casetitle"]').text(data.repaircase_title);
										$('td[name="area"]').text(data.repaircase_area);
										$('td[name="place"]').text(data.repaircase_place);
										$('td[name="budget"]').text(data.repaircase_budget);
										$('td[name="context"]').text(data.repaircase_context);
										$.get('GetCaseImageServlet', {'id' : data.repaircase_id}, function(img) {
										$('#tablestyle > tbody > tr:nth-child(11) > td > img').val(img);
										});
										$.ajax({'url':'CreateBiddingServlet',
												'data':{'id':data.repaircase_id,'select':'select'},
												'success':function(obb){
											console.log(obb)
											if(obb=="已投標"){
												$('#hide').hide();
											}else{
												$('#hide').show();
											}
											
										}})
						 			
										
									});
										$("#my_map > div:nth-child(1) > div > div:nth-child(1) > div:nth-child(4) > div:nth-child(4) > div:nth-child(2)").mouseleave(function() {
											$("#my_map > div:nth-child(1) > div > div:nth-child(1) > div:nth-child(4) > div:nth-child(4) > div:nth-child(2)").hide();});

						});

		myMap.addOverlay(marker);

	}

	/*<!--地圖標點-->*/
	function addresstolatlng(data) {
		var lat;
		var lng;
		var address = data.repaircase_address
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {

				lat = results[0].geometry.location.lat();
				lng = results[0].geometry.location.lng();

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
				createNode(lat, lng, myMap, data);
				
			

			}
		})
	}

	$(function() {
		$("#showdata").hide();
		
		$("#clickdata").click(function() {
			$("#showdata").toggle();

			
			$('input[name="enter"]').click(function(){
					var amount = $('input[name="amount"]').val();
					var context = $('input[name="context"]').val();
					var enter = $('input[name="enter"]').val();
//					var img = $('input[name="img"]').val();
				
					console.log(amount);
					console.log(context);
//					console.log(img);
					$.ajax({
						"url":"CreateBiddingServlet",
						"type":"post",
						"cache":false,
						"data":{
							"id":abc.repaircase_id,
							"amount":amount,
							"context":context,
							"enter":enter,
//							"img":img
							"select":"insert"
								}
					}).done(function(data){
						console.log(data)
						if(data=='欄位不可為空,請重新輸入'){
							alert(data);
						}
						if(data=='投標完成'){
							alert(data);
							$('#hide').hide();
						}
				
					});
					
				});
		})
	});
	
</script>
</head>

<body>
	<div id="my_map" style="width: 100%; height: 600px"></div>

	<div class="container">
		<!-- modal examples -->
		<div class="modExample">
			<div id="myModal1" class="modal" data-easein="fadeIn" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="title" id="myModalLabel"
									style="color: black; background-color: #d9d9d9;">案件詳情</h4>
							</center>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<div class="col-md-12">
									<table id="tablestyle" style="color: black; font-size: 12px;">
										<tr>
											<td
												style="text-align: center; padding: 4px; font-size: 14px; background-color: #FFEFD5;">案件標題</td>
										</tr>
										<tr>
											<td name="casetitle" align="center" style="padding: 6px;"></td>
										</tr>
										<tr>
											<td
												style="text-align: center; padding: 4px; font-size: 14px; background-color: #FFEFD5;">區域:</td>
										</tr>
										<tr>
											<td name="area" align="center" style="padding: 6px;"></td>
										</tr>
										<tr>
											<td
												style="text-align: center; padding: 4px; font-size: 14px; background-color: #FFEFD5;">注意事項:</td>
										</tr>
										<tr>
											<td name="place" align="center" style="padding: 6px;"></td>
										</tr>
										<tr>
											<td
												style="text-align: center; padding: 4px; font-size: 14px; background-color: #FFEFD5;">金額:</td>
										</tr>
										<tr>
											<td name="budget" align="center" style="padding: 6px;"></td>
										</tr>
										<tr>
											<td
												style="text-align: center; padding: 4px; font-size: 14px; background-color: #FFEFD5;">內容:</td>
										</tr>


										<tr>
											<td name="context" align="center" style="padding: 6px;"></td>
										</tr>
										<td><img width='100' height='100' /></td>
									</table>
									<div id="hide">
									<div>
										<center>
											<div>
												<button class="button" style="vertical-align: middle"
													id="clickdata">
													<span>我要投標</span>
												</button>
											</div>
											<div id="showdata">
												點擊顯示投標/隱藏

																
												<form class="form-horizontal" role="form" enctype="mutiple/form-data"  method="post">

													<div class="form-group">
														<label class="col-sm-2 control-label">金額:</label>
														<div class="col-sm-10">

															<input name="amount" class="form-control" id="focusedInput" type="text"
																 placeholder="請輸入金額">

														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label">內文:</label>
														<div class="col-sm-10">

															<input name="context" class="form-control" id="focusedInput" type="text"
																 placeholder="請輸入說明內容"><td><span>${error.column}</span></td>

														</div>
													</div>

<!-- 													<div class="form-group"> -->
<!-- 														<label class="col-sm-2 control-label">照片:</label> -->
<!-- 														<div class="col-sm-10"> -->
<!-- 															<input name="img" class="form-control" id="focusedInput" type="file" -->
<!-- 																placeholder="請上傳照片"> -->
<!-- 														</div> -->
<!-- 														<div> -->
															<center>
																<input type="button" name="enter" value="確定投標" ></input>

															</center>
														</div>
													</div>
												</form>
											</div>
										</center>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
</body>

</html>
