<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@page import="dao.UsersDao" %>
<%@page import="class_package.Users" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uuUser.jsp' starting page</title>
    
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
        tr>td:first-child {
            text-align: end;
        }
    </style>

  </head>
  
  <body>
  <%
  	String ID1=request.getParameter("ID1");
  	UsersDao udao=null;
  	Users u=null;
  try{
     udao=new UsersDao();
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
  
    <form action="EditUsers?act=modify" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
                <tr>
                    <th>职工信息修改</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>职工编号：</td>
                    <td><input type="text" id="ID" name="ID" value="<%=u.getId() %>" readonly="readonly" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" ></td>
                </tr>
                <tr>
                    <td>登录密码：</td>
                    <td><input type="password" id="pwd" name="pwd" value="<%=u.getPwd() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" ></td>
                </tr>
                <tr>
                    <td>部门信息：</td>
                    <td><input type="text" id="department" name="department" value="<%=u.getDepartment() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input type="text" id="name" name="name" value="<%=u.getName() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td><input type="text" id="sex" name="sex" value="<%=u.getSex() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>入职时间：</td>
                    <td><input type="text" id="age" name="age" value="<%=u.getAge() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="提交" style="margin-left: 20px;" class="layui-btn">
                        <input type="reset" value="重置" style="margin-left: 20px;" class="layui-btn">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
      <%
  }
  %>
  </body>
</html>
