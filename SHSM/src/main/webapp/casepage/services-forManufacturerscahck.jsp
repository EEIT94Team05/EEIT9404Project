<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<title>案件進度</title>
<meta charset="utf-8">
<link rel="stylesheet" href="asset/css/bootstrap.min.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"
	media="screen">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="css/responsive.css"
	media="screen">
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.migrate.js"></script>
<script type="text/javascript" src="js/modernizrr.js"></script>
<!--jquery datatable-->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#errormsg').hide();
						$('#myModalLabel').show();
						var table = $('#example')
								.DataTable(
										{
											destroy : true,
											"ajax" : "ComCaseSearchServlet.controller",
											"columnDefs" : [
													{
														"targets" : -2,
														"data" : null,
														"defaultContent" : "<button class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#look\" type=\"button\" name=\"casechck\">確認</button>"
													},
													{
														"targets" : -1,
														"data" : null,
														"defaultContent" : "<button class=\"btn btn-info\" data-toggle=\"modal\" data-target=\"#myModal1\" type=\"button\" name=\"custdetail\">確認</button>"
													} ]
										});

						setInterval(function() {
							table.ajax.reload();
						}, 5000);
						var data;
						$(document)
								.on(
										'click',
										'button[name="casechck"]',
										function() {
											console.log(data[7])
											var id = data[9]
											var status = data[7]
											if (status != "處理中") {
												if (status != "已完成") {
													$('#myModalLabel').hide();
													$('#errormsg').text(
															'客戶尚未選擇').show();
													$('#checkyes').hide();
													$('#checkcanc').text('關閉')
												} else {
													$('#myModalLabel').hide();
													$('#errormsg')
															.text('案件已完成')
															.show();
													$('#checkyes').hide();
													$('#checkcanc').text('關閉')
												}

											} else {
												console.log(id)
												$('#checkyes').show();
												$('#errormsg').text('確定案件已完成?');
												$('#checkyes')
														.one(
																'click',
																function() {
																	$
																			.ajax(
																					{
																						'url' : 'ComFinCaseServlet.controller',
																						data : {
																							'id' : id
																						},
																						type : "get"
																					})
																			.done(
																					function(
																							data) {
																						console
																								.log(data)
																						alert(data)
																						table.ajax
																								.reload();
																					})
																})
											}

										})
						$('#example tbody').on('click', 'tr', function() {
							data = table.row(this).data();
							id = data[0];
							title = data[0];
						});

						$(document)
								.on(
										'click',
										'button[name="custdetail"]',
										function() {
											console.log(data[10]);
											var cusid = data[10]
											if(data[7]!="招標中"){
												$('#cusDN').hide()
												$('#cusD').show()
												
											$
													.ajax(
															{
																url : 'CusDetailServlet.controller',
																data : {
																	'id' : cusid
																}
															})
													.done(
															function(data) {
																console
																		.log(data.cus_name)
																$(
																		'td[name="cus_name"]')
																		.text(
																				data.cus_name);
																$(
																		'td[name="cus_email"]')
																		.text(
																				data.cus_email);
																$(
																		'td[name="cus_address"]')
																		.text(
																				data.cus_address);
																$(
																		'td[name="cus_phone"]')
																		.text(
																				data.cus_phone);
																$(
																		'td[name="sex"]')
																		.text(
																				data.sex);
															})
											}else{
												$('#cusDN').show()
												$('#cusD').hide()
											}			
										})

					});
</script>
</head>

<body>
	<!-- Container -->
	<div id="container">
		<!-- Start Content -->
		<div id="content">
			<div class="container">
				<h3 class="sub-header">案件管理</h3>
				<hr />
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="1200px">
					<thead>
						<tr>
							<th>案件標題</th>
							<th>案件種類</th>
							<th>客戶</th>
							<th>預算金額</th>
							<th>案件場所</th>
							<th>案件地址</th>
							<th>期望維修日期</th>
							<th>案件狀態</th>
							<th>案件評分</th>
							<th>完成案件</th>
							<th>客戶資訊</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

	<!--     <div class="modExample"><a href="#myModal1" role="button"  data-target="#myModal1" -->
	<!-- 		class="btn btn-default" data-toggle="modal" id="bidbutton" style="">查詢投標廠商</a> -->
	<!-- 		</div> -->
	<div id="myModal1" class="modal" data-easein="fadeIn" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
						<h4 id="cusDN" align="center">尚在招標中</h4>
					<div id="cusD" align="center">
						<div>
							<h4>
								<strong><p class="bg-info">客戶資訊 :</p></strong>
							</h4>
							<h4 name="casetitle">
								<font size="4"></font>
							</h4>
						</div>
						<form method="post">
							<div>
								<table>
									<tr id="bidcom">

									</tr>
									<tr>
										<form>
											<table id="searchbidding" border="1">
												<tr>
													<td>客戶名稱:</td>
												</tr>
												<tr>
													<td name="cus_name"></td>
												</tr>
												<tr>
													<td>性別:</td>
												</tr>
												<tr>
													<td name="sex"></td>
												</tr>
												<tr>
													<td>E-mail:</td>
												</tr>
												<tr>
													<td name="cus_email"></td>
												</tr>
												<tr>
													<td>地址:</td>
												</tr>
												<tr>
													<td name="cus_address"></td>
												</tr>
												<tr>
													<td>聯絡電話:</td>
												</tr>
												<tr>
													<td name="cus_phone"></td>
												</tr>

											</table>
										</form>
									</tr>


								</table>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>

	<div class="modal fade" id="look" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!--關閉按鈕-->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="errormsg" style="text-align: center"></h4>
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center">確定案件已完成?</h4>
				</div>

				<div class="modal-footer" style="align: center">
					<button type="button" id="checkyes" class="btn btn-default"
						data-dismiss="modal">確定</button>
					<button type="button" id="checkcanc" class="btn btn-default"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<script src="js/docs.min.js"></script>
</body>

</html>
