package com.misha.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.misha.model.SitterRegistration;
import com.misha.repository.SitterRepository;

@Service
@Transactional
public class SitterService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SitterService.class);
	
	@Autowired
	private final SitterRepository sitterRepository;

	public SitterService(SitterRepository sitterRepository) {
		this.sitterRepository = sitterRepository;
	}

	public void saveSitter(SitterRegistration sitterRegistration) {
		sitterRepository.save(sitterRegistration);
	}
	
	public List<SitterRegistration> showAllSitterNearByMe(String address, Sort sort){
		List<SitterRegistration> sitters;
		
		LOGGER.debug("Searching");
		
		sitters = sitterRepository.findByAddressAndSort(address);
		return sitters;
	}

	/*
	 * public void showAllSitterNearByMe(){ SitterRegistration sitter = new
	 * SitterRegistration(); List<SitterRegistration> sitters = new ArrayList<>();
	 * sitterRepository.findByAddressAndSort(sitter.getAddress());
	 * System.out.println(sitters); }
	 */
	 
	 

}
