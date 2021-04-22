<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="dao.DepartmentDao" %>
<%@page import="class_package.Department" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uuApart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="./css/layui.css">
  	<script src="./js/layui.js"></script>
	<style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-color: #fff;
        }
        tr>td:first-child{
            text-align: end;
        }
    </style> 
     </head>
  
  <body>
  <%
  
  String ID1=request.getParameter("ID1");
  DepartmentDao udao=null;
  Department u=null;
  try{
     udao=new DepartmentDao();
     u=udao.getOne(ID1);
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
        <form action="EditDepartment?act=modify" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
              <tr>
                <th>部门信息修改</th>
                <th></th>
              </tr> 
            </thead>
            <tbody>
              <tr>
                <td>部门编号：</td>
                <td><input type="text" name="id" id="id" readonly="readonly" value="<%=u.getId() %>"  required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 30%;"></td>
              </tr>
              <tr>
                <td>部门名称：</td>
                <td><input type="text" name="name"  id="name" required value="<%=u.getName() %>" lay-verify="required"  autocomplete="off" class="layui-input" style="width: 30%;"></td>
              </tr>
              <tr>
                <td>部门人数：</td>
                <td><input type="number" name="num"  id="num" required value="<%=u.getNum() %>" lay-verify="required"  autocomplete="off" class="layui-input" style="width: 30%;"></td>
              </tr>
              <tr>
                <td>工资系数：</td>
                <td><input type="text" name="ratio"  id="ratio" required value="<%=u.getRatio() %>" lay-verify="required"  autocomplete="off" class="layui-input" style="width: 30%;"></td>
              </tr>
              <tr>
                <td></td>
                <td><input type="submit" value="提交" style="margin-left: 20px;" class="layui-btn"><input type="reset"  class="layui-btn" value="重置" style="margin-left: 30px;"></td>
              </tr>
            </tbody>
          </table>
    </form>
   <%
  }
  %>
  </body>
</html>
