$(function(){
	var map = new BMap.Map("container");
    // 创建地图实例
    var point = new BMap.Point(120.736818,31.269961);
    // 创建点坐标
    map.centerAndZoom(point, 19); //1~17
    // 初始化地图，设置中心点坐标和地图级别

    var marker = new BMap.Marker(point);        // 创建标注
    map.addOverlay(marker);                     // 将标注添加到地图中
    //导航控件
    map.addControl(new BMap.NavigationControl());
    //缩放控件
    map.addControl(new BMap.ScaleControl());
    //概览图控件
    map.addControl(new BMap.OverviewMapControl());
    //地图类型
    map.addControl(new BMap.MapTypeControl());
});