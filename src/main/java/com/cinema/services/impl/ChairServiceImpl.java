package com.cinema.services.impl;

import com.cinema.entity.Chair;
import com.cinema.services.IChairService;
import com.cinema.dao.IChairDAO;
import com.cinema.dao.impl.ChairDAOImpl;
public class ChairServiceImpl implements IChairService 	 {

	IChairDAO chairDAO = new ChairDAOImpl();
	
	 @Override
	    public boolean addChair(Chair chair) {
	        return chairDAO.addChair(chair);
	    }
	
}
