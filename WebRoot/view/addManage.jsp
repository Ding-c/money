<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addManage.jsp' starting page</title>
    <meta content=”text/html;charset=utf-8″ />
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
    <form action="EditManage?act=add" method="post">
        <table class="layui-table" style="margin-top: 0;">
            <thead>
                <tr>
                    <th>经营信息添加</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            	<tr>
                    <td>项目编号：</td>
                    <td><input type="text" name="id"  id="id" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>项目名称：</td>
                    <td><input type="text" name="name"  id="name" required lay-verify="required" autocomplete="off"
                            class="layui-input reset" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>时间：</td>
                    <td><input type="date" name="time" id="time" required lay-verify="required" autocomplete="off"
                        class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>投入：</td>
                    <td><input type="text" name="invest" id="invest" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>收益：</td>
                    <td><input type="text" name="income" id="income" required lay-verify="required" autocomplete="off"
                            class="layui-input" style="width: 30%;"></td>
                </tr>
                <tr>
                    <td>利润：</td>
                    <td><input type="text" name="profit"  id="profit" required lay-verify="required" autocomplete="off"
                        class="layui-input reset" style="width: 30%;"></td>
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
