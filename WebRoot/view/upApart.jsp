<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="dao.DepartmentDao" %>
<%@page import="class_package.Department" %>
<%@page import="java.sql.SQLException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upApart.jsp' starting page</title>
    
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
    <script type="text/javascript">
		function mod(ID)
		{
	   		window.location.href="view/uuApart.jsp?act=mod&ID1="+ID;
		}
		function del(ID)
		{
	   		if(confirm("确定删除吗?"))
	   	{
	    	window.location.href="./EditDepartment?act=del&ID="+ID;
	    }
		}
	</script>
</head>
<body>
    <table class="layui-table" style="text-align: center; margin-top: 0;">
        <thead>
          <tr>
            <th>部门信息管理</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr> 
        </thead>
        <tbody>
          <tr>
          	<td>编号</td>
            <td>名称</td>
            <td>人数</td>
            <td>工资系数</td>
            <td>操作</td>
          </tr>
          <%
  			
  			String re="";
  			DepartmentDao udao=null;
  			List<Department> ulist=null;
  			try{
     			udao=new DepartmentDao();
     			ulist=udao.getList();
     			for(Department u:ulist)
     			{
       				re+="<tr>";
        			re+="<td>"+u.getId()+"</td>";
        			re+="<td>"+u.getName()+"</td>";
        			re+="<td>"+u.getNum()+"</td>";
        			re+="<td>"+u.getRatio()+"</td>";
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
