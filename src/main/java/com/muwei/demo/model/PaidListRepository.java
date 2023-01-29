package com.muwei.demo.model;



import org.springframework.data.jpa.repository.JpaRepository;



public interface PaidListRepository extends JpaRepository<PaidList, Integer>,CampsiteRepositoryCustom {
   

	
	

}
