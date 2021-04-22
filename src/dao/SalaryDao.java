package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import data.DBConn;
import class_package.Salary;
public class SalaryDao {
	private Connection Conn;
	//*****************这两个是所有dao都有的
	public SalaryDao() throws SQLException{
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
	//以下函数用于实现数据库表Department的增删改查
	
			public Salary setOne(ResultSet rs) throws SQLException{
				Salary	u=null;
				if(rs!=null)
				{
					u=new Salary();
					u.setId(rs.getString("id").trim());//从数据集中读取相应的字段值，赋给user对象的相应成员。
					u.setName(rs.getString("name").trim());
					u.setDepartment(rs.getString("department").trim());
					u.setRatio(rs.getString("ratio").trim());
					u.setBase(rs.getString("base").trim());
					u.setAge(rs.getString("age").trim());
					u.setWork(rs.getString("work").trim());
					u.setSubsidy(rs.getString("subsidy").trim());
					u.setAll(rs.getString("all").trim()); //trim函数用于去掉前后空格
				}
				return u;
			}
			
			public Salary getOne(String ID) throws SQLException{
				Salary u=null;		
				String sql="select * from salary where id=?";
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
			
			public List<Salary>  getList() throws SQLException{
				List<Salary> ulist=null;		
				String sql="select * from salary";
				PreparedStatement pst=null;
				ResultSet rs=null;
				try{
					pst=Conn.prepareStatement(sql);			
					rs=pst.executeQuery();
					while(rs.next())
					{
						if(ulist==null) ulist=new ArrayList<Salary>();
						Salary u=setOne(rs);
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
			
			public int addOne(String ID,String name,String department,String ratio,String base,String age,String work,String subsidy,String all) throws SQLException  //剩余的自己补充
			{
				int re=0;
				String sql="insert into salary values (?,?,?,?,?,?,?,?,?)";
				//完整的应该是String sql="insert into [User] values(?,?,?,?,?)";
				PreparedStatement pst=null;
				
				try{
					pst=Conn.prepareStatement(sql);			
					pst.setString(1, ID);
					pst.setString(2, name);
					pst.setString(3, department);
					pst.setString(4, ratio);
					pst.setString(5, base);
					pst.setString(6, age);
					pst.setString(7, work);
					pst.setString(8, subsidy);
					pst.setString(9, all);
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
				String sql="delete from salary where id=?";		
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
			
			
			public int modOne(String ID,String name,String department,String ratio,String base,String age,String work,String subsidy,String all) throws SQLException  
			{
				int re=0;
				String sql="update salary set `name`=?,department=?,ratio=?,base=?,age=?,`work`=?,subsidy=?,`all`=? where id=?";		
				PreparedStatement pst=null;
				
				try{
					pst=Conn.prepareStatement(sql);			
					pst.setString(1, name);
					pst.setString(2, department);
					pst.setString(3, ratio);
					pst.setString(4, base);
					pst.setString(5, age);
					pst.setString(6, work);
					pst.setString(7, subsidy);
					pst.setString(8, all);
					pst.setString(9, ID);
					
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
