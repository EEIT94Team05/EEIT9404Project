<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <title>Google Map 座標工具</title>
    <link rel="canonical" href="https://code.essoduke.org/gmap/" />
    <link rel="license" href="http://www.opensource.org/licenses/mit-license.php" />
    <script src="../js/analytics.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/jquery.tinyMap-3.4.6.min.js"></script>
    <script>
    	$(function(){
    		loadProduct();
    		function loadProduct(){
    		    $.getJSON('casesearch.controller',{},function(datas){
		    		//datas > json object
		    		var tb = $('#case>ul');
		    		//tb.empty();
		    		var docFrag = $(document.createDocumentFragment());
		    		$.each(datas,function(idx,product){
		    			var cell1 = $('<li class="template hide"></li>').text(product.repaircase_address);
		    			docFrag.append(cell1);
		    			
		    			
		    		})
		    		tb.html(docFrag);
		    	})
		    	
		    	
	   
		   }
    		
		})
		$('#map-marker-01').tinyMap({
    'center': ['25.039065815333753', '121.56097412109375'],
    'zoom': 14,
    'marker': [
        {
            'addr': ['25.039065815333753', '121.56097412109375'],
            'text': '<strong>110台灣台北市信義區逸仙路288號</strong>',
            'newLabel': '文字標籤',
            'newLabelCSS': 'labels',
            // 自訂外部圖示
            'icon': {
                'url': '/images/big.png',
                'scaledSize': [48, 48]
            },
            // 動畫效果
            'animation': 'DROP'
        },
        {'addr': ['25.041282077030896', '121.56741142272949']},
        {'addr': ['25.0383270525352', '121.57045841217041'], 'text': '<strong>110台灣台北市信義區松高路68號</strong>'},
        {'addr': ['25.034516521123315','121.56496524810791'], 'text': '<strong>110台灣台北市信義區台北101</strong>'},
        {'addr': ['25.037627167884715', '121.56732559204102'], 'text': '<strong>110台灣台北市信義區松壽路20巷</strong>'},
        {'addr': ['25.039726809855434', '121.55633926391602'], 'text': '<strong>106台灣台北市大安區光復南路280巷25號</strong>'},
        {'addr': ['25.037160575899154', '121.55350685119629'], 'text': '<strong>106台灣台北市大安區仁愛路四段300巷11號</strong>'},
        {'addr': ['25.035877438787317', '121.55715465545654'], 'text': '<strong>106台灣台北市大安區光復南路440-1號</strong>'},
        {'addr': ['25.033972149830436', '121.56063079833984'], 'text': '<strong>110台灣台北市信義區莊敬路</strong>'},
        {'addr': ['25.031794640503858', '121.56414985656738'], 'text': '<strong>110台灣台北市信義區松勤街80號</strong>'},
        {'addr': ['25.035255306871402', '121.56998634338379'], 'text': '<strong>110台灣台北市信義區松勇路47號</strong>'},
        {'addr': ['25.033855498524844', '121.5686559677124'], 'text': '<strong>110台灣台北市信義區松仁路130號</strong>'},
        {'addr': ['25.036927279240775', '121.57376289367676'], 'text': '<strong>110台灣台北市信義區松德路168巷12弄9號</strong>'},
        {'addr': ['25.041593128099265', '121.5723466873169'], 'text': '<strong>110台灣台北市信義區忠孝東路五段295巷5號</strong>'},
        {'addr': ['25.04485911668452', '121.56917095184326'], 'text': '<strong>110台灣台北市信義區松隆路61號</strong>'},
        {'addr': ['25.04536455952624', '121.56402111053467'], 'text': '<strong>110台灣台北市信義區市民大道</strong>'},
        {'addr': ['25.04380934412532', '121.55998706817627'], 'text': '<strong>110台灣台北市信義區光復南路133號</strong>'},
        {'addr': ['25.041904178378704', '121.55848503112793'], 'text': '<strong>110台灣台北市信義區光復南路169巷14號</strong>'},
        {'addr': ['25.038521464229383', '121.55900001525879'], 'text': '<strong>110台灣台北市信義區仁愛路四段450號</strong>'}
    ]
});
    </script>

    <style>
      html,
    body {
        height: 100%
    }
    
    body {
        margin: 0;
        padding: 0
    }
    
    #switch {
        width: 100%;
        height: 4rem;
        background-color: rgba(0, 0, 0, 0.7);
        position: fixed;
        bottom: 0;
        text-align: center;
        z-index: 1000
    }
    
    #switch a {
        width: 100%;
        display: block;
        line-height: 4rem;
        color: #fff
    }
    
    #map {
        width: 100%;
        height: 100%
    }
    
    #map img {
        max-width: none;
        height: auto;
        border: 0;
        -ms-interpolation-mode: bicubic
    }
    
    #panel {
        width: 30%;
        height: 100%;
        padding: 2rem 0;
        position: fixed;
        top: 0;
        right: 0;
        background: rgba(255, 255, 255, 0.8);
        overflow: auto;
        z-index: 100
    }
    
    .times {
        cursor: pointer
    }
    
    .infoWindow {
        font-size: 1.1rem
    }
    
    @media screen and (max-width: 768px) {
        #panel {
            width: 100%;
            display: none
        }
    }
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
      <div id="map"></div>
    <div id="switch" class="visible-xs">
        <a href="javascript:;" data-button="switch"><i class="fa fa-gear"></i> <span>顯示面板</span></a>
    </div>
    <div id="panel">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="btn-group btn-group-justified">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-modal="import">
                                    <i class="fa fa-cloud-upload"></i> 匯入
                                </button>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-modal="export">
                                    <i class="fa fa-cloud-download"></i> 匯出
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="search" class="form-control" id="address" placeholder="輸入地址" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" id="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label>
                        <input type="checkbox" id="showPrompt" /> 建立標記時使用提示框顯示座標</label>
                </div>
            </div>
            <div class="row">
                <div id="case" class="col-md-12">
                    <p class="help-block">在地圖上點一下建立標記</p>
                    <ul class="list-unstyled" id="maplist">
                        <li class="template hide">
                            <i data-role="icon" class="times fa fa-times"></i>
                            <a href="javascript:;" data-role="address" class="link"></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="import-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">輸入</h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#input" data-toggle="tab">貼上</a></li>
                        <li><a href="#example" data-toggle="tab">範本</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="input">
                            <p class=""></p>
                            <div class="form-group">
                                <label for="import-data">這裡貼上要匯入的資料</label>
                                <textarea id="import-data" rows="10" class="form-control"></textarea>
                            </div>
                            <div class="help-block">10 筆以上的「地址」將每 200ms 逐一顯示。</div>
                        </div>
                        <div class="tab-pane" id="example">
                            <h3>地址</h3>
                            <pre class="line-numbers"><code class="language-markup">台北市政府
