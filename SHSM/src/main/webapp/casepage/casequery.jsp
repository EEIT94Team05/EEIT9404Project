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

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<!--     <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css" media="screen"> -->
	<link rel="stylesheet" type="text/css" href="css/style.css"	media="screen">
	<script src="../start/js/jquery.raty.js"></script>

    <script>
    $(document).ready(function() {
    	$("#divId").hide();
    	
    	var table =  $('#example').DataTable({destroy:true, "ajax":"CusCaseSearchServlet.controller","columnDefs":[{"targets":-1,"data":null,"defaultContent":"<button class=\"btn btn-danger\" data-toggle=\"modal\" data-target=\"#look\" type=\"button\" name=\"casescore\">評價</button>"}]});
    	setInterval( function () {
    	    table.ajax.reload();
    	}, 500 );
    		
    	
    	var data;
        var id;
        var title;
        var casebid;
		var a;
       var star;
       $(document).on('click','button[name="casescore"]',function(){
				console.log(data[6])
				if(data[6]!="已完成"){
					if(data[6]=="招標中"){
						$('#a').hide();
						$('#er').remove()
						$('#a').after('<div id="er" align="center" style="margin:10px 0 10px 0 ;"><h1>尚未選擇廠商</h1></div>')
						$('#chckdiv').html('<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>')
					}else{
						$('#a').hide();
						$('#er').remove()
						$('#a').after('<div id="er" align="center" style="margin:10px 0 10px 0 ;"><h1>案件尚未完成</h1></div>')
						$('#chckdiv').html('<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>')
					}
					
					

				}else{
					$('#er').remove()
					$('#a').show();
					$('#chckdiv').html('<button id="finchck" type="button" class="btn btn-default" data-dismiss="modal">YES</button>'+
							'<button type="button" class="btn btn-default" data-dismiss="modal">NO</button>')
					$('#finchck').on('click',function(){
// 							star = $('#result1').text();					
// 							console.log(wChild.abc(1));
							star = $("iframe").contents().find("#result1").text();
							console.log(star);
			 				$.ajax({
								"url":'CusFinCaseServlet.controller',
								'data':{'id':data[10],'score':star},
								"type":"get"
							})
					})

				}
		})
		

        
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
        
        $('#deletecase').on('click',function(){
// 			 table.row('.selected').remove().draw( false );
			 $.ajax({
					"url":"RepaircaseDeleteServlet",
					"data":{"repaircase_Id":id},
					"type":"get"
               }).done(function(data){
               
               	table.ajax.reload();
               });
			
		})
		
        
       
        
        $('#bidbutton').on('click', function () {
        	if(data[11]!=null){
        		$('button[name="checkbid"]').parent().hide();
        	}else{
        		$('button[name="checkbid"]').parent().show();
        	}
            $.ajax({
				"url":"SearchBidding.controller",
				"data":{"repaircase_Id":id},
				"type":"get"
            }).done(function(data){
            	
            	$('h4[name="casetitle"]').text(title);
            		var i=0;
            		var j=0;
            		var comid;
            		var img;
					casebid = data;
					$('td[name="amount"]').text("")
					$('td[name="biddate"]').text("")
					$('td[name="context"]').text("")
					$('#bidcom').empty();
					
						while(i<data.length){
								 img = '<div  id=\"'+data[i].com_id+'" style=\"float:left; padding:10px;\"><img width=50 height=50 src=\"${pageContext.request.contextPath}/controller/GetCompanyImageServlet?id='+data[i].com_id+'\" /><br>' +
								'<input type=\"button\" name=\"'+data[i].com_id+'bidding\" id="'+data[i].com_id+'" value=\"'+data[i].com_name+'\" /></div>' ;
								$('#bidcom').prepend(img)
														
							i++;
								
						}
// 						$('#closewindow').click(function(){
							
// 							$('#myModal1 > div > div > div > div > div > form > div > table:nth-child(2) > tbody').empty();
							
// 						});						 
					$('input[name$="bidding"]').on('click',function(biddata){
						console.log(biddata)
						 comid = biddata.currentTarget.id;
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
					
					$('button[name="checkbid"]').one('click',function(){
						console.log(comid);
						if(comid!=null){
							$.ajax({
								"url" : 'CheckBidding.controller',
								"data":{"repaircase_Id":id, "com_id" : comid },
								"type":"get"
							}).done(function(result){
								alert(result);
								table.ajax.reload();
								$('button[name="checkbid"]').parent().hide();
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
		class="btn btn-default" data-toggle="modal" id="bidbutton">查詢投標廠商</a>
		<input id="deletecase" class="btn btn-default" type="button" value="刪除案件" />
		</div>

<input type="hidden" name="star" value="1">
                      
<div id="myModal1" class="modal" data-easein="fadeIn" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<button id="closewindow" type="button" class="close" data-dismiss="modal"
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


<!-- 跳出廠商詳細訊息-->
	<div class="modal fade" id="look" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div  class="modal-dialog">
			<div class="modal-content">
				<div id="a"class="modal-header">
					<!--關閉按鈕-->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<div>
                    <iframe src="http://localhost:8080/SHSM/start/start.html" frameborder="0" width="100%" height="100" scrolling="no" style="margin: 0 0 0 0 "></iframe>
                </div>
				</div>
				<div id="chckdiv" class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">關閉
					</button>
				</div>
			</div>
		</div>
	</div>
	

</body>

</html>
