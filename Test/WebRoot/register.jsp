<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/register.css">
	

  </head>
 <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  $(function(){
  	//usename的失去焦点事件
  	$("#username").blur(function(){
  		//alert("5555");
  		
  	//1.取得input中的数据
  	var username = $("#username").val();
  	
  	//2.定义正则表达式的变量：邮箱正则
  	var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
  	//var reg = /^[0-9]/;
  	//var reg=/^[0-9a-zA-Z]*?@\w+\.[a-zA-Z]*$/;
  	//定义一个标志位
  	var flag = false;
  	var messiage = "";
  	if(reg.test(username)){
  	//alert("成功");
  		messiage = "Congratulations!!";
  		//修改标志位
  		flag = true;
  	}else{
  	//alert("失败");
  		messiage = "Not legal!!";
  	}
  	if(flag){
  		//$("#user_reg").text(messiage).css('color','#2a00ff').css('font','12px 宋体');
  		//做ajax操作（异步操作，局部刷新）,即判断输入用户名是否存在
  		//ajax,load,get,post
  		//准备传输的数据，json数据，
  	var json = {username:$("#username").val()};//得到用户名
  	$.post("./servlet/UserAjaxServlet",json,function(data,textStatus){
  	if(data=="true"){
  		$("#user_reg").text("Congratulations!!").css('color','#2a00ff').css('font','12px 宋体');
  	}else{
  		$("#user_reg").text("This name has registered！！").css('color','red').css('font','12px 宋体');
  	}
  		
  	});
  		
  	}else{
  		$("#user_reg").text(messiage).css('color','red').css('font','12px 宋体');
  	}
  	
  		
  	});
  		
  		$("#password").blur(function(){
  	
		  	//1.取得input中的数据
		  	var password = $("#password").val();
		  	
		  	//2.定义正则表达式的变量：邮箱正则
		  	var reg = /^\d{6,12}$/;
		  	//var reg = /^[0-9]/;
		  	//var reg=/^[0-9a-zA-Z]*?@\w+\.[a-zA-Z]*$/;
		  	//定义一个标志位
		  	var flag = false;
		  	var messiage = "";
		  	if(reg.test(password)){
		  	//alert("成功");
		  		messiage = "";
		  		//修改标志位
		  		flag = true;
		  	}else{
		  	//alert("失败");
		  		messiage = "Please input 6-12 bit of numbers";
		  	}
		  	if(flag){
		  		$("#password_reg").text(messiage).css('color','#2a00ff').css('font','12px 宋体');
		  	}else{
		  		$("#password_reg").text(messiage).css('color','red').css('font','12px 宋体');
		  	}
  	});
  	//判断输入密码和确认密码是否一致
	  	$("#password1").blur(function(){
			var password = $("#password").val();
			var password1 = $("#password1").val();
			if(password != password1){
				$("#pw").text("Two cipher inconsistencies！").css('color','red').css('font','12px 宋体');
			}else{
				$("#pw").text("Confirmed").css('color','#2a00ff').css('font','12px 宋体');
			}
		});
  });
  
  
  
  </script>
   <jsp:include page="public_head.jsp"></jsp:include>
  <body>
  
  <div style="border:3px solid #ffc0cb;width:67%;margin-left:13rem;margin-bottom:3rem;margin-top:4rem;height:400px;padding-top:3rem;">
   <div id="text1">Personal user information </div>
  
 <div id="form1">
  <form action="./servlet/UserServlet" method="post">
  <table align="center" >
  <tr>
  <td>*Account number:</td>
  <td><input type="text" id="username"  name="username"/></td>
  <td id="user_reg"></td>
  </tr>
  <tr><tr>
  
  <tr>
  <td>*password:</td>
  <td><input type="password" id="password" name="password"></td>
  <td id="password_reg"></td>
  </tr>
<tr><tr>
  <tr>
  <td>*Confirm the password:</td>
  <td><input type="password" id="password1" name="password1"></td>
  <td id="pw"></td>
  </tr>
  <tr>
  <td colspan="2"><input type="submit" id="submit" value="Receipe and join us!" style="margin-left:11rem;margin-top:2rem;border-radius:0.5rem 0.5rem 0.5rem 0.5rem;">
  </td>
  </tr>
  </table>
  
  
  </form>
  
  </div>
   </div>
   
  </body>
  <jsp:include page="public_bottom.jsp"></jsp:include>
</html>
