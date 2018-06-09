//在线预定 日期
$("#date").datepicker({
	changeMonth:true,
	changeYear:true
}).datepicker("option",$.datepicker.regional["zh-CN"]);//翻译成中文

$(function(){
	//图片滚动
    $("#right").click(function gf(){
        $("#pan").stop();
        $("#pan").animate({
            left: "0"
        }, 20000, "linear", function() {
            $("#pan").css("left", "-2000px");
            gf();
        })
    })
    $("#left").click(function gf(){
        $("#pan").stop();
        $("#pan").animate({
            left: "-2000"
        }, 20000, "linear", function() {
            $("#pan").css("left", "0px");
            gf();
        })
    })

	//产品详情
	if(location.search.indexOf("lid")!=-1){
		var lid=location.search.split("=")[1];
		$.ajax({
			type:"get",
			url:"data/products/getProductById.php",
			data:"lid="+lid,
			dataType:"json",
			success:function(output){
				var html="";
				var divview = $("#view");
				//console.log(output);
				var {lid,pic,title,days,destination,price}=output[0];
				html+=`
					<div id="mediumDiv">
						<img src="${pic}">
					</div>
					<div id="show-details">
						<p>${title}</p>
						<p class="p-underline"></p>
						<p>行程天数:${days}</p>
						<p>目 的 地:${destination}</p>		
						<p>预 算/人:
							<span class="price">¥${parseFloat(price).toFixed(2)}</span>
						</p>
						<p>
							<button type="button" class="btn-order">预约</button>
						</p>
					</div>
				`;
				divview.html(html);
			}
		});
	}
	//在线预定
	//获取预定按钮,对话框显示
	//1.绑定点击事件
	$("#view").click(function(e){
		e.preventDefault();
		$.ajax({
			type:"get",
			url:"data/users/islogin.php",
			dataType:"json",
			success:function(data){
				if(data.ok==0){
					alert("请先登录");
					location.href="login.html?back="+location.href;
				}
			}
		});
		$(".product-jumbotron").show(200);
	});

	//2:点击取消按钮->对话框隐藏
	$("[data-action='order-cancel']").click(function(e){
		e.preventDefault();
		$(".product-jumbotron").hide(200);
	});

	//3:点击提交按钮->弹出提交成功
	$("[data-action='order-ok']").click(function(e){
		e.preventDefault();
		alert("预定成功,等待客服与您联系！");
		$(".product-jumbotron").hide();
	});
});

