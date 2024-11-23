package com.cinema.services;
import java.util.List;
import com.cinema.entity.PopCorn;
public interface IPopcornService {
	List<PopCorn> getAllPopcorns();
	List<PopCorn> getPopcornsByType(String type);
}
