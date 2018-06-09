//js/details.js
(function(){
	if(location.search.indexOf("lid")!=-1){
		var lid=location.search.split("=")[1];
		$.ajax({
			type:"get",
			url:"data/products/getProductById.php",
			data:"lid="+lid,
			dataType:"json"
		}).then(function(output){
			var {product,pics,specs}=output;
			var {title, subtitle, price, promise}=product;
			document.querySelector("#show-details>h1")
				.innerHTML=title;
			document.querySelector("#show-details>h3>a")
				.innerHTML=subtitle;
			document.querySelector(
				"#show-details>div.price>div.stu-price>span"
			).innerHTML="¥"+parseFloat(price).toFixed(2);
			document.querySelector(
				"#show-details>div.price>div.promise>b"
			).innerHTML="服务承诺:"+promise;
	}
})();