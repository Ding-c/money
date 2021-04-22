<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>XXX管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./css/index.css">
  </head>
  <script type="text/javascript">
  	function change(obj){
  	console.log(obj);
  	var form1 = document.getElementById("form1");
  	if(obj.value == "用户"){
  		form1.action = "Login2"
  	}else{
  		form1.action = "Login1"
  	}
  	
  	}
  	
  </script>
  
  
  <body>
    	<form name="form1" id="form1" action="Login2" method="post">
     		 <h1>XXX管理系统</h1>
            <input class=input_1 id=userID size=15  name="userID"  placeholder=用户名><br />
          	<input class=input_1 id=password type=text size=15 name="password" placeholder=密码><br />
          	<div class="layui-input-block">
      			<input type="radio" name="person" id="person" onclick="change(this)" value="用户" title="用户" checked>用户
      			<input type="radio" name="person" id="person" onclick="change(this)" value="管理员" title="管理员">管理员
    		</div>
            <input class=input_3 type="submit"  value="登录" />
            <input class=input_3 type="reset"   value="重置" /> 
     	</form>
  </body>
</html>
