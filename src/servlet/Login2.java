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

import class_package.Users;
import dao.UsersDao;

/**
 * Servlet implementation class Login2
 */
@WebServlet("/Login2")
public class Login2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");//�����������������	
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		
		
		
		UsersDao udao=null;
		Users u=null;
		
		String userID=request.getParameter("userID");  //˫�����е�userID�ǵ�¼����index.jsp���û�������������
		String pwd=request.getParameter("password");//����
		try{
			udao=new UsersDao();
			u=udao.getOne(userID);//	
			if(u==null)
			{
				//�˺Ŵ���
				out.write("<script>alert('�˺Ŵ���');window.history.go(-1);</script>");
			}
			else
			{
				if(!pwd.equals(u.getPwd()))
				{
					//�������
					out.write("<script>alert('�������');window.history.go(-1);</script>");
				}
				else
				{
					//���Ե�¼
					HttpSession session=request.getSession();
					session.setAttribute("userID",userID);//��һ�����������session������
					session.setMaxInactiveInterval(60*60*2);//���ù���ʱ��
					out.write("<script>alert('��ӭʹ�ñ�ϵͳ');window.location.href='./view/user.jsp';</script>");
				}
					
			}
			
		}catch(SQLException e){
			e.printStackTrace();  //����������󣬱����޸�
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