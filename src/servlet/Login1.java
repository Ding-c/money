package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import class_package.Admin;
import dao.AdminDao;

/**
 * Servlet implementation class Login1
 */
@WebServlet("/Login1")
public class Login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login1() {
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
		PrintWriter out=response.getWriter();
		
		
		
		
		AdminDao udao=null;
		Admin u=null;
		
		String userID=request.getParameter("userID");  //双引号中的userID是登录界面index.jsp中用户名输入框的名称
		String pwd=request.getParameter("password");//密码
		try{
			udao=new AdminDao();
			u=udao.getOne(userID);//	
			if(u==null)
			{
				//账号错误
				out.write("<script>alert('账号错误');window.history.go(-1);</script>");
			}
			else
			{
				if(!pwd.equals(u.getPwd()))
				{
					//密码错误
					out.write("<script>alert('密码错误');window.history.go(-1);</script>");
				}
				else
				{
					//可以登录
					HttpSession session=request.getSession();
					session.setAttribute("userID",userID);//第一个参数是这个session的名称，第二个是它的值
					session.setMaxInactiveInterval(60*60*2);//设置过期时间，不设置这个的话，有效时间会很短
					out.write("<script>alert('欢迎使用本系统');window.location.href='./view/admin.jsp';</script>");
				}
					
			}
			
		}catch(SQLException e){
			e.printStackTrace();  //用于输出错误，便于修改
		}finally{
			udao.ConnClose();
		}
		
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
