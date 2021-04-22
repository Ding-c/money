package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DepartmentDao;

/**
 * Servlet implementation class EditDepartment
 */
@WebServlet("/EditDepartment")
public class EditDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDepartment() {
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
        	String ID=request.getParameter("id");
        	String name=request.getParameter("name");
        	String num=request.getParameter("num");
        	String ratio=request.getParameter("ratio");
        	DepartmentDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new DepartmentDao();
        		re=udao.addOne(ID, name, num, ratio);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('�ɹ����"+re+"����¼');window.location.href='./view/upApart.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('����ʧ��');window.history.go(-1);</script>");
        }else if(act.equalsIgnoreCase("modify")) //�޸�
        {
        	String ID=request.getParameter("id");
        	String name=request.getParameter("name");
        	String num=request.getParameter("num");
        	String ratio=request.getParameter("ratio");
        	DepartmentDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao = new DepartmentDao();
        		re = udao.modOne(ID, name, num, ratio);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('�޸ĳɹ�');window.location.href='./view/upApart.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('����ʧ��');window.history.go(-1);</script>");
        
        }
        else if(act.equalsIgnoreCase("del")) //ɾ��
        {
        	String ID=request.getParameter("ID");
        	
        	DepartmentDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new DepartmentDao();
        		re=udao.delOne(ID);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('ɾ���ɹ�');window.location.href='./view/upApart.jsp';</script>");
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
