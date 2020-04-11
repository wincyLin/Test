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
    
    <title>My JSP 'SP_xiangQing.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/SP_xiangQing.css">
	

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
  if(a<10){
  a=parseInt(a)+1;
  //修改input中value值
  document.getElementById("input_number").value=a;
  
  }
  }
  
  function go_sp_car(){
  var uri="http://localhost:8080/Test/servlet/SP_carServlet?id=";
  var id=<%=request.getParameter("id")   %>
  var number=document.getElementById("input_number").value;
  location=uri+id+"&number="+number;
  
  
  }
  
  
  </script>
  
  
  
  
  
  <jsp:include page="public_head.jsp" flush="true"></jsp:include>
  <body>
  <div class="xiangqing" style="margin-top:9rem;margin-bottom:22rem;">
        <c:forEach var="c" items="${sp_info_list }" varStatus="status">
        <div class="sp_info" style="margin-left:8rem;">${c.sp_info }</div>
        <div class="info_td" style="margin-left:6rem;">
        <img alt="找不到图片" src="<%=basePath %>/img/${c.sp_img } " 
        class="sp_img">
        </div>
        <table style="margin-left:6rem;">
        <tr>
        <td class="td_info">Name：Cetaphil丝塔芙洗面奶</td>
        </tr>
        <tr>
        <td class="td_info">Birthplace：France</td>
        </tr>
        <tr>
        <td class="td_info">The old price：￥${c.old_price }</td>
        </tr>
        <tr>
        <td class="red_info">The new price：￥${c.new_price }（0.7折）</td>
        </tr>
        <tr>
        <td class="td_info">Left：100 Immediate delivery after the order</td>
        </tr>
        <tr>
        <td class="red_info">
      Sales promotion information: the product is fully reduced, <br>
      and the purchase activity merchandise can be reduced by 100 yuan<br>
       per 300 yuan<br>
        </td>
        </tr>
        <tr>
        <td class="bom_info">
       Buy：<button id="but1" name="but1" onclick="javascript:sub();">-</button>
        <input type="text" name="input_number" value="1" id="input_number" 
        disabled="disabled" style="width:60px;text-align:center">
        <button id="but2" name="but2" onclick="javascript:add();" >+</button>
        </td>
        </tr>
        
         <tr>
        
        <td class="bom_info">
        <a href="javascript:go_sp_car();" ><img alt="找不到图片" src="<%=basePath %>img/add_car.png " ></a>
        </td>
        </tr>
        
        
        </table>
              
              </c:forEach>
              </div>

  </body>
</html>
