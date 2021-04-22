<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="dao.AdminDao" %>
<%@page import="class_package.Admin" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upPwd.jsp' starting page</title>
    
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
  
  String userID=session.getAttribute("userID").toString();
  AdminDao udao=null;
  Admin u=null;
  try{
     udao=new AdminDao();
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
    <form action="EditAdmin?act=modify" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
                <tr>
                    <th>密码修改</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>登录名：</td>
                    <td><input type="text" name="userID" id="userID"  required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" readonly="readonly" placeholder="<%=u.getName() %>" ></td>
                </tr>
                <tr>
                    <td>原密码：</td>
                    <td><input type="text" name="oldpwd" id="oldpwd" value="<%=u.getPwd() %>"  required lay-verify="required" autocomplete="off"
                        class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>新密码：</td>
                    <td><input type="password" name="pwd" id="newPwd" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;"></td>
                </tr>
                    <td>确认密码：</td>
                    <td><input type="password" name="conPwd" id="conPwd" required lay-verify="required" autocomplete="off"
                        class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="修改"  style="margin-left: 20px;" class="layui-btn">
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
