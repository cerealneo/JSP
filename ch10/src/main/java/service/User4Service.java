package service;

import java.util.List;

import dao.User1DAO;
import dto.User1DTO;

public class User4Service {

	// 싱글톤
	private final static User4Service INSTANCE = new User4Service();
	public static User4Service getInstance() {
		return INSTANCE;
	}
	private User4Service() {}
	
	// DAO 호출
	private User1DAO dao = User1DAO.getInstance();	
	
	public void registerUser1(User1DTO dto) {
		dao.insertUser1(dto);
	}
	
	public User1DTO findUser1(String uid) {
		return dao.selectUser1(uid);
	}
	
	public List<User1DTO> findAllUser1() {
		return dao.selectAllUser1();
	}
	
	public void modifyUser1(User1DTO dto) {
		dao.updateUser1(dto);
	}
	
	public void removeUser1(String uid) {
		dao.deleteUser1(uid);
	}
}