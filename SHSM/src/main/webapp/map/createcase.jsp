<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <title>YZUSPS-SIS</title>
    <link rel="Shortcut Icon" type="../image/x-icon" href="../img/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- css -->
    <link href="http://140.138.170.15/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://140.138.170.15/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="http://140.138.170.15/css/nivo-lightbox.css" rel="stylesheet" />
    <link href="http://140.138.170.15/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
    <link href="http://140.138.170.15//css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="http://140.138.170.15/css/owl.theme.css" rel="stylesheet" media="screen" />
    <link href="http://140.138.170.15/css/flexslider.css" rel="stylesheet" />
    <link href="http://140.138.170.15/css/animate.css" rel="stylesheet" />
    <link href="http://140.138.170.15/css/style.css" rel="stylesheet">
    <link href="http://140.138.170.15/color/default.css" rel="stylesheet">
    <!-- Core JavaScript Files -->
    <script src="http://140.138.170.15/js/jquery.min.js"></script>
    <script src="http://140.138.170.15/js/bootstrap.min.js"></script>
    <script src="http://140.138.170.15/js/jquery.sticky.js"></script>
    <script src="http://140.138.170.15/js/jquery.flexslider-min.js"></script>
    <script src="http://140.138.170.15/js/jquery.easing.min.js"></script>
    <script src="http://140.138.170.15/js/jquery.scrollTo.js"></script>
    <script src="http://140.138.170.15/js/jquery.appear.js"></script>
    <script src="http://140.138.170.15/js/stellar.js"></script>
    <script src="http://140.138.170.15/js/wow.min.js"></script>
    <script src="http://140.138.170.15/js/owl.carousel.min.js"></script>
    <script src="http://140.138.170.15/js/nivo-lightbox.min.js"></script>
    <script src="http://140.138.170.15/js/custom.js"></script>
    <!-- to tune the size of iframe -->
    <script language="javaScript">
    function autoResize(#themeframe) {
        $('#themeframe').height($('#themeframe').contents().height());
        $('#themeframe').width($('#themeframe').contents().width());
    }
    </script>
    <script language="javascript">
    function checkForm() {
        if (document.formJoin.m_passwd.value != "" || document.formJoin.m_passwdrecheck.value != "") {
            if (!check_passwd(document.formJoin.m_passwd.value, document.formJoin.m_passwdrecheck.value)) {
                document.formJoin.m_passwd.focus();
                return false;
            }
        }
        if (document.formJoin.m_title.value == "") {
            alert("請填寫姓名!");
            document.formJoin.m_title.focus();
            return false;
        }
        if (document.formJoin.m_email_one.value == "") {
            alert("請填寫電子郵件!");
            document.formJoin.m_email_one.focus();
            return false;
        }
        if (!checkmail(document.formJoin.m_email)) {
            document.formJoin.m_email.focus();
            return false;
        }
        return confirm('確定送出嗎？');
    }
    </script>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
    <!-- Section: Update -->
    <section id="update" class="home-section nopadd-bot color-dark bg-gray text-center">
        <div class="container marginbot-50">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
                        <div class="section-heading text-center">
                            <h3 class="h-bold">新建立案件</h3>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row marginbot-80">
                <div class="col-md-8 col-md-offset-2">
                    <div class="regbox">
                        <form enctype="multipart/form-data" id="form1" class="wow bounceInUp" action="<c:url value="/map/createcase.controller" />"  data-wow-offset="10" data-wow-delay="0.2s" method="post" data-ajax="false">
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong>案件種類</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control input-lg" name="casetype" type="text" class="normalinput" id="#" value="ex:水電">
                                    	<option>a</option>
                                    	<option>b</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong><font color="#FF0000">*</font>案件標題</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <textarea placeholder="請輸入標題" id="comment" name="casetitle" cols="45" rows="1" maxlength="20" aria-required="true" required="required"></textarea>
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong><font color="#FF0000">*</font>區域</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" name="casearea" type="text" class="normalinput" id="m_div" value="台北市">
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong><font color="#FF0000">*</font>地址</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" name="caseaddress" type="text" class="normalinput" id="m_dep" value="請填入住址                      ">
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong><font color="#FF0000">*</font>期望維修日期</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" name="repairdate" type="date" class="normalinput" id="m_gra_year" value="93">
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong><font color="#FF0000">*</font>維修地點</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" name="caseplace" type="text" class="normalinput" id="m_email_one" value="">
                                </div>
                            </div>
                            <div class="row marginbot-20" id="">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong >內文</strong>：</h6>
                                </div>
                                <textarea placeholder="請輸入詳細說明" id="comment" name="context" cols="45" rows="3" maxlength="65525" aria-required="true" required="required"></textarea>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong>照片上傳</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" name="img1" type="file" class="normalinput" id="m_em_sta" value="" multiple>
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <div class="col-md-6 xs-marginbot-20">
                                    <h6 align="right"><strong>影片上傳</strong>：</h6>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" name="media" type="file" class="normalinput" id="m_em_un" value="">
                                </div>
                            </div>
                            <div class="row marginbot-20">
                                <p>
                                    <font color="#FF0000">*</font> 表示為必填的欄位</p>
                                <hr size="1" />
                            </div>
                            <div class="row">
                                <input name="m_id" type="hidden" id="m_id" value="2">
                                <input name="action" type="hidden" id="action" value="update">
                                <div class="col-md-4">
                                    <button class="btn btn-skin btn-lg btn-block" type="submit" name="Submit2">確定新增</button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-skin btn-lg btn-block" type="reset" name="Submit3">取消</button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-skin btn-lg btn-block" type="reset" name="Submit" onClick="window.history.back();">回到地圖</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /Section: Update -->
</body>

</html>