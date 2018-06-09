//js/index.js
//广告轮播
$(function(){
	var $ul=$("#banner>.banner-img");
	var $ulIds=$(".indicators");//原点指示器
	var LIWIDTH=1920,interval=500,wait=3000,moved=0,timer=null;
	$.ajax({
		type:"get",
		url:"data/index/getCarousel.php",
		dataType:"json",
		success:function(data){
			var html="";
			for (var c of data){
				var {img, href}=c;
				html+=`<li>
				  <a href="${href}">
					<img src="${img}">
				  </a>
				</li> `;
			}
			var {img, href}=data[0];
			html+=`<li>
				<a href="${href}">
					<img src="${img}">
				</a>
			</li> `;
			$ul.html(html).css("width",LIWIDTH*(data.length+1));
			$ulIds.html("<li></li>".repeat(data.length)).children(":first").addClass("hover");//一句话搞定原点指示器
			autoMove();
		}
	});
	function autoMove(){
		timer=setInterval(function(){
			move();
		},wait);
	}
	function move(){
		moved++;
		$ul.animate({
			left:-moved*LIWIDTH
		},interval,function(){
			if(moved==$ul.children().length-1){//data.length
				$ul.css("left",0)
				moved=0;
			}
			$ulIds.children(":eq("+moved+")").addClass("hover")
				.siblings().removeClass("hover");//原点指示器跟着moved变化
		})
	}
	$("#banner").mouseenter(function(){
		clearInterval(timer);
		timer=null;
	}).mouseleave(function(){
		autoMove();
	});
	$ulIds.on("click","li",function(){
		var $li=$(this);
		var i=$li.index();
		moved=i;
		$ul.stop(true).animate({
			left:-moved*LIWIDTH
		},interval,function(){
			$ulIds.children(":eq("+moved+")").addClass("hover")
				.siblings().removeClass("hover");//鼠标选择原点，图片跟着变化
		})
	});
	var $aLeft=$(".ck-left"),//左右箭头
		$aRight=$(".ck-right");
	$aRight.click(function(){
		if(!$ul.is(":animated")){
			move();
		}
	});
	$aLeft.click(function(){
		if(!$ul.is(":animated")){//防止动画叠加
			if(moved==0){
				moved=$ul.children().length-1;
				$ul.css("left",-moved*LIWIDTH);
			}
			moved--;
			$ul.animate({
				left:-moved*LIWIDTH
			},interval,function(){
				$ulIds.children(":eq("+moved+")").addClass("hover")
					.siblings().removeClass("hover");
			})	
		}
	});
});
//主体产品数据部分
$(function(){
	$.ajax({
		type:"get",
		url:"data/index/getIndexProducts.php",//获取产品数据
		dataType:"json",
		success:function(data){
			//爆款线路
			var selectBox = $("#select-box");
			var html="";
			for(var i=0;i<10;i++){//前十个数据
				var {lid,pid,title,type,cities,pic,price,href}=data[i];
					html+=`<li>
						<a href="${href}">
							<div class="pic_box">
								<img src="${pic}">
								<span>
									<i>¥</i>
									<em>${parseFloat(price).toFixed(2)}</em>
									起
								</span>
								<div class="meng_img"></div>
							</div>
							<div class="detail_box">
								<p>${title}</p>
								<div>
									<span>${type}</span>
									<em>${cities}</em>
								</div>
							</div>
						</a>
					</li>`;
			}
			selectBox.html(html);
			
			//游周边
			var zbList = $("#zb-list");
			var html="";
			for(var i=10;i<17;i++){//7个数据
				var {pid,title,type,cities,pic,price,href}=data[i];
					if(pid==11){
						html+=`<li class="w464_li">
							<a href="${href}">
								<div class="pic_box">
									<img src="${pic}">
									<em>${type}</em>
									<div class="meng_img"></div>
								</div>
								<div class="intro_box">
									<p>${title}</p>
									<div>
										<span>${cities}</span>
										<em>
											<b>¥</b>
											<i>${parseFloat(price)}</i>
											起
										</em>
									</div>
								</div>
							</a>
						</li>`;
					}else{
						html+=`<li>
							<a href="${href}">
								<div class="pic_box">
									<img src="${pic}">
									<em class="">${type}</em>
									<div class="meng_img"></div>
								</div>
								<div class="detail_box">
									<p>${title}</p>
									<div>
										<span>${cities}</span>
										<em>
											<b>¥</b>
											<i>${parseFloat(price)}</i>
											起
										</em>
									</div>
								</div>
							</a>
						</li>`;
					}	
				}
			zbList.html(html);
			
			//攻略
			var ulList = $("#ul-list");
			var html="";
			for(var i=17;i<data.length;i++){
				var {lid,pid,title,type,cities,pic,price,href}=data[i];
					html+=`<li>
						<a href="${href}">
							<div class="picture">
								<img src="${pic}" class="picture">
							</div>
							<div class="intro_box">
								<p>${cities}</p>
								<span>${title}</span>
							</div>
						</a>
					</li>`;
			}
			ulList.html(html);
		}		
	});
});