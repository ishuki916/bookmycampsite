package com.muwei.demo.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.muwei.demo.users.model.Users;
import com.muwei.demo.users.model.UsersRepository;

@Service
public class UsersService {

	@Autowired
	private UsersRepository uRepo;

	public Users createOrUpdateUser(Users m1) {
		Users m2 = uRepo.save(m1);
		return m2;
	}

	public Users checkUser(Users user) {

		if (user == null || user.getPwd().length() == 0) {
			return null;
		}

		if (user.getPwd() == null || user.getPwd().length() == 0) {
			return null;
		}

//		if(errors!=null && !errors.isEmpty()) {
//
//		}

		Users check = uRepo.findByEmailAndPwd(user.getEmail(), user.getPwd());

		if (check != null) {
			
			return check;
		}

		return null;
	}
	
	public Users checkUserEmail(Users user) {

//		if (user == null || user.getPwd().length() == 0) {
//			return null;
//		}
//
//		if (user.getPwd() == null || user.getPwd().length() == 0) {
//			return null;
//		}

//		if(errors!=null && !errors.isEmpty()) {
//
//		}

		Users check = uRepo.findByEmail(user.getEmail());

		if (check != null) {

			return check;
		}

		return null;
	}

	public List<Users> findAllUsers() {
		return uRepo.findAll();
	}

//	public Page<Users> getPage(int pageNumber) {
//		Pageable p = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "added");
//		return uRepo.findAll(p);
//	}

	public Users findUserById(Integer id) {
		Users u = uRepo.findUsersById(id);

		return u;
	}

	public void deleteUserById(Integer id) {
		uRepo.deleteById(id);
	}
	
	public Page<Users> getPage(int pageNumber) {
		Pageable p = PageRequest.of(pageNumber - 1, 6, Sort.Direction.ASC, "id");
		return uRepo.findAll(p);
	}
	
	public Users userVerify(Users user) {



//		if(errors!=null && !errors.isEmpty()) {
//
//		}

		Users check = uRepo.findByEmail(user.getEmail());

		if (check != null) {

			return check;
		}

		return null;
	}

	public Object findAllPage(Integer page, int size) {
		PageRequest pageable = PageRequest.of(page - 1, size);

		return uRepo.findAllByAuth(pageable, true);
	}

	public Object findByUsernamePage(String username, Integer page, int size) {
		PageRequest pageable = PageRequest.of(page - 1, size);
		@SuppressWarnings("rawtypes")
		Page ul = (Page) uRepo.findByUsernameContainingAndAuth(pageable, username, true);
		
		return ul;
	}

}