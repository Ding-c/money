<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="dao.UsersDao" %>
<%@page import="class_package.Users" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.lang.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upUser.jsp' starting page</title>
    
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
            height:100%
        }
    </style>
    <script type="text/javascript">
		function mod(ID)
		{
	   		window.location.href="view/uuUser.jsp?act=mod&ID1="+ID;
		}
		function del(ID)
		{
	   		if(confirm("确定删除吗?"))
	   	{
	    	window.location.href="./EditUsers?act=del&ID="+ID;
	    }
		}
	</script>
</head>
<body>
<%		response.setContentType("text/html;charset=utf-8");//用于中文输出不乱码	
		request.setCharacterEncoding("utf-8");
	List<Users> ulist=null;
	String act="";
	try{
	act=request.getParameter("act").toString();
	}catch(Exception e)
	{
	e.printStackTrace();
	}
			
	
	
	if(act == null || act.equalsIgnoreCase("")){        	
        	UsersDao udao=null;
        	try{
        		udao=new UsersDao();
        		ulist = udao.getList();
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
			
	}
	else if(act.equalsIgnoreCase("cha")) 
        {
        	String condi=request.getParameter("condi");
        	UsersDao udao=null;
     
        	try{
        		udao=new UsersDao();
        		ulist = udao.chazhao(condi);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        }
 %>
    <table class="layui-table" style="text-align: center; margin-top: 0;">
        <thead>
          <tr>
            <th>职工信息管理</th>
            <th><form name="cha" method="post" action="view/upUser.jsp?act=cha"><span style="margin-left: 30%;">类型查找：<input type="text" name="condi"  required lay-verify="required" autocomplete="off"
                class="layui-input reset" ></span><button style="margin-left: 40%;margin-top: 5px;">查询</button></form></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr> 
        </thead>
        <tbody>
          <tr>
            <td>职工编号</td>
            <td>姓名</td>
            <td>所在部门</td>
            <td>性别</td>
            <td>入职时间</td>
            <td>操作</td>
          </tr>
<%
  			String re="";
  			UsersDao udao=null;
  			if(ulist==null){
  				response.getWriter().write("<script>alert('没有找到该用户')</script>");
  			}else{
  				for(Users u:ulist)
     			{
       				re+="<tr>";
        			re+="<td>"+u.getId()+"</td>";
        			re+="<td>"+u.getName()+"</td>";
        			re+="<td>"+u.getDepartment()+"</td>";
        			re+="<td>"+u.getSex()+"</td>";
        			re+="<td>"+u.getAge()+"</td>";
        			re+="<td><a href='javascript:mod(&quot;"+u.getId()+"&quot;)' class='layui-btn' >修改</a><a href='javascript:del(&quot;"+u.getId()+"&quot;)' class='layui-btn'>删除</a></td>";
        			re+="</tr>";     
     			}
  				
  					out.print(re);
  			}
  			
     			
%>
        </tbody>
    </table>
</body>
</html>
