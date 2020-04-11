<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SP_car.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" >
  
    function sub(){
//alert("11111");
  //取得input中的数字
  var a=document.getElementById("input_number").value;
  //var input=document.getElementById("input_number");
  //判断数字是否大于1
  if(a>1){
  a=parseInt(a)-1;
  //修改input中value值
  document.getElementById("input_number").value=a;
  }
  }
  
   function add(){
  //alert("11111");
  //取得input中的数字
  var a=document.getElementById("input_number").value;
  //var input=document.getElementById("input_number");
  //判断数字是否小于10
  if(a<50){
  a=parseInt(a)+1;
  //修改input中value值
  document.getElementById("input_number").value=a;
  
  }
  }
 function deleteSP_car(id)
{
	//获取当前行的元素对象
	var trObj = document.getElementById(id);
	//询问是否真的要删除吗？
	if(window.confirm("你确定要删除吗？你真的不要了？你可想好了？"))
	{
		//如果单击确定，则返回true
		trObj.parentNode.removeChild(trObj);
		//调用商品统计函数
		total();
	}
}


function total(id){
/*计算总价格*/
var totalPrice=0;
for(var a=1;a<3;a++){
var quantity=document.getElementById("&{c.number}"+a).value;
var price=document.getElementById("&{c.new_price}"+a).value;
var smallTotal=quantity*price;
totalPrice=totalPrice+smallTotal;
}
var total=document.getElementById("total");
total.innerHTML=totalPrice;
}
  document.getElementById("total").innerHTML = "¥"+total.toFixed;
  
//网页加载完成，调用价格统计函数，该函数不能带括号，因为是传地址，而不是传数值
window.onload = total;
  

  
  </script>
  <jsp:include page="public_head.jsp" flush="false"></jsp:include>
  <body>
        
        
<div id="app" class="container">
		<h2 class="title" style="margin-top:6rem;margin-bottom:1rem;display:block;margin-left:6rem;">Shopping Cart</h2>
		<table class="tab" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:-9rem;">
		<thead>
				<tr style="position:absolute;top:350px;">
					<th colspan="2" style="display:block;margin-top: -1.5rem;margin-left:-25rem; ">Message</th>
					<th style="width: 14%;display:block;margin-top: -1rem;padding-left:26.5rem;">Unit Price</th>
					<th style="width: 14%;display:block;margin-top: -1rem;padding-left:36rem;">Number</th>
					<th  style="width: 14%;display:block;margin-top: -1rem;padding-left:50rem;">Total amount</th>

				</tr>
			</thead>
			
				
			
			<tbody style="display:block;margin-left:7rem;margin-bottom:1rem;margin-right:7rem;">
			
		<c:forEach var="c" items="${sp_carinfoList}" varStatus="status" >
				<tr style="border:2px solid #ffc0cb;display:block;margin-bottom:2px;padding-right:-3rem;margin-right:3rem;">
					
					
			<td class="info_td" style="width: 10%;margin-left:2rem;">	
			<input onBlur="productCount()" type="checkbox" :checked="checkAllFlag"  style="width:12px;height:12px;margin-left:1rem;margin-top:1rem;">
              <img alt="找不到图片" src="<%=basePath %>/img/${c.sp_img } " class="sp_img" style="width:112px;height:112px;margin-left:3rem;border:3px solid #efefef;margin-bottom:1rem;margin-right:2rem;">
			 
			  <td class="info_td" style="margin-left:2rem;width:7%;margin-right:5rem;font-size:8px;">
			 	${c.sp_info}
          </td>
              
               <td class="info_td" style="width:5%;margin-left:2rem;">
              &nbsp;&nbsp;&nbsp;&nbsp;<del style="color:gray;">￥${c.old_price}</del>
              <br>
             &nbsp;&nbsp;&nbsp;&nbsp;<b>￥${c.new_price}</b> 
              </td>

               
               <td class="info_td" style="margin-left:2rem;margin-right:5rem;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="but1" name="but1" onclick="javascript:sub();">-</button><input type="text" name="input_number"  id="input_number"  value="${c.number}"
        disabled="disabled" style="width:60px;text-align:center"><button id="but2" name="but2" onclick="javascript:add();" >+</button> &nbsp;   
          </td>
              
              

              
              <td id="total" style="margin-left:2rem;margin-right:2rem;">¥&nbsp;${c.number}*${c.new_price}     
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            
              <button id="but3" name="but3" onclick="javascript:deleteSP_car();" >Delete</button></td>
		</tr>
              <c:if test="${status.count%1==0 }" >
              <tr>
              <tr>
              <br>
              <br>
              
              </c:if>
              
              </c:forEach>
              
			</tbody>
			
		
		</table>
	</div>
	
	    <div class="bar-wrapper">
            <div class="bar-right">
            <input type="checkbox" :checked="checkAllFlag" @click="checkAll" style="position:absolute;left:22%;">
				
						<span class="redcolor" style="position:absolute;left:25%;">Select all</span>&nbsp;&nbsp;
				
                <div class="piece" style="position:absolute;right:13rem;margin-right:5rem;">Selected goods:<strong class="piece_num" style="margin-right:1rem;">0</strong>piece</div>
                <div  class="total"  style="position:absolute;right:11rem;">Total: <strong class="total_text">0.00</strong></div><br>
               <br><br> <button type="button" class="btn"style="position:absolute;right:11rem;">Settlement</button><br><br>
            </div>
        </div>

	

  </body>
</html>
