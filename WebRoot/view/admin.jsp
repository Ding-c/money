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
    
    <title>My JSP 'stu1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="./css/layui.css">
  	<script src="./js/layui.js"></script>
  	<script>
    	function confirms() {
      		var exit = document.getElementById('exit');
      		var a = window.confirm("确认退出？");
      		if (a == false) {
        		exit.href = 'admin.jsp';
      		} else if(a == true){
        		exit.href = './index.jsp';
      		}
    	}

    	function ifrs(src) {
      		var ConT = document.getElementById('content-top');
      		ConT.style.display = "none";
      		var ifr = document.getElementById('content');
      		ifr.src = src;
    	}
  </script>
	

  </head>
  <body class="layui-layout-body">
<%
    if (session.getAttribute("userID")==null )
       {
       	out.write("<script>alert('未登入，请登入后使用');window.location.href='./index.jsp';</script>");
       	} 
      else
       {
	String userID=session.getAttribute("userID").toString();  //"userID"session的名称，具体选择的session根据你自己的需要
	if(userID.equalsIgnoreCase("")) 
		{
   			out.print("未登入，跳转到登录页面");
		}
	else
		{
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
 <div class="layui-layout layui-layout-admin">
    <div class="layui-header">
      <div class="layui-logo">公司财务信息系统</div>
      <!-- 头部区域（可配合layui已有的水平导航） -->
      <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
          <!-- <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> -->
         您好，<%=u.getName() %>
        </li>
        <li class="layui-nav-item"><a href="" onclick="confirms()">退出</a></li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
          <li class="layui-nav-item  layui-nav-itemed">
            <a href="javascript:;">个人密码管理</a>
            <dl class="layui-nav-child">
              <dd><a href="" target="content" onclick="ifrs('./view/upPwd.jsp');return false">修改个人密码</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a class="" href="javascript:;">部门信息管理</a>
            <dl class="layui-nav-child">
              <dd><a href="javascript:;" onclick="ifrs('./view/addApart.jsp');return false">添加部门信息</a></dd>
              <dd><a href="javascript:;" onclick="ifrs('./view/upApart.jsp');return false">查看部门信息</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">职工信息管理</a>
            <dl class="layui-nav-child">
              <dd><a href="javascript:;" onclick="ifrs('./view/addUser.jsp');return false">添加职工信息</a></dd>
              <dd><a href="javascript:;" onclick="ifrs('./view/upUser.jsp');">查看职工信息</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;" >职工工资管理</a>
            <dl class="layui-nav-child">
              <dd><a href="" onclick="ifrs('./view/userPay.jsp');return false">职工工资信息</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">经营信息管理</a>
            <dl class="layui-nav-child">
              <dd><a href="javascript:;" onclick="ifrs('./view/addManage.jsp');return false">经营信息添加</a></dd>
              <dd><a href="javascript:;" onclick="ifrs('./view/upManage.jsp');return false">经营信息查看</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;" >费用信息管理</a>
            <dl class="layui-nav-child">
              <dd><a href="javascript:;" onclick="ifrs('./view/addPay.jsp');return false">添加费用信息</a></dd>
              <dd><a href="javascript:;" onclick="ifrs('./view/upPay.jsp');return false">查看费用信息</a></dd>
            </dl>
          </li>
        </ul>
      </div>
    </div>

    <div class="layui-body" style="background-color: #009688;">
      <!-- 内容主体区域 -->
      <div style="padding: 15px;font-size: 30px;display:contents;" id="content-top">欢迎光临公司财务信息系统</div>
      <iframe name="content" id="content" src="" scrolling="yes" frameborder="0" width="100%" height="100%"
        style="position: absolute;"></iframe>

    </div>
  </div>
  <script>
    layui.use('element', function () {
      var element = layui.element;
    });
  </script>

<%
}
}
}
%>
 
</body>
</html>
