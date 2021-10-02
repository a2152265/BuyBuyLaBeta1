var listObj = getAllData();
console.log(listObj)
var table = document.getElementById("table")
var box = document.getElementById("box")
var tbody = document.getElementById("tbody");
var totalPrice = document.getElementById("totalPrice");
var allCheck = document.getElementById("allCheck");

if (listObj.length == 0) { //购物车为空
	box.className = "box";
	table.className = "hide";
} else {
	box.className = "box hide";
	table.className = "";
	for (var i = 0, len = listObj.length; i < len; i++) {
		var tr = document.createElement("tr");
		tr.setAttribute("pid", listObj[i].pid);
		//{"pid":值,"pImg":值,"pName":值,"pDesc":值,"price":值,"pCount":1},
		tr.innerHTML =
		
			
			'<td>' +
			'<img src="' + listObj[i].pImg + '" alt="" />' +
			'</td>' +
			'<td name="pName">' +
			listObj[i].pName +
			'</td>' +
			'<td name="pCount">' +
			listObj[i].pCount +
			'</td>' +
			'<td>' +
			'NT<span name="price">' + listObj[i].price + '</span>' +
			'</td>' +
			'<td>' +
			'NT<span>' + listObj[i].price * listObj[i].pCount + '</span>' +
			'</td>';
			
		tbody.appendChild(tr);
	}
}


console.log("pid="+listObj[0].pid)
totalPrice.innerHTML = getTotalPrice();

/*
	 功能：计算总价格
*/
function getTotalPrice() {
	var sum = 0;
	for (var i = 0, len = listObj.length; i < len; i++) {
		var qq = listObj[i].price * listObj[i].pCount;
		sum += qq;
		console.log(typeof qq, qq, sum)

	}
	return sum;
}


 

