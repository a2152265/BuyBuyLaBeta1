/*
 	思路：
 		第一步：当页面加载完后，根据本地的数据，动态生成表格（购物车列表）
 			  获取所要操作的节点对象
 			 判断购物车中是否有数据？
 			 	有：
 			 		显示出购物列表
 			 	没有：
 			 		提示购物车为空
 		第二步：当购物车列表动态生成后，获取tbody里所有 的checkeBox标签节点对象，看那个被选中就获取对应行小计进行总价格运算。
 		第三步：
 			为每一个checkbox添加一个onchange事件，根据操作更改总价格
 		第四步：全选
 		第五步：
 			为加减按钮添加一个鼠标点击事件
 			更改该商品的数量
 		第六步：删除
 			获取所有的删除按钮
 			为删除按钮添加一个鼠标点击事件
 			删除当前行，并更新本地数据
 */

             var listObj = getAllData();
             console.log(listObj)
             var table = document.getElementById("table")
             var box = document.getElementById("box")
             var tbody = document.getElementById("tbody");
             var totalPrice = document.getElementById("totalPrice");
             var allCheck = document.getElementById("allCheck");
             
             if(listObj.length == 0) { //购物车为空
                 box.className = "box";
                 table.className = "hide";
             } else {
                 box.className = "box hide";
                 table.className = "";
                 for(var i = 0, len = listObj.length; i < len; i++) {
                     var tr = document.createElement("tr");
                     tr.setAttribute("pid", listObj[i].pid);
                         //{"pid":值,"pImg":值,"pName":值,"pDesc":值,"price":值,"pCount":1},
                     tr.innerHTML = 
                         '<td>' +
                         '<img src="' + listObj[i].pImg + '" alt="" />' +
                         '</td>' +
                         '<td>' +
                         listObj[i].pName +
                         '</td>' +
                         '<td>' +
                         listObj[i].pCount +
                         '</td>' +
                         '<td>' +
                         'NT<span>' + listObj[i].price + '</span>' +
                         '</td>' +
                         '<td>' +
                         'NT<span>' + listObj[i].price * listObj[i].pCount + '</span>' +
                         '</td>'  ;
                     tbody.appendChild(tr);
                 }
             }
           
        
            
             totalPrice.innerHTML = getTotalPrice();
             
             /*
                  功能：计算总价格
              */
             function getTotalPrice() {
                var sum = 0;
                for(var i = 0, len = listObj.length; i < len; i++) {
                    var qq=listObj[i].price * listObj[i].pCount;
                    sum+=qq;
                    console.log(typeof qq,qq,sum)
            
                }
                return sum;
             }
           
    
             var dels = document.querySelector(".submit"); //一组删除按钮
          
                 
              
             
                 dels.onclick = function() {
                    for(i=0;i<=2*listObj.length+1;i++){
                    var tr = this.parentNode.parentNode.parentNode.childNodes[3].childNodes[3].childNodes[i+1];
                    console.log(tr)
                    var pid = tr.getAttribute("pid")
               
                        
                        listObj = deleteObjByPid(pid);
                        console.log(listObj.length)

                     }
                  
                    
             }
  
         