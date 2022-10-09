package com.misha.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.misha.model.SitterRegistration;

@Repository
public interface SitterRepository  extends CrudRepository<SitterRegistration, Integer>{
	
	
	  @Query("SELECT a FROM SitterRegistration a WHERE a.address LIKE %?1%")
	  List<SitterRegistration> findByAddressAndSort(@Param("address") String address);
	 
}
