package com.muwei.demo.users.model;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepository extends JpaRepository<Users, Integer>{
	
	public Users findByEmailAndPwd(String email, String pwd);
	
	public Users findByEmail(String email);
	
	public Users findUsersById(Integer id);
	
	public Page<?> findAllByAuth(PageRequest pageable, boolean auth);

	public Page<?> findByUsernameContainingAndAuth(PageRequest pageable, String username, boolean auth);
}
