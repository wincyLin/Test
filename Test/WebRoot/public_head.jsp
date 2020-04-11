<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'public_head.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/public_head.css">
	

  </head>
  <script type="text/javascript">
  //编写一个方法getMyName
  function getMyName(){
  //1.声明一个js变量，用来保存session中得到的用户名
  var myName="<%=session.getAttribute("username")%>";
  if(myName=="null"){
  document.getElementById("login").innerHTML="<a href='http://localhost:8080/Test/Login.jsp'>[Login]</a>";
  
  }else{
  document.getElementById("login").innerHTML="Welcome:"+myName+"&nbsp;<a href='http://localhost:8080/Test/servlet/LogoutServlet'>[Logout]</a>&nbsp;";
  }
  
  
  }
  
  </script>
  <body onload="getMyName()">
    <div id="head_div1" style="	font:13px simsun;text-align:right;height:30px;width:100% auto;background-color:#ffc0cb;line-height:30px;">
    <a href="" id="head_login" style="color:#222222;margin-right:1rem;">◎My Club◎</a>
    <span id="login" style="color:#222222;margin-right:0.5rem;">Login</span>
    <a href="<%=basePath%>register.jsp" style="color:#222222;margin-right:1rem;">Join</a>
    <a href="" style="color:#222222;margin-right:1rem;">★My Favorites</a>
    <a href="servlet/SP_carInfoServlet"  id="head_dingd" style="color:#222222;margin-right:1rem;">Buy</a>
    
    </div>
    
    <div  id="head_div3" style="margin-top:1rem;text-decoration:none;">
    <a href="" style="font:3rem simsun;color:#000000;"><b>TOPSHOP</b></a>
 
    </div>
    
    <div id="head_div2" style="margin-bottom:2rem;">
    <a href="<%=basePath%>servlet/IndexServlet"  class="head_a2">COVER</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=1&info_sous=" class="head_a2">NEW IN</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=1&info_sous=" class="head_a2">CLOTHING</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=2&info_sous=" class="head_a2">JEANS</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=3&info_sous=" class="head_a2">SHOES</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=4&info_sous=" class="head_a2">BAGS</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=5&info_sous=" class="head_a2">BEAUTY</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=6&info_sous=" class="head_a2">SALE</a>
    <a href="<%=basePath%>servlet/IndexServlet?type=7&info_sous=" class="head_a2">STYLE</a>
    
<hr style="margin-top:2rem;margin-bottom:2rem;">
    
    </div>
  </body>
</html>
