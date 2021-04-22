package servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;

/**
 * Servlet implementation class EditAdmin
 */
@WebServlet("/EditAdmin")
public class EditAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAdmin() {
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
		String userID=request.getSession().getAttribute("userID").toString();
        String act=request.getParameter("act");
        if(act.equalsIgnoreCase("modify"))  //修改
        {
        	
        	String name=request.getParameter("name");
        	String sex=request.getParameter("sex");
        	String age=request.getParameter("age");
        	String department=request.getParameter("department");
        	String pwd=request.getParameter("pwd");
        	AdminDao udao=null;
        	int re=0;
        	try{
        		//要改的只有try里面的内容
        		udao=new AdminDao();
        		re=udao.modOne(userID, name, sex, age,department,pwd);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('修改成功');window.location.href='./view/upPwd.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('操作失败111');window.history.go(-1);</script>");
        
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
