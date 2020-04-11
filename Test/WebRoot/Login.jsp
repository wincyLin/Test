<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:include page="public_head.jsp" flush="true"></jsp:include>
  <body>
  
   <div style="position:absolute;border:3px solid #ffc0cb;
   width:67%;height:300px;margin-left:14rem;padding-top:8rem;padding-bottom:0;margin-top:2rem;margin-bottom:2rem;">
  
   <form action="./servlet/LoginServlet">
  
   <table align="center" style="background-color:white;" >
  <tr>
  <td>*Name:</td>
  <td><input type="text" id="username" 
   name="username"/></td>
 
  </tr>
  
    <tr>
   <tr>
  <tr>
  <td>*Password:</td>
  <td><input type="password" id="password" 
  name="password"></td>
  </tr>
  <tr>

   <tr>
  <tr>
  <td colspan="2"><input type="submit" 
  id="submit" value="Login" style="margin-left:9rem;margin-top:2rem;border-radius:0.5rem 0.5rem 0.5rem 0.5rem;padding:0.4rem;">
  </td>
  </tr>
  </table>
   
 
   </form>
   
  
   
   </div>
   
  </body>
</html>
