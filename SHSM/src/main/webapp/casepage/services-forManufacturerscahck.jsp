<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>案件進度</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="asset/css/bootstrap.min.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/responsive.css" media="screen">
    <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.migrate.js"></script>
    <script type="text/javascript" src="js/modernizrr.js"></script>
    <!--jquery datatable-->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#example').DataTable({destroy:true, "ajax":"ComCaseSearchServlet.controller"});
    });
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
                                    <th>客戶</th>
                                    <th>預算金額</th>
									<th>案件場所</th>
									<th>案件地址</th>
									<th>期望維修日期</th>
									<th>案件狀態</th>
									<th>案件評分</th>
								</tr>
                            </thead>
                            
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 跳出廠商詳細訊息-->
    <div class="modal fade" id="look" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <!--關閉按鈕-->
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                    廠商詳細資訊
                </h4>
                </div>
                <div class="modal-body">
                    按下 ESC 按钮退出。
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">關閉
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!--再次確認-->
    <div class="modal fade" id="look-ok" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="moal-body">
                    <center>
                        再次確認廠商
                    </center>
                </div>
                <div class="modal-footer">
                    <center>
                        <button type="button" class="btn btn-default" data-dismiss="modal">確認
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">在考慮
                        </button>
                    </center>
                </div>
            </div>
        </div>
    </div>
    <script>
    $(function() {
        $('#look').modal({
            keyboard: true
        })
    });
    $(function() {
        $('#look-ok').modal({
            keyboard: true,
        })
    });
    </script>
    <script src="js/docs.min.js"></script>
</body>

</html>
