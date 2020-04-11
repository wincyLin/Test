<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'public_bottom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="public-bottom.css">
	

  </head>
  
  <body>
    <div style="text-align:center;background-color:#ffc0cb;width:100%;height:25rem;position:absolute;margin-top:7rem;bottom:-2840px;">
 <div class="card-footer" >

 <span style="font:4rem simsun;color:black;text-align:center;margin-left:-8rem;margin-top:1rem;position:absolute;">MAGAZINE</span>

 <div style="float:left;text-align:center;margin-left:5rem;">

 <img alt="找不到图片" src="img/xx2.jpg" style="margin:6rem 2rem;display:block;width:14rem;height:11rem;border:3px  solid  #efefef; ">
 <a href="" >
 <span style="font:16px simsun;color:black;margin-top:-4rem;display:block;">GOOD LOOKS</span><br>
   <span style="font:16px simsun;color: black;">READ THIS STORY</span>
 </a>
 </div>
 
<div style="float:right;text-align:center;margin-right:6rem;">
  <img alt="找不到图片" src="img/xx1.jpg" style="margin:6rem 2rem;display:block;width:14rem;height:11rem;border:3px  solid  #efefef;">
  <a href="">
  <span style="font:16px simsun;color:black;margin-top:-4rem;display:block;">THE TRYOUT</span><br>
   <span style="font:16px simsun;color:black;">READ THIS STORY</span>
  </a>
  </div>
  
  </div>
  
  
  <div style="float:right;text-align:center;margin-right:9rem;">
  <img alt="找不到图片" src="img/xx3.jpg" style="margin:6rem 2rem;display:block;width:14rem;height:11rem;border:3px  solid  #efefef;">
  <a href="">
  <span style="font:16px simsun;color:black;margin-top:-4rem;display:block;">TRAVEL</span><br>
   <span style="font:16px simsun;color:black;">READ THIS STORY</span>
  </a>
  </div>
  
  </div>

  </body>
</html>
