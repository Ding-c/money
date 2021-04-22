<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
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
    <form action="EditUsers?act=add" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
                <tr>
                    <th>职工信息添加</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>职工编号：</td>
                    <td><input type="text" id="ID" name="ID" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" ></td>
                </tr>
                <tr>
                    <td>登录密码：</td>
                    <td><input type="password" id="pwd" name="pwd" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" ></td>
                </tr>
                <tr>
                    <td>部门信息：</td>
                    <td><input type="text" id="department" name="department" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input type="text" id="name" name="name" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td><input type="text" id="sex" name="sex" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>入职时间：</td>
                    <td><input type="date" id="age" name="age" required lay-verify="required" autocomplete="off"
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
</body>
</html>
