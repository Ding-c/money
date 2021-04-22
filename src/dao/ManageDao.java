package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DBConn;
import class_package.Manage;
public class ManageDao {
	private Connection Conn;
	//*****************������������dao���е�
	public ManageDao() throws SQLException{
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
	//���º�������ʵ�����ݿ��User����ɾ�Ĳ�
	
			public Manage setOne(ResultSet rs) throws SQLException{
				Manage	u=null;
				if(rs!=null)
				{
					u=new Manage();
					u.setId(rs.getString("id").trim());//�����ݼ��ж�ȡ��Ӧ���ֶ�ֵ������user�������Ӧ��Ա��
					u.setName(rs.getString("name").trim());
					u.setTime(rs.getString("time").trim());
					u.setInvest(rs.getString("invest").trim());
					u.setIncome(rs.getString("income").trim());
					u.setProfit(rs.getString("profit").trim()); //trim��������ȥ��ǰ��ո�
				}
				return u;
			}
			
			public Manage getOne(String ID) throws SQLException{
				Manage u=null;		
				String sql="select * from manage where id=?";
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
			
			public List<Manage>  getList() throws SQLException{
				List<Manage> ulist=null;		
				String sql="select * from manage";
				PreparedStatement pst=null;
				ResultSet rs=null;
				try{
					pst=Conn.prepareStatement(sql);			
					rs=pst.executeQuery();
					while(rs.next())
					{
						if(ulist==null) ulist=new ArrayList<Manage>();
						Manage u=setOne(rs);
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
			
			public int addOne(String ID,String name,String time,String invest,String income,String profit) throws SQLException  //ʣ����Լ�����
			{
				int re=0;
				String sql="insert into manage values (?,?,?,?,?,?)";
				//������Ӧ����String sql="insert into [User] values(?,?,?,?,?)";
				PreparedStatement pst=null;
				
				try{
					pst=Conn.prepareStatement(sql);			
					pst.setString(1, ID);
					pst.setString(2, name);
					pst.setString(3, time);
					pst.setString(4, invest);
					pst.setString(5, income);
					pst.setString(6, profit);
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