高雄市政府</code></pre>
                            <h3>經緯座標</h3>
                            <pre class="line-numbers"><code class="language-javascript">25.037627167884715, 121.56732559204102
// 或是
"25.039726809855434", "121.55633926391602"</code></pre>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-default" data-button="clear">
                        <i class="fa fa-eraser"></i> 清除欄位
                    </button>
                    <button type="button" class="btn btn-primary" data-button="import">
                        <i class="fa fa-play"></i> 開始匯入
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="export-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">輸出</h4>
                </div>
                <div class="modal-body">
                    <div class="form-gruop">
                        <label class="control-label">選擇格式</label>
                        <div class="btn-group btn-group-justified">
                            <a href="javascript:;" class="btn btn-default" data-output-type="json" data-output-pattern="%7B%22lat%22%3A%20%22%25LAT%25%22%2C%20%22lng%22%3A%20%22%25LNG%25%22%2C%20%22addr%22%3A%20%22%25ADDR%25%22%7D"><i></i> JSON</a>
                            <a href="javascript:;" class="btn btn-default" data-output-type="qs" data-output-pattern="lat%3D%25LAT%25%26lng%3D%25LNG%25%26addr%3D%25ADDR%25"><i></i> QueryString</a>
                            <a href="javascript:;" class="btn btn-default" data-output-type="csv" data-output-pattern="%22%25LAT%25%22%2C%20%22%25LNG%25%22%2C%20%22%25ADDR%25%22"><i></i> CSV</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">變數</label>
                        <input type="text" class="form-control" data-output-format />
                        <div class="help-block">可用變數 <code>%LAT%</code>、<code>%LNG%</code>、<code>%ADDR%</code></div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" cols="80" rows="10" data-output-result></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="about-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title">關於 Google Map 座標工具</h3>
                </div>
                <div class="modal-body">
                    <h4>v1.5.0</h4>
                    <p>地圖核心程式改為 <a href="../tinyMap/">jQuery tinyMap</a> 處理。</p>
                    <h4>其他</h4>
                    <div class="license">
                        <small>此專案所有程式碼、文件說明均採用 <a href="//www.opensource.org/licenses/mit-license.php" rel="license">MIT 授權條款</a>。</small>
                    </div>
                    <div class="powered">
                        <small>
    	                Powered by <a href="//developers.google.com/maps/documentation/javascript/">Google Maps API</a>,
    	                <a href="//jquery.com/">jQuery Library</a>,
                        <a href="//fortawesome.github.io/Font-Awesome/">Font Awesome</a>,
    	                <a href="//getbootstrap.com/">Bootstrap</a>.
                        </small>
                    </div>
                    <div class="copyright">
                        <small>
                        Copyright &copy; 2012-2016                        <a href="//essoduke.org/" rel="me">essoduke.org</a> |
                        <a href="//plus.google.com/+EssodukeChang?rel=author" rel="author">Google+</a>
                        </small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
                </div>
            </div>
        </div>
    </div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlB3fXCAUu0LWGQQ50qk2Ox3lAz83d6XM&callback=initMap"
    async defer></script>
    <script src="http://ditu.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyDlB3fXCAUu0LWGQQ50qk2Ox3lAz83d6XM"></script>
    <link rel="stylesheet" property="stylesheet" href="https://code.essoduke.org/css/style.css" />
    <script src="https://code.essoduke.org/js/jquery-bootstrap-prism.js"></script>
    <script src="../js/jquery.tinyMap-3.4.6.min.js"></script>
    <script src="https://code.essoduke.org/js/gmap/bs-gmap-v3.js?ver=15112702" async></script>
    <script async src="../js/adsbygoogle.js" async></script>
    <script>
    (function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '../js/analytics.js', 'ga');
    ga('create', 'UA-125128-20', 'essoduke.org');
    ga('require', 'displayfeatures');
    ga('send', 'pageview');
    </script>
  </body>
</html>