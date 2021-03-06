<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<title>Margo | Services</title>
<meta charset="utf-8">

<link rel="stylesheet" href="asset/css/bootstrap.min.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"
	media="screen">
<!-- <link rel="stylesheet" type="text/css" href="css/style.css" -->
<!-- 	media="screen"> -->
<link rel="stylesheet" type="text/css" href="css/responsive.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="css/colors/red.css"
	title="red" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/jade.css"
	title="jade" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/blue.css"
	title="blue" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/beige.css"
	title="beige" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/cyan.css"
	title="cyan" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/green.css"
	title="green" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/orange.css"
	title="orange" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/peach.css"
	title="peach" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/pink.css"
	title="pink" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/purple.css"
	title="purple" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/sky-blue.css"
	title="sky-blue" media="screen" />
<link rel="stylesheet" type="text/css" href="css/colors/yellow.css"
	title="yellow" media="screen" />
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.migrate.js"></script>
<script type="text/javascript" src="js/modernizrr.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.fitvids.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/nivo-lightbox.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="js/jquery.appear.js"></script>
<script type="text/javascript" src="js/count-to.js"></script>
<script type="text/javascript" src="js/jquery.textillate.js"></script>
<script type="text/javascript" src="js/jquery.lettering.js"></script>
<script type="text/javascript" src="js/jquery.easypiechart.min.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jquery.parallax.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<script>
	$(function() {

		function format_float(num, pos) {
			var size = Math.pow(10, pos);
			return Math.round(num * size) / size;
		}

		function preview(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('.preview').attr('src', e.target.result);
					var KB = format_float(e.total / 1024, 2);
					$('.size').text("檔案大小：" + KB + " KB");
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("body").on("change", ".upl", function() {
			preview(this);
		})

	})
</script>

</head>

<body>

	<!-- Start Content -->
	<div id="content">
		<div class="container">
			<div class="page-content">
				<!-- Divider -->
				<div class="hr1" style="margin-bottom: 45px;"></div>
				<div class="row">
					<div class="col-md-6 col-xs-6">
						<!-- 以下為 左邊 會員資料顯示欄位 -->
						<h4 class="classic-title">
							<span>會員資訊</span>
						</h4>
						<!-- Accordion -->
						<div class="panel-group" id="accordion">
							<!-- Start Accordion 1 -->
							<div class="panel panel-default" style="border: 0px">

								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapse-one"> <i
											class="fa fa-angle-up control-icon"></i> <i
											class="fa fa-desktop"></i> <input type="text" value="基本資料"
											style="border: 0px; margin: 0 0 10px 10px"
											readonly="readonly">
										</a>
									</h4>
								</div>
								<!--客戶基本資料  傳送接收 這邊噢 -->
								<div class="table-responsive">
									<table class="table table-striped" id="tb">
										<thead>
											<tr>
												<th>帳號:${custuser.cus_id}</th>
											</tr>
											<tr>
												<th>密碼:${custuser.cus_password}</th>
											</tr>
											<tr>
												<th>姓名:${custuser.cus_name}</th>
											</tr>
											<tr>
												<th>住址:${custuser.cus_address}</th>
											</tr>
											<tr>
												<th>電話:${custuser.cus_phone}</th>
											</tr>
											<tr>
												<th>註冊日期:${custuser.cus_regist}</th>
											</tr>
											<tr>
												<th>信箱:${custuser.cus_email}</th>
											</tr>
											<tr>
												<th>性別:${custuser.sex}</th>
											</tr>
										</thead>
										<tbody>


										</tbody>
									</table>
								</div>
								<script>
									// 									$(function() {

									// 										$('#tb').DataTable({
									// 											"ajax" : "CustomerALLServlet",
									// 											"info" : false
									// 										});

									// 									});
								</script>
							</div>
							<!-- End Accordion 1 -->
						</div>
						<!-- End Accordion -->
					</div>
					<!--以下為 右邊 站內導覽-->
					<div class="col-md-6 col-xs-6">
						<h4 class="classic-title">
							<span>案件資訊</span>
						</h4>
						<div class="col-md-12 column">
							<table class="table">
								<thead>
									<tr>
										<th>當前案件</th>
										<th>案件標題</th>
										<th>建立時間</th>
										<th>狀態</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>TB - Monthly</td>
										<td>01/04/2012</td>
										<td>Default</td>
									</tr>
									<tr class="success">
										<td>1</td>
										<td>TB - Monthly</td>
										<td>01/04/2012</td>
										<td>Approved</td>
									</tr>
									<tr class="error">
										<td>2</td>
										<td>TB - Monthly</td>
										<td>02/04/2012</td>
										<td>Declined</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--編輯資訊欄位這邊結束-->





			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- End Content -->
	</div>
	<!-- End Container -->
</html>
