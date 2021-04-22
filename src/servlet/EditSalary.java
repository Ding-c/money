package servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SalaryDao;


/**
 * Servlet implementation class EditSalary
 */
@WebServlet("/EditSalary")
public class EditSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSalary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");//用于中文输出不乱码	
		request.setCharacterEncoding("utf-8");
        String act=request.getParameter("act");
        if(act.equalsIgnoreCase("add"))  //添加
        {
        	String ID=request.getParameter("id");
        	String name=request.getParameter("name");
        	String department=request.getParameter("department");
        	String ratio=request.getParameter("ratio");
        	String base=request.getParameter("base");
        	String age=request.getParameter("age");
        	String work=request.getParameter("work");
        	String subsidy=request.getParameter("subsidy");
        	String all=request.getParameter("all");
        	SalaryDao udao=null;
        	int re=0;
        	try{
        		//要改的只有try里面的内容
        		udao=new SalaryDao();
        		re=udao.addOne(ID, name, department, ratio,base,age,work,subsidy,all);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('成功添加"+re+"条记录');window.location.href='./view/userPay.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('操作失败');window.history.go(-1);</script>");
        }else if(act.equalsIgnoreCase("modify")) //修改
        {
        	String ID=request.getParameter("id");
        	String name=request.getParameter("name");
        	String department=request.getParameter("department");
        	String ratio=request.getParameter("ratio");
        	String base=request.getParameter("base");
        	String age=request.getParameter("age");
        	String work=request.getParameter("work");
        	String subsidy=request.getParameter("subsidy");
        	String all=request.getParameter("all");
        	SalaryDao udao=null;
        	int re=0;
        	try{
        		//要改的只有try里面的内容
        		udao=new SalaryDao();
        		re = udao.modOne(ID, name, department, ratio,base,age,work,subsidy,all);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('修改成功');window.location.href='./view/userPay.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('操作失败2');window.history.go(-1);</script>");
        
        }
        else if(act.equalsIgnoreCase("del")) //删除
        {
        	String ID=request.getParameter("ID");
        	SalaryDao udao=null;
        	int re=0;
        	try{
        		//要改的只有try里面的内容
        		udao=new SalaryDao();
        		re=udao.delOne(ID);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('删除成功');window.location.href='./view/userPay.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('操作失败3');window.history.go(-1);</script>");
        	
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
