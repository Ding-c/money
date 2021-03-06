package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DBConn;
import class_package.Pay;
public class PayDao {
	private Connection Conn;
	//*****************这两个是所有dao都有的
	public PayDao() throws SQLException{
		this.Conn=DBConn.getConn();
		   try {
			   Conn.setAutoCommit(true);		   
		   }catch(SQLException e){
			   e.printStackTrace();
		   }
	}
	
	public void ConnClose()
	{
		   if(this.Conn!=null)
			try {
				DBConn.Close(Conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	//以下函数用于实现数据库表User的增删改查
	
	public Pay setOne(ResultSet rs) throws SQLException{
		Pay	u=null;
		if(rs!=null)
		{
			u=new Pay();
			u.setId(rs.getString("id").trim());//从数据集中读取相应的字段值，赋给user对象的相应成员。
			u.setName(rs.getString("name").trim());
			u.setTime(rs.getString("time").trim());
			u.setAmount(rs.getString("amount").trim());
			u.setStyle(rs.getString("style").trim()); //trim函数用于去掉前后空格
		}
		return u;
	}
	
	public Pay getOne(String ID) throws SQLException{
		Pay u=null;		
		String sql="select * from pay where id=?";
		PreparedStatement pst=null;
		ResultSet rs=null;
		try{
			pst=Conn.prepareStatement(sql);
			pst.setString(1, ID);
			rs=pst.executeQuery();
			if(rs.next())
				u=setOne(rs);
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBConn.close(pst, rs);
		}
		return u;
	}
	
	public List<Pay>  getList() throws SQLException{
		List<Pay> ulist=null;		
		String sql="select * from pay";
		PreparedStatement pst=null;
		ResultSet rs=null;
		try{
			pst=Conn.prepareStatement(sql);			
			rs=pst.executeQuery();
			while(rs.next())
			{
				if(ulist==null) ulist=new ArrayList<Pay>();
				Pay u=setOne(rs);
				ulist.add(u);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBConn.close(pst, rs);
		}
		return ulist;
	}
	
	public int addOne(String ID,String name,String time,String amount,String style) throws SQLException  //剩余的自己补充
	{
		int re=0;
		String sql="insert into pay values (?,?,?,?,?)";
		//完整的应该是String sql="insert into [User] values(?,?,?,?,?)";
		PreparedStatement pst=null;
		
		try{
			pst=Conn.prepareStatement(sql);			
			pst.setString(1, ID);
			pst.setString(2, name);
			pst.setString(3, time);
			pst.setString(4, amount);
			pst.setString(5, style);
		    re=pst.executeUpdate();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			DBConn.close(pst);
		}
		return re;
	}
}
