<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="js/mymap.js" type="text/javascript"></script>
	<script src="http://api.map.baidu.com/api?v=2.0&ak=E6335695dfe725b91b8dfbce354a5e69" type="text/javascript"></script>
	
	<style>
		/********举报弹出样式*********/
.popup{display:none;}
.popup .popup-bg{width:100%; height:100%; position:fixed; top:0; left:0; background:rgba(0,0,0,0.6);background:#000; filter:alpha(opacity=60);opacity:0.6;}
.popup .window{width:600px; min-height:540px; position:fixed; top:50%; left:50%; margin-left:-300px; margin-top:-270px; background:#fff; padding:0 30px;}
.popup .window .title{height: 70px; line-height: 70px; font-size:18px; color:#488fcd;  border-bottom:1px solid #DDDDDD;}
.popup .window .title .close{ float:right; cursor:pointer;background: url("../images/guanbi.png");width: 30px;height: 30px; margin-top: 18px;}
.popup .window .title .close:hover{background: url("../images/guanbi2.png");}
.popup .window .warn{width:400px; margin: 0 auto; font-size:18px; color:#488fcd; margin-top: 30px;}
.popup .window .reason{color:#272f46; font-size:18px; width:400px; margin:0 auto; margin-top: 25px;}
.popup .window .reason span{color:#fa374b; font-size:16px; padding-right:5px;}
.popup .window .choice{width:400px; margin:10px auto 15px auto; position:relative;}
.popup .window .choice .select-style{width:400px; height:42px; line-height:42px; border:1px solid #DDDDDD; padding-left:10px; background: url(../images/xiala-1.png) no-repeat right center content-box;cursor: pointer;background-position-x: 360px; position: relative;	}
.popup .window .choice .select-style:focus{border:1px solid #488fcd;outline:0;}
.popup .window .choice .select-style:hover{background: url(../images/xiala-2.png) no-repeat right center content-box;background-position-x: 360px;position: relative;}
.popup .window .choice .sel-img{ position:absolute; top:0; right:0;}
.popup .window .text{width:400px; margin:0 auto;}
.popup .window .text textarea{resize: none;width:400px; height:170px; padding:10px; color:#555; border:1px solid #DDDDDD;font-size:14px;}
.popup .window .text textarea:focus{border:1px solid #488fcd;outline:0;}
.popup .window .anniu{width:400px; padding:0 15px; margin:0 auto; margin-top:35px;}
.popup .window .anniu .anniu-l{width:180px; height:50px; line-height:50px; text-align:center; color:#fff; background:#488fcd; font-size:18px; float:left;margin-top:-10px;}
.popup .window .anniu .anniu-l:hover{ background:#2d7abe;}
.popup .window .anniu .anniu-r{width:180px; height:50px; line-height:50px; text-align:center; color:#488fcd; border:1px solid #488fcd; font-size:18px; float:right;margin-top:-10px;}
.popup .window .anniu .anniu-r:hover{color:#2ed7de; border:1px solid #2ed7de;}

.popup .window .remlens{border: 0;float: left;}
.popup .window .remlens input{width: 55px;border: 0;font-size: 14px;color: #6a7485;position: relative;top:0px;left:415px;text-align: right;}


.popup .window  .mapimg{
	width: 500px;
	height: 300px;
	margin: 10px;
	float: left;
}
	</style>
  </head>
  <script type="text/javascript">
  $(document).ready(function () {
	//将标注添加到地图中
	  $("#showmap").click(function () {
			choiceCoord("wx-p", "119.316634", "26.058567");
			$(".close").click(function () {
	            $("#wx-p").hide();
	        });
	        $(".popup-bg").click(function () {
	            $("#wx-p").hide();
	        });
	        $(".anniu-r").click(function () {
	            $("#wx-p").hide();
	        });
	        $(".anniu-l").click(function () {
	            $("#wx-p").hide();
	        });
	  });
  });
  </script>
  <body>
    <a id="showmap">预览地图</a>  <br>
    <!--显示地图弹窗-->
	<div class="popup" id="wx-p">
		<div class="popup-bg"></div>
		<div class="window">
			<p class="title">
				标注公司位置<span class="close"></span>
			</p>
			<div class="c">
				<div id="allmap2" class="mapimg"></div>
				<div style="display: none">
					<p>经度：<input id="jd" class="input-style-3" type="text" placeholder="经度" /></p>
					<p>纬度：<input id="wd" class="input-style-3" type="text" placeholder="纬度" /></p>
				</div>
			</div>
			<div class="anniu  clearfix " style="margin-top:362px;">
				<a class="anniu-l">确定</a> <a class="anniu-r" style="cursor:pointer">取消</a>
			</div>
		</div>
	</div>
  </body>
</html>
