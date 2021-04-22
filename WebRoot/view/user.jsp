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
    
    <title>My JSP 'user.jsp' starting page</title>
    
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
      if(a==false){
        return;
      }else{
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
<%
	if (session.getAttribute("userID")==null )
       {
       	out.write("<script>alert('未登入，请登入后使用');window.location.href='./index.jsp';</script>");
       	} 
      else
       {
	String userID=session.getAttribute("userID").toString();  //"userID"session的名称，具体选择的session根据你自己的需要
	if(userID.equalsIgnoreCase("userID")) 
		{
   			out.print("未登入，跳转到登录页面");
		}
	else
		{
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
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
    <div class="layui-header">
      <div class="layui-logo">公司财务信息系统</div>
      <!-- 头部区域（可配合layui已有的水平导航） -->
      <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
          <!-- <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> -->
          您好，<%=u.getName() %>
        </li>
        <li class="layui-nav-item"><a href="" onclick="confirms()" id="exit">退出</a></li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
          <li class="layui-nav-item  layui-nav-itemed">
            <a href="javascript:;">个人信息</a>
            <dl class="layui-nav-child">
              <dd><a href="" target="content" onclick="ifrs('./view/up-person.jsp');return false">修改个人信息</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a class="" href="javascript:;">个人工资查看</a>
            <dl class="layui-nav-child">
              <dd><a href="" onclick="ifrs('./view/pay-person.jsp');return false">查看工资</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;" >公司经营查询</a>
            <dl class="layui-nav-child">
              <dd><a href="" onclick="ifrs('./view/upManage.jsp');return false">查看经营情况</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">公司费用查询</a>
            <dl class="layui-nav-child">
              <dd><a href="" onclick="ifrs('./view/upPay.jsp');return false">公司费用使用情况</a></dd>
            </dl>
          </li>
        </ul>
      </div>
    </div>

    <div class="layui-body" style="background-color: #009688;">
      <!-- 内容主体区域 -->
      <div style="padding: 15px;font-size: 30px;display:contents;" id="content-top">欢迎光临公司财务信息系统</div>
      <iframe name="content" id="content" src="" scrolling="no" frameborder="0" width="100%" height="100%"
        style="position: absolute;"></iframe>

    </div>
  </div>
  <script>
    //JavaScript代码区域
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
