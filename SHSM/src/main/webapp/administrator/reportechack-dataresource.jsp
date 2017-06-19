<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/Content/AssetsBS3/img/favicon.ico">
    <title>會員管理</title>
    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!--分頁-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
</head>
<style>
 #button{margin-left: 20px}
</style>
<body>
  <h2 class="sub-header">檢舉清單</h2>
    <hr/>
    
    <div class="table-responsive" >
        <table class="table table-striped" id="tb">
            <thead>
                <tr>
                    <th>檢舉編號</th>
                    <th>案件編號</th>
                    <th>檢舉人</th>
                    <th>檢舉日期</th>
                    <th>檢舉原因</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
        <!--</div>-->
        <span id='table_page'></span>
        <script>
        $(function() {
            var table = $('#tb').DataTable({"ajax":"ReportALLServlet","info":false});
            var id;
            $('#tb tbody').on( 'click', 'tr', function () {
                id = $(this).find('td:eq(0)').text();
                if ( $(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                    
                }
            } );
         
            $('#button').click( function () {
                table.row('.selected').remove().draw( false );
                $.ajax({
					"url":"ReportDeleteServlet",
					"data":{"ReportId":id},
					"type":"get"
                }).done(function(data){
                    
                	$('#tb').DataTable({destroy:true, "ajax":"ReportALLServlet","info":false});
                    })
            } );
        } );

        </script>
        <input type="button" id="button" value="刪除所選資料" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="../js/docs.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        
</body>
</html>