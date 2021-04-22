package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.PayDao;
/**
 * Servlet implementation class EditPay
 */
@WebServlet("/EditPay")
public class EditPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPay() {
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
        	String time=request.getParameter("time");
        	String amount=request.getParameter("amount");
        	String style=request.getParameter("style");
        	System.out.print(name);
        	PayDao udao=null;
        	int re=0;
        	try{
        		//要改的只有try里面的内容
        		udao=new PayDao();
        		re=udao.addOne(ID, name, time, amount, style);
        	}catch(SQLException e){
        		e.printStackTrace();
        	}finally{
        		udao.ConnClose();
        	}
        	
        	if(re>0)
        	{
        		response.getWriter().write("<script>alert('成功添加"+re+"条记录');window.location.href='./view/upPay.jsp';</script>");
        	}
        	else
        		response.getWriter().write("<script>alert('操作失败');window.history.go(-1);</script>");
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
