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
    <link rel="stylesheet" type="text/css" href="css/colors/red.css" title="red" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/jade.css" title="jade" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/blue.css" title="blue" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/beige.css" title="beige" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/cyan.css" title="cyan" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/green.css" title="green" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/orange.css" title="orange" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/peach.css" title="peach" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/pink.css" title="pink" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/purple.css" title="purple" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/sky-blue.css" title="sky-blue" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/colors/yellow.css" title="yellow" media="screen" />
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
    <!--jquery datatable-->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#example').DataTable({"ajax":"CusCaseSearchServlet.controller"});
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
                                    <th>案件編號</th>
<<<<<<< HEAD
								<th>預算金額</th>
								<th>案件種類</th>
								<th>案件標題</th>
								<th>案件地址</th>
								<th>案件場所</th>
								<th>期望維修日期</th>
								<th>案件內容</th>
								<th>案件圖片</th>
								<th>案件狀態</th>
								<th>案件完成日期</th>
								<th>案件評分</th>
								<th>abc</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a href="#">B0000000001</a></td>
                                    <td>水電維修</td>
                                    <td>外牆翻修</td>
                                    <td>19,999</td>
                                    <td><td>
                                    <td>
                                        <button data-toggle="modal" data-target="#look">詳細資料</button>
                                    </td>
                                    <td>
                                        <button data-toggle="modal" data-target="#look-ok">選定廠商</button>
                                    </td>
                                </tr>
                                 <tr>
                                    <td><a href="#">B0000000002</a></td>
                                    <td>進雄建設</td>
                                    <td>外牆翻修</td>
                                    <td>99,999</td>
                                    <td><button data-toggle="modal" data-target="#look">詳細資料</button><td>
                                    <td>
                                        <button data-toggle="modal" data-target="#look">詳細資料</button>
                                    </td>
                                    <td>
                                        <button data-toggle="modal" data-target="#look-ok">選定廠商</button>
                                    </td>
                                </tr>
                                 <tr>
                                    <td><a href="#">B0000000001</a></td>
                                    <td>進雄建設</td>
                                    <td>外牆翻修</td>
                                    <td>19,999</td>
                                    <td><td>
                                    <td>
                                        <button data-toggle="modal" data-target="#look">詳細資料</button>
                                    </td>
                                    <td>
                                        <button data-toggle="modal" data-target="#look-ok">選定廠商</button>
                                    </td>
                                </tr>
                            </tbody>
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
                <div class="modal-body">
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
