package class_package;

public class Teacher {
	private String ID;
	private String name;
	private int age;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public static String getHeader(){
		String re = "";
		re+="<th>±àºÅ</th>ĞÕÃû<th></th>ÄêÁä<th></th>";
		return re;
	}
	
	public String getOne(){
		String re="";
		re+="<td>"+this.ID+"</td>";
		re+="<td>"+this.name+"</td>";
		re+="<td>"+this.age+"</td>";
		return re;
	}
}
