<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="dao.ManageDao" %>
<%@page import="class_package.Manage" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upManage.jsp' starting page</title>
    
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
    </style>
</head>
<body>
    <table class="layui-table" style="text-align: center; margin-top: 0;">
        <thead>
          <tr>
            <th>经营信息查看</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr> 
        </thead>
        <tbody>
          <tr>
            <td>项目编号</td>
            <td>项目名称</td>
            <td>时间</td>
            <td>投入</td>
            <td>收入(万元)</td>
            <td>利润</td>
          </tr>
<%
			String re="";
  			ManageDao udao=null;
  			List<Manage> ulist=null;
  			try{
     			udao=new ManageDao();
     			ulist=udao.getList();
     			for(Manage u:ulist)
     			{
       				re+="<tr>";
        			re+="<td>"+u.getId()+"</td>";
        			re+="<td>"+u.getName()+"</td>";
        			re+="<td>"+u.getTime()+"</td>";
        			re+="<td>"+u.getInvest()+"</td>";
        			re+="<td>"+u.getIncome()+"</td>";
        			re+="<td>"+u.getProfit()+"</td>";
        			re+="</tr>";     
     			}
  				}
  				catch(SQLException e)
  				{
     				e.printStackTrace();
  				}finally{
    				udao.ConnClose();
  				}
  					out.print(re);
%>
        </tbody>
      </table>
</body>
</html>
