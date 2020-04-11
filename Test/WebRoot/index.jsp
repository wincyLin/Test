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
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index.css">
	

  </head>
  
  
   <jsp:include page="public_head.jsp" flush="true"></jsp:include>
  <body>
  <div id="booksort" align="center" style="margin-top:1rem;">
  <div id="left"style="margin-top:1rem;">
  <div class="mt">
  <strong>TYPE</strong>
  </div>
  <div class="mc" style="margin-bottom:22rem;">
  <table class="table1">
  <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=1&info_sous=">&gt;&nbsp;&nbsp;NEW IN</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=2&info_sous=">&gt;&nbsp;&nbsp;CLOTHING</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=3&info_sous=">&gt;&nbsp;&nbsp;JEANS</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=4&info_sous=">&gt;&nbsp;&nbsp;SHOES</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=5&info_sous=">&gt;&nbsp;&nbsp;BAGS</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=6&info_sous=">&gt;&nbsp;&nbsp;BEAUTY</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=7&info_sous=">&gt;&nbsp;&nbsp;SALE</a>
      </td>
  </tr>
   <tr>
      <td class="type_info"><a href="<%=basePath%>servlet/IndexServlet?type=8&info_sous=">&gt;&nbsp;&nbsp;STYLE</a>
      </td>
      </tr>
  </table>
  </div>
  </div>
  
  <div class="right"style="margin-top:1rem;">
  <div>
       <form action="./servlet/IndexServlet">
      TYPE:
       <select name="type">
       <option value="1">NEW IN</option>
       <option value="2">CLOTHING</option>
       <option value="3">JEANS</option>
       <option value="4">SHOES</option>
       <option value="5">BAGS</option>
       <option value="6">BEAUTY</option>
       <option value="7">SALE</option>
       <option value="8">STYLE</option>
       </select>
       <input type="text" id="info_sous"  name="info_sous">
       <input type="submit" id="submit" value="search">
       </form> 
  </div>
  
  <div id="sp_list" style="margin-top:1rem;margin-bottom:3rem;">
       <div id="sp_one"><b>BEAUTY</b></div>
       <div>
       <table class="sp_table" style="width:694px;">
              <tr style="margin-top:1.5rem;margin-bottom:1.5rem;">
              <c:forEach var="c" items="${sp_info_list }" varStatus="status">
              <td class="info_td" >
              <a href="<%=basePath %>servlet/IndexServlet?id=${c.id}">
              <img alt="找不到图片" src="<%=basePath %>/img/${c.sp_img } " class="sp_img"></a>
              <br>
              <span class="sp_old"><b>￥${c.old_price }&nbsp;&nbsp;</b></span><span class="sp_new"><b>￥${c.new_price }&nbsp;&nbsp;</b></span>
              <br>
              <br>
              <div class="sp_info"><a href="">${c.sp_info }</a></div>
              </td>
              <c:if test="${status.count%4==0 }">
              <tr>
              <tr>
              
              
              </c:if>
              
              </c:forEach>
              
              
              
              </tr>
       
       
       </table>
       
       
       </div>
       
       
       
       
       
       
  </div>
  </div> 
  </div>
    
  </body>
  <jsp:include page="public_bottom.jsp" flush="true"></jsp:include>
</html>
