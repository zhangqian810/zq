//js/products.js
$(function(){
	var divPages=document.getElementById("pages");
	var ulProductList=document.getElementById("product-list");
	//var divPages = $("#pages");
	//var ulProductList = $("#product-list");
	function loadPage(pno=0){//每点击页数，多次调用
		var kw=location.search.split("=")[1];
		$.ajax({
			type:"get",
			url:"data/products/getProductsByKw.php",
			data:"pno="+pno+"&kw="+kw,
			dataType:"json",
			success:function(output){
				var {products,pageCount}=output;
				var html="";
				for(var p of products){
					var {lid,pic,price,title}=p;
					html+=`<li>
						<a href="javascript:;">
							<img src="${pic}">
						</a>
						<p>
							<a href="#">${title}</a>
						</p>
						<div id="list-desc">
							<span>¥${parseFloat(price).toFixed(2)}</span>
							<span class="yd rf">
								<a href="product_details.html?lid=${lid}">预定</a>
							</span>
						</div>
					</li>`;
				}
				ulProductList.innerHTML=html;
				//ulProductList.html(html);
				//分页码
				var html=`<a href="javascript:;" class="previous">上一页</a>`;
				for(var i=0; i<pageCount;i++){
					if(i===pno)
						html+=`<a href="javascript:;" class="current">${i+1}</a>`;
					else
						html+=`<a href="javascript:;">${i+1}</a>`;
				}
				html+=`<a href="javascript:;" class="next">下一页</a>`;
				divPages.innerHTML=html;	
				//divPages.html(html);	
				var aPrev=document.querySelector("#pages>a.previous"),
					aNext=document.querySelector("#pages>a.next");
				if(pno===0) aPrev.className+=" disabled";
				if(pno===pageCount-1) aNext.className+=" disabled";
			}
		});
	}
	loadPage();
	//单击事件（分页）
	divPages.onclick=function(e){
		var tar=e.target;
		if(tar.nodeName==="A"&&tar.className.indexOf("disabled")==-1&&tar.className!=="current"){
			if(tar.className.indexOf("previous")!=-1){
				var curra=document.querySelector("#pages>a.current");
				var pno=curra.innerHTML-2;
			}else if(tar.className.indexOf("next")!=-1){
				var curra=document.querySelector("#pages>a.current");
				var pno=parseInt(curra.innerHTML);
			}else{
				var pno=tar.innerHTML-1;
			}
			loadPage(pno);
		}
	}

	//商品条件筛选
	var oDivLength = [];
	var div = document.getElementsByTagName('div');
	var divSpan = document.getElementsByTagName('span');
	//判断有几个列表
	for (var i = 0; i < div.length; i++) {
		div[i].index = i;
	}
	for (var i = 0; i < divSpan.length; i++) {
		divSpan[i].onclick = function() {
			oDivLength[this.parentElement.index] = this.innerText;
			var oChild = this.parentElement.children;
			for (var j = 0; j < oChild.length; j++) {
				oChild[j].className = '';
			}
			this.className = 'mystyle'; //已选中的当前列的当前元素添加样式
			document.getElementById('yi').innerHTML = '';
			for (var m = 0; m < oDivLength.length; m++) { //放到已选择里面
				if (oDivLength[m] == '' || oDivLength[m] !== undefined) {
					var para = document.createElement("span");
					var node = document.createTextNode(oDivLength[m]);
					para.appendChild(node);
					document.getElementById('yi').appendChild(para);
				}
			}
		}
	}
});


