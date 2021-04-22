package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;

/**
 * Servlet implementation class EditUsers
 */
@WebServlet("/EditUsers")
public class EditUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUsers() {
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
        String act=request.getParameter("act");
        if(act.equalsIgnoreCase("add"))  //���
        {
        	String ID=request.getParameter("ID");
        	String name=request.getParameter("name");
        	String sex=request.getParameter("sex");
        	String age=request.getParameter("age");
        	String department=request.getParameter("department");
        	String pwd=request.getParameter("pwd");
        	UsersDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new UsersDao();
        		re=udao.addOne(ID, name, sex, age, department, pwd);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('�ɹ����"+re+"����¼');window.location.href='./view/upUser.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('����ʧ��');window.history.go(-1);</script>");
        }
        else if(act.equalsIgnoreCase("update")) //����
        {
        	String userID=request.getSession().getAttribute("userID").toString();
        	String pwd=request.getParameter("pwd");
        	String name=request.getParameter("name");
        	String sex=request.getParameter("sex");
        	String age=request.getParameter("age");
        	String department=request.getParameter("department");
        	UsersDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new UsersDao();
        		re = udao.modOne(userID, name, sex, age, department, pwd);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('�޸ĳɹ�');window.location.href='./view/up-person.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('����ʧ��');window.history.go(-1);</script>");
        
        }
        else if(act.equalsIgnoreCase("modify")) //�޸�
        {
        	String ID=request.getParameter("ID");
        	String pwd=request.getParameter("pwd");
        	String name=request.getParameter("name");
        	String sex=request.getParameter("sex");
        	String age=request.getParameter("age");
        	String department=request.getParameter("department");
        	UsersDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new UsersDao();
        		re = udao.modOne(ID, name, sex, age, department, pwd);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('�޸ĳɹ�');window.location.href='./view/upUser.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('����ʧ��');window.history.go(-1);</script>");
        
        }
        else if(act.equalsIgnoreCase("del")) //ɾ��
        {
        	String ID=request.getParameter("ID");
        	
        	UsersDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new UsersDao();
        		re=udao.delOne(ID);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('ɾ���ɹ�');window.location.href='./view/upUser.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('����ʧ��');window.history.go(-1);</script>");
        	
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
