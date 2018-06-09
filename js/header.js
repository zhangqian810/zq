(function(){
	//引入头部文件
	$("#header").load("header.html",function(){
		var link=document.createElement("link");
		link.rel="stylesheet";
		link.href="css/header.css";
		document.head.appendChild(link);

	//index.html的登录操作
		$.ajax({
			type:"get",
			url:"data/users/islogin.php",
			dataType:"json",
			success:function(data){
				if(data.ok==0){
					$("#loginList").show().next().hide();
				}else{
					var {uname}=data;
					$("#loginList").hide().next().show()
						.find("#uname").html(uname);
				}
			}
		});

	//首页登录事件
		$("#btnLogin").click(function(e){
			e.preventDefault();
			location.href="login.html?back="+location.href;
		});

	//退出事件
		$("#btnSignout").click(function(e){
			e.preventDefault();
			$.ajax({
				type:"get",
				url:"data/users/signout.php",
				success:function(){
					location.reload(true);
				}
			})
		});

	//头部固定
		$(window).scroll(function(){
			var scrollTop=$(window).scrollTop();
			if(scrollTop>=200){//屏幕滑动到200出现固定头部样式
				$(".header-bar").addClass("fixed_nav");
			}else
				$(".header-bar").removeClass("fixed_nav");
		});

	//输入框搜索：从一个页面跳转到另一个页面，通过字符串拼接方法传递，即？+传递的参数
		var btnSearch=document.querySelector("#top-input>[data-trigger=search]");//querySelector:只查找一个元素
		var txtSearch=document.getElementById("txtSearch");//按id查询
		btnSearch.onclick=function(){
			if(txtSearch.value.trim()!=="")//trim:去掉前后空格
				location.href="products.html?kw="+txtSearch.value.trim();//地址栏里的空格。Unicode码编码成%20
		}

	//键盘回车
		txtSearch.onkeyup=function(e){
			if(e.keyCode===13)//ASSC码中，回车是13
				btnSearch.onclick();
		}
	//搜索跳转后，在跳转页搜索框仍然存在搜索内容
		if(location.search.indexOf("kw=")!=-1){
			txtSearch.value=decodeURI(location.search.split("=")[1]);
		}
		
	//搜索帮助功能
		var $txtSearch=$("#txtSearch"),
			$shelper=$("#shelper");
		$txtSearch.keyup(function(e){
			if(e.keyCode!=13){
				if(e.keyCode==40){
					if(!$shelper.is(":has(.focus)")){
						$shelper.children(":first").addClass("focus");
					}else{
						var $next=$shelper.children(".focus").removeClass("focus").next();
						if($next.length>0)
							$next.addClass("focus");
						else
							$shelper.children(":first").addClass("focus");
					}
				}else if(e.keyCode==38){
					if(!$shelper.is(":has(.focus)")){
						$shelper.children(":first").addClass("focus");
					}else{
						var $prev=$shelper.children(".focus").removeClass("focus").prev();
						if($prev.length>0)
							$prev.addClass("focus");
						else
							$shelper.children(":last").addClass("focus");
					}
				}else{
					if($txtSearch.val().trim()!==""){
						$shelper.show();
						$.ajax({
							type:"get",
							url:"data/products/shelper.php",
							data:{kw:$txtSearch.val()},
							dataType:"json",
							success:function(data){
								if(data.length>0){
									var html="";
									for(var item of data){
										var {title, price}=item;
										html+=(`<li title="${title}">
											<div class="search-item" title="${title}">${title}</div>
											<i>价格:${price}</i>
										</li>`);
									}
									$shelper.html(html);
								}else{
									$shelper.html(`<li title="未找到">
									  <div class="search-item" title="未找到">未找到</div>
									</li>`);
								}
							}
						})
					}else{
						$shelper.hide();
					}
				}
			}
		}).blur(function(){
			$shelper.hide();  //失去焦点,鼠标离开输入框,搜索框隐藏
		}).focus(function(){
			$txtSearch.keyup();
		})
	});
})();