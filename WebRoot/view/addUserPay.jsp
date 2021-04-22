<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUserPay.jsp' starting page</title>
    
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
            height:700px;
        }
        tr>td:first-child {
            text-align: end;
        }
    </style>
  </head>
  
  <body>
    <form action="EditSalary?act=add" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
                <tr>
                    <th>职工工资信息添加</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>职工编号：</td>
                    <td><input type="text" id="id" name="id" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" ></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input type="text" id="name" name="name" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;" ></td>
                </tr>
                <tr>
                    <td>所在部门：</td>
                    <td><input type="text" id="department" name="department" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>工资系数：</td>
                    <td><input type="text" id="ratio" name="ratio" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>基本工资：</td>
                    <td><input type="text" id="base" name="base" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>工龄：</td>
                    <td><input type="text" id="age" name="age" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>职务：</td>
                    <td><input type="text" id="work" name="work" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>补贴：</td>
                    <td><input type="text" id="subsidy" name="subsidy" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                <tr>
                    <td>合计：</td>
                    <td><input type="text" id="all" name="all" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                	<td></td>
                    <td><input type="submit" value="提交" style="margin-left: 20px;"  class="layui-btn">
                        <input type="reset" value="重置" style="margin-left: 20px;" class="layui-btn">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
  </body>
</html>
