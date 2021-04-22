<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="dao.SalaryDao" %>
<%@page import="class_package.Salary" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pay-person.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="./css/layui.css">
    <script src="./js/layui.js"></script>
	<style>
        body{
            background-color: #fff;
        }
    </style>
</head>
<body>
<%
  String re="";
  String userID=session.getAttribute("userID").toString(); 
  SalaryDao udao=null;
  Salary u=null;
  try{
     udao=new SalaryDao();
     u=udao.getOne(userID);
  }
  catch(SQLException e)
  {
     e.printStackTrace();
  }finally{
    udao.ConnClose();
  }

if(u==null)
   out.print("查找记录出错");
  else
  {
  %>
    <table class="layui-table" style="text-align: center; margin-top: 0;">
    <thead>
      <tr>
        <th>职工工资查询</th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
      </tr> 
    </thead>
    <tbody>
      <tr>
        <td>职工编号</td>
        <td>姓名</td>
        <td>所在部门</td>
        <td>工资系数</td>
        <td>基本工资</td>
        <td>工龄</td>
        <td>职务</td>
        <td>补贴</td>
        <td>合计</td>
      </tr>
     <% 
     	re+="<tr>";
        re+="<td>"+u.getId()+"</td>";
        re+="<td>"+u.getName()+"</td>";
        re+="<td>"+u.getDepartment()+"</td>";
        re+="<td>"+u.getRatio()+"</td>";
        re+="<td>"+u.getBase()+"</td>";
        re+="<td>"+u.getAge()+"</td>";
        re+="<td>"+u.getWork()+"</td>";
        re+="<td>"+u.getSubsidy()+"</td>";
        re+="<td>"+u.getAll()+"</td>";
        re+="</tr>";
        out.print(re);
     %>
    </tbody>
  </table>
        <%
  }
  %>
</html>
