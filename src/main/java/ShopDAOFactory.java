


public class ShopDAOFactory {
	//單利工廠模式
	private static final StudentDAO Student_DAO=creatStudentDAO();
	
	private static StudentDAO creatStudentDAO() {
		StudentDAO sDAO=new StudentDAO();
		return sDAO;
	}

	public static StudentDAO getStudentDAO() {
		return Student_DAO;
	}
}
