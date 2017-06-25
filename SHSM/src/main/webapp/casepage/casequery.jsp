<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>案件進度</title>
    <meta charset="utf-8">
     <meta charset="utf-8">
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!--分頁-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <script>
    $(document).ready(function() {
    	$("#divId").hide();
    	var table =  $('#example').DataTable({"ajax":"CusCaseSearchServlet.controller"});
    	var data  ;
        var id;
        var title;
        var casebid;
        $('#example tbody').on( 'click', 'tr', function () {
            
            if ( $(this).hasClass('selected') ) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                data = table .row(this) .data();
                id = data[10];
                console.log(data[10]);
                title = data[0];
                
            }
        } );
        
        $('#bidbutton').on('click', function () {
        	
            $.ajax({
				"url":"SearchBidding.controller",
				"data":{"repaircase_Id":id},
				"type":"get"
            }).done(function(data){
                
            	$('h4[name="casetitle"]').text(title);
            		var i=0;
            		var j=0;
            		var comid;
					casebid = data;
					
						while(i<data.length){
							
							
								var img = '<div style=\"float:left; padding:10px;\"><img width=50 height=50 src=\"${pageContext.request.contextPath}/controller/GetCompanyImageServlet?id='+data[i].com_id+'\" /><br>' +
								'<input type=\"button\" name=\"'+data[i].com_id+'bidding\" value=\"'+data[i].com_id+'\" /></div>' ;
								$('#bidcom').after(img)
														
							i++;
						}
					
					
					$('input[name$="bidding"]').on('click',function(biddata){
						 comid = biddata.currentTarget.defaultValue;
						while(j<data.length){
							if(comid==data[j].com_id){
								$('td[name="amount"]').text(data[j].bidding_amount)
								$('td[name="biddate"]').text(data[j].bidding_date)
								$('td[name="context"]').text(data[j].bidding_context)
//			 					$('td[name="bidimg"]').text(data[j].bidding_amount)
							}
							j++
						}
						j=0;
					})
					
					$('button[name="checkbid"]').on('click',function(){
						console.log(comid);
						if(comid!=null){
							$.ajax({
								"url" : 'CheckBidding.controller',
								"data":{"repaircase_Id":id, "com_id" : comid },
								"type":"get"
							}).done(function(result){
								alert(result);
							})
						}else{
							alert('請選擇廠商')
						}
						
					})
					
      		  } );
            
   		 });
    })
    </script>
</head>
<body>
    <!-- Container -->
    <div id="container">
        <!-- Start Content -->
        <div id="content">
            <div class="container">
                <div class="page-content">
                    <div class="row">
                        <h2 class="sub-header">案件管理</h2>
                        <hr/>
                        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
								<th>案件標題</th>
								<th>案件種類</th>
								<th>維修日期</th>
								<th>金額</th>
								<th>地址</th>
								<th>場所</th>
<!-- 								<th>內文</th> -->
								<th>案件狀態</th>
								<th>建立日期</th>
								<th>結束日期</th>
								<th>評分</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>       

<div class="modExample"><a href="#myModal1" role="button"  data-target="#myModal1"
		class="btn btn-default" data-toggle="modal" id="bidbutton">查詢投標廠商</a></div>
                      
<div id="myModal1" class="modal" data-easein="fadeIn" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="title" id="myModalLabel">投標廠商</h4>
							</center>

							

						<div class="modal-body">
							<div align="center">
								
								<div>
									<h4><font size="4">案件標題  :</font></h4>
									<h4 name="casetitle"><font size="4"></font></h4>
								</div>
								<form method="post">
								<div>

									<h4><font size="4">投標廠商  :</font></h4>
								<table>
								<tr id="bidcom" >
								<div >
								
								</div>
								</tr>
								<tr>
									<form>
										<table id="searchbidding" border="1">
											<tr>
												<td>投標金額:</td>
											</tr>
											<tr>
												<td name="amount"></td>
											</tr>
											<tr>
												<td>建立日期:</td>
											</tr>
											<tr>
												<td name="biddate"></td>
											</tr>
											<tr>
												<td>內文:</td>
											</tr>
											<tr>
												<td name="context"></td>
											</tr>
											<tr>
												<td>圖片:</td>
											</tr>
											<tr>
												<td name="bidimg"></td>
											</tr>
										</table>
								</form>
								</tr>
								<div align="center"><button type="button" name="checkbid" class="btn btn-danger" style="margin:10px 0 0 0"  >選擇廠商</button></div>
								</table>
								</div>
								</form>
							</div>
							
						</div>
</div></div></div></div>
</body>

</html>
