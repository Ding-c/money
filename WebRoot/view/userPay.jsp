<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="dao.SalaryDao" %>
<%@page import="class_package.Salary" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userPay.jsp' starting page</title>
    
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
        .layui-btn{
        	padding:0 5px;
        }
    </style>
    <script>
    	function add(){
    	
    		window.location.href="./view/addUserPay.jsp";
    		
    	}
    	function mod(ID)
		{
	   		window.location.href="./view/upUserPay.jsp?act=mod&ID1="+ID;
		}
		function del(ID)
		{
	   		if(confirm("确定删除吗?"))
	   	{
	    	window.location.href="./EditSalary?act=del&ID="+ID;
	    }
		}
    </script>
</head>
<body>
    <table class="layui-table" style="text-align: center; margin-top: 0;">
        <thead>
          <tr>
            <th>职工工资管理</th>
            <th><input type="button" onclick="add()"  class="layui-btn" value="添加" ></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
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
            <td>工资系数</td>
            <td>基本工资</td>
            <td>工龄</td>
            <td>职务</td>
            <td>补贴</td>
            <td>合计</td>
            <td>操作</td>
          </tr>
          <%
  			
  			String re="";
  			SalaryDao udao=null;
  			List<Salary> ulist=null;
  			try{
     			udao=new SalaryDao();
     			ulist=udao.getList();
     			for(Salary u:ulist)
     			{
       				re+="<tr>";
        			re+="<td>"+u.getId()+"</td>";
        			re+="<td>"+u.getName()+"</td>";
        			re+="<td>"+u.getDepartment()+"</td>";
        			re+="<td>"+u.getRatio()+"</td>";
        			re+="<td>"+u.getBase()+"</td>";
        			re+="<td>"+u.getAge()+"</td>";
        			re+="<td>"+u.getWork()+"</td>";
        			re+="<td>"+u.getSubsidy()+"</td>";
        			re+="<td>"+u.getAll()+"</td>";
        			re+="<td><a href='javascript:mod(&quot;"+u.getId()+"&quot;)' class='layui-btn' >修改</a><a href='javascript:del(&quot;"+u.getId()+"&quot;)' class='layui-btn'>删除</a></td>";
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
