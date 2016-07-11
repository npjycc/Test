function myCoord(longitude, latitude) {
	// 百度地图API功能
    var map = new BMap.Map("allmap");
    //var point = new BMap.Point(116.404, 39.915);
    var point = new BMap.Point(longitude, latitude);
    map.centerAndZoom(point, 12);
    map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
    var marker = new BMap.Marker(point);  // 创建标注
    map.addOverlay(marker);               // 将标注添加到地图中
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
}

function choiceCoord(mapId, longitude, latitude) {
	
	$("#"+mapId).show();
    // 百度地图API功能
    //var point2 = new BMap.Point(119.264721, 26.069188);
    var point2;
    if("" == longitude || "" == latitude || null == longitude || null == latitude) {
    	point2 = new BMap.Point(116.404, 39.915);
    } else {
    	point2 = new BMap.Point(longitude, latitude);
    }
    
    var marker2 = new BMap.Marker(point2);  // 创建标注
    var map2 = new BMap.Map("allmap2");  // 创建Map实例
    marker2 = new BMap.Marker(point2);  // 创建标注
    //map.centerAndZoom("福州市仓山区金山开发区金榕北路17号",18);      // 初始化地图,用城市名设置地图中心点
    map2.centerAndZoom(point2, 18);
    map2.addOverlay(marker2);
    map2.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
	map2.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
	map2.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
    marker2.enableDragging();
    marker2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    var gc = new BMap.Geocoder();//地址解析类
    marker2.addEventListener("dragend", function (e) {
        //获取地址信息
        gc.getLocation(e.point, function (rs) {
            // showLocationInfo(e.point, rs);
            $('#longitude').val(e.point.lng);
        	$('#latitude').val(e.point.lat);
        });
    });
    //单击获取点击的经纬度
    map2.addEventListener("click", function (e) {
        //map2.removeOverlay();
    	map2.clearOverlays();
        $('#longitude').val(e.point.lng);
        $('#latitude').val(e.point.lat);
        point2 = new BMap.Point(e.point.lng, e.point.lat);
        map2.centerAndZoom(point2, 18);
        marker2 = new BMap.Marker(point2);  // 创建标注
        map2.addOverlay(marker2);               // 将标注添加到地图中
        marker2.enableDragging();
        marker2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        marker2.addEventListener("dragend", function (e) {
            //获取地址信息
			gc.getLocation(e.point, function (rs) {
			// showLocationInfo(e.point, rs);
			//console.log(e.point.lng + "," + e.point.lat);
			$('#longitude').val(e.point.lng);
        	$('#latitude').val(e.point.lat);
            });
        });
    });
	
}