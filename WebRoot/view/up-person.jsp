<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
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
    
    <title>My JSP 'up-person.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="./css/layui.css">
    <script src="./js/layui.js"></script>
    <style>
        body {
            background-color: #fff;
        }

        tr>td:first-child {
            text-align: end;
        }
    </style>
</head>

<body>
<%
  	String userID=session.getAttribute("userID").toString(); 
  	UsersDao udao=null;
  	Users u=null;
  try{
     udao=new UsersDao();
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
    <form action="EditUsers?act=update" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
                <tr>
                    <th>个人信息修改</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>职工编号：</td>
                    <td><input type="text" name="userID" value="<%=u.getId() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" readonly="readonly" ></td>
                </tr>
                <tr>
                    <td>部门信息：</td>
                    <td><input type="text" name="department" value="<%=u.getDepartment() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>登录密码：</td>
                    <td><input type="password" name="pwd" value="<%=u.getPwd() %>" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                	<td>姓名：</td>
                	<td><input type="text" value="<%=u.getName() %>" name="name" required lay-verify="required" autocomplete="off"
                        class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                	<td>年龄：</td>
                	<td><input type="text" value="<%=u.getAge() %>" name="age" required lay-verify="required" autocomplete="off"
                        class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td><select name="sex" value="<%=u.getSex() %>" lay-verify="">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select></td>
                </tr>
                <td></td>
                <td><input type="submit" value="修改" style="margin-left: 20px;" class="layui-btn">
                    <input type="reset" value="重置" style="margin-left: 20px;" class="layui-btn">
                </td>
            </tbody>
        </table>
    </form>
      <%
  }
  %>
  </body>
</html>
