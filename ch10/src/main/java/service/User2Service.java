package service;

import java.util.List;

import dao.User2DAO;
import dto.User2DTO;

public class User2Service {

	// 싱글톤
	private final static User2Service INSTANCE = new User2Service();
	public static User2Service getInstance() {
		return INSTANCE;
	}
	private User2Service() {}
	
	// DAO 호출
	private User2DAO dao = User2DAO.getInstance();	
	
	public void registerUser2(User2DTO dto) {
		dao.insertUser2(dto);
	}
	
	public User2DTO findUser2(String uid) {
		return dao.selectUser2(uid);
	}
	
	public List<User2DTO> findAllUser2() {
		return dao.selectAllUser2();
	}
	
	public void modifyUser2(User2DTO dto) {
		dao.updateUser2(dto);
	}
	
	public void removeUser2(String uid) {
		dao.deleteUser2(uid);
	}
}