<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
	#allmap {
		width: 100%;
		height: 470px;
		overflow: hidden;
		margin: 0;
	}
	
	#l-map {
		height: 100%;
		width: 78%;
		float: left;
		border-right: 2px solid #bcbcbc;
	}
	
	#r-result {
		height: 100%;
		width: 20%;
		float: left;
	}
	
	.myclass {
		height: 50px;
		width: 150px;
		font-size: 12px;
		line-height: 22px;
	}
	
	.bigdiv {
		width: 100%;
		height: 100%;
		margin: 0 auto;
	}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=B3f7707c25da5b29a6ff69618788a296"></script>
<title>百度地图api_标注动画_易学就汇_最优秀的校园人才都在这里找工作！</title>
</head>
<body>
	<div class="bigdiv">
		<input type="hidden" id="longitude" name="longitude" value="${coord.longitude}"/><!-- 经度 -->
		<input type="hidden" id="latitude" name="latitude" value="${coord.latitude}"/><!-- 纬度 -->
		<div id="allmap"></div>
	</div>
	<script type="text/javascript">
		var longitude = document.getElementById("longitude").value;//经度
        var latitude = document.getElementById("latitude").value;//纬度
		var map = new BMap.Map("allmap");
		var point = new BMap.Point(longitude, latitude);
		map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
		map.centerAndZoom(point, 30);
		map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
		var marker = new BMap.Marker(point); // 创建标注
		map.addOverlay(marker); // 将标注添加到地图中
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		//创建信息窗口
		var sContent = "<div class='myclass'>企业：${companyName} <br>地址：${companyAddr}<a style=\"color:#7777cc;position:absolute;top:5px;right:20px;\" href=\"http://api.map.baidu.com/direction?region=北京市&amp;origin_region=北京市&amp;destination_region=北京市&amp;origin=2$$$$$$中关村一街$$0$$$$&amp;destination=2$$$$$$魏公村$$0$$$$&amp;output=html&amp;mode=driving&amp;src=baidu_map_jsapi\" target=\"_blank\">到百度地图查看»</a>";
		var infoWindow = new BMap.InfoWindow(sContent); // 创建信息窗口对象
		map.centerAndZoom(point, 18);
		map.addOverlay(marker);
		marker.addEventListener("click", function() {
			this.openInfoWindow(infoWindow);
			//图片加载完毕重绘infowindow
			document.getElementById('imgDemo').onload = function() {
				infoWindow.redraw();
			}
		});

		//点击生成经纬度
		/*map.addEventListener("click",function(e){
		 AlertMsg(e.point.lng + "," + e.point.lat);
		 });*/
	</script>
</body>
</html>