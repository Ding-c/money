package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DBConn;
import class_package.Users;
public class UsersDao {
	private Connection Conn;
	//*****************这两个是所有dao都有的
	public UsersDao() throws SQLException{
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
	
		public Users setOne(ResultSet rs) throws SQLException{
			Users	u=null;
			if(rs!=null)
			{
				u=new Users();
				u.setId(rs.getString("id").trim());//从数据集中读取相应的字段值，赋给user对象的相应成员。
				u.setName(rs.getString("name").trim());
				u.setAge(rs.getString("age").trim());
				u.setSex(rs.getString("sex").trim());
				u.setDepartment(rs.getString("department").trim());
				u.setPwd(rs.getString("pwd").trim()); //trim函数用于去掉前后空格
			}
			return u;
		}
		
		public Users getOne(String ID) throws SQLException{
			Users u=null;		
			String sql="select * from user where id=?";
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
		
		
		public List<Users>  chazhao(String condi) throws SQLException{
			List<Users> ulist=null;		
			String sql="select * from user where id like '%"+condi+"%' or  name like '%"+condi+"%'  ";
			PreparedStatement pst=null;
			ResultSet rs=null;
			try{
				pst=Conn.prepareStatement(sql);			
				rs=pst.executeQuery();
				while(rs.next())
				{
					if(ulist==null) ulist=new ArrayList<Users>();
					Users u=setOne(rs);
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
		
		
		public List<Users>  getList() throws SQLException{
			List<Users> ulist=null;		
			String sql="select * from user";
			PreparedStatement pst=null;
			ResultSet rs=null;
			try{
				pst=Conn.prepareStatement(sql);			
				rs=pst.executeQuery();
				while(rs.next())
				{
					if(ulist==null) ulist=new ArrayList<Users>();
					Users u=setOne(rs);
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
		
		public int addOne(String ID,String name,String sex,String age,String department,String pwd) throws SQLException  //剩余的自己补充
		{
			int re=0;
			String sql="insert into user values (?,?,?,?,?,?)";
			PreparedStatement pst=null;
			
			try{
				pst=Conn.prepareStatement(sql);			
				pst.setString(1, ID);
				pst.setString(2, name);
				pst.setString(3, sex);
				pst.setString(4, age);
				pst.setString(5, department);
				pst.setString(6, pwd);
				//pst.setInt(3, banjiID);
			    re=pst.executeUpdate();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}finally{
				DBConn.close(pst);
			}
			return re;
		}
		
		
		
		public int delOne(String ID) throws SQLException  
		{
			int re=0;
			String sql="delete from user where id=?";		
			PreparedStatement pst=null;
			try{
				pst=Conn.prepareStatement(sql);			
				pst.setString(1, ID);
				
			    re=pst.executeUpdate();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}finally{
				DBConn.close(pst);
			}
			
			
			
			return re;
		}
		
		
		public int modOne(String ID,String name,String sex,String age,String department,String pwd) throws SQLException  
		{
			int re=0;
			String sql="UPDATE user SET name=?,sex=?,age=?,department=?,pwd=? where id=?";		
			PreparedStatement pst=null;
			
			try{
				pst=Conn.prepareStatement(sql);			
				pst.setString(1, name);
				pst.setString(2, sex);
				pst.setString(3, age);
				pst.setString(4, department);
				pst.setString(5, pwd);
				pst.setString(6, ID);
				
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
