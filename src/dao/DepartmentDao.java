package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import data.DBConn;
import class_package.Department;
public class DepartmentDao {
	private Connection Conn;
	//*****************������������dao���е�
	public DepartmentDao() throws SQLException{
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
	//���º�������ʵ�����ݿ��Department����ɾ�Ĳ�
	
			public Department setOne(ResultSet rs) throws SQLException{
				Department	u=null;
				if(rs!=null)
				{
					u=new Department();
					u.setId(rs.getString("id").trim());//�����ݼ��ж�ȡ��Ӧ���ֶ�ֵ������user�������Ӧ��Ա��
					u.setName(rs.getString("name").trim());
					u.setNum(rs.getString("Num").trim());
					u.setRatio(rs.getString("ratio").trim()); //trim��������ȥ��ǰ��ո�
				}
				return u;
			}
			
			public Department getOne(String ID) throws SQLException{
				Department u=null;		
				String sql="select * from department where id=?";
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
			
			public List<Department>  getList() throws SQLException{
				List<Department> ulist=null;		
				String sql="select * from department";
				PreparedStatement pst=null;
				ResultSet rs=null;
				try{
					pst=Conn.prepareStatement(sql);			
					rs=pst.executeQuery();
					while(rs.next())
					{
						if(ulist==null) ulist=new ArrayList<Department>();
						Department u=setOne(rs);
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
			
			public int addOne(String ID,String name,String num,String ratio) throws SQLException  //ʣ����Լ�����
			{
				int re=0;
				String sql="insert into department values (?,?,?,?)";
				//������Ӧ����String sql="insert into [User] values(?,?,?,?,?)";
				PreparedStatement pst=null;
				
				try{
					pst=Conn.prepareStatement(sql);			
					pst.setString(1, ID);
					pst.setString(2, name);
					pst.setString(3, num);
					pst.setString(4, ratio);
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
				String sql="delete from department where id=?";		
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
			
			
			public int modOne(String ID,String name,String num,String ratio) throws SQLException  
			{
				int re=0;
				String sql="UPDATE department SET name=?,num=?,ratio=? where id=?";		
				PreparedStatement pst=null;		
				try{
					pst=Conn.prepareStatement(sql);			
					pst.setString(1, name);
					pst.setString(2, num);
					pst.setString(3, ratio);
					pst.setString(4, ID);
					
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
