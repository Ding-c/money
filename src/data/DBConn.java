package data;
import java.sql.*;
import java.sql.Statement;
	



public class DBConn {
	//连接字，mysql可能有所不同
		private static String URL="jdbc:mysql://localhost:3306/money?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai"; //tt要改成你自己数据库的名称
		private static String USER="root";
		private static String PWD="cd1320505";
		private static String DRIVER = "com.mysql.cj.jdbc.Driver";
		
		static {		  
			
	        try {
	            Class.forName(DRIVER);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
		
		public static Connection getConn() throws SQLException{
			
		    return DriverManager.getConnection(URL,USER,PWD);
		}
		
		//以下三个重载函数close，用于关闭stmt,res等
		public static void close(Statement stmt,ResultSet res) throws SQLException{
			try{
				
				if(stmt!=null)
					stmt.close();
				if(res!=null)
					res.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			
		}
		public static void close(Statement stmt) throws SQLException{
			close(stmt,null);
		}
		public static void Close(Connection Conn) throws SQLException{
			try{
				if(Conn!=null)
					Conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		


}
