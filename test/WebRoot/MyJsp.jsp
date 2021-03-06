<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:500px;width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=E6335695dfe725b91b8dfbce354a5e69"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>公交查询</title>
</head>
<body>
	<div id="l-map"></div>
	<div id="driving_way">
		<select>
			<option value="0">最少时间</option>
			<option value="1">最少换乘</option>
			<option value="2">最少步行</option>
			<option value="3">不乘地铁</option>
		</select>
		<input type="button" id="result" value="查询"/>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");         
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 14);
	map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
	var start = "三明学院";
	var end = "三元区";
	var routePolicy = [BMAP_TRANSIT_POLICY_LEAST_TIME,BMAP_TRANSIT_POLICY_LEAST_TRANSFER,BMAP_TRANSIT_POLICY_LEAST_WALKING,BMAP_TRANSIT_POLICY_AVOID_SUBWAYS];
	var transit = new BMap.TransitRoute(map, {
			renderOptions: {map: map},
			policy: 0
		});
	$("#result").click(function(){
		map.clearOverlays(); 
		var i=$("#driving_way select").val();
		search(start,end,routePolicy[i]); 
		function search(start,end,route){ 
			transit.setPolicy(route);
			transit.search(start,end);
		}
	});
</script>
