package com.cinema.dao;
import java.util.List;
import com.cinema.entity.PopCorn;
public interface IPopcornDAO {
	List<PopCorn> findAll();
	public List<PopCorn> findByType(String type);
}
