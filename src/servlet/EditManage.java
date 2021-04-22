package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ManageDao;

/**
 * Servlet implementation class EditManage
 */
@WebServlet("/EditManage")
public class EditManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditManage() {
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
        	String time=request.getParameter("time");
        	String invest=request.getParameter("invest");
        	String income=request.getParameter("income");
        	String profit=request.getParameter("profit");
        	ManageDao udao=null;
        	int re=0;
        	try{
        		//Ҫ�ĵ�ֻ��try���������
        		udao=new ManageDao();
        		re=udao.addOne(ID, name, time, invest, income, profit);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('�ɹ����"+re+"����¼');window.location.href='./view/upManage.jsp';</script>");
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
