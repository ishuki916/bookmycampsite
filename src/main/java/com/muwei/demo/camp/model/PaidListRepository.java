package com.muwei.demo.camp.model;



import org.springframework.data.jpa.repository.JpaRepository;



public interface PaidListRepository extends JpaRepository<PaidList, Integer>,CampsiteRepositoryCustom {
   

	
	

}
