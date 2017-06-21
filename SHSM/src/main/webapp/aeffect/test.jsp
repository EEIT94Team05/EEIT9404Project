<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>3D Gallery with CSS3 and jQuery</title>
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/modernizr.custom.53451.js"></script>
    <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-7243260-2']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
    </script>
</head>
<body>
    <div class="container">
        <section id="dg-container" class="dg-container">
            <div class="dg-wrapper">
                <a href="#"><img src="images/1.jpg" alt="image01">
                </a>
                <a href="#"><img src="images/2.jpg" alt="image02">
                </a>
                <a href="#"><img src="images/3.jpg" alt="image03">
                </a>
                <a href="#"><img src="images/4.jpg" alt="image04">
                </a>
                <a href="#"><img src="images/5.jpg" alt="image05">
                </a>
                <a href="#"><img src="images/6.jpg" alt="image06">
                </a>
                <a href="#"><img src="images/7.jpg" alt="image07">
            </div>
        </section>
    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.gallery.js"></script>
    <script type="text/javascript">
    $(function() {
        $('#dg-container').gallery({
            autoplay: true
        });
    }); 
    </script> 
</body>
</html>
