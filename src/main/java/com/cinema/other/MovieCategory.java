package com.cinema.other;


import java.util.ArrayList;
import java.util.List;
public enum MovieCategory {
	
		    ACTION("Action"),
		    ANIMATION("Animation"),
		    COMEDY("Comedy"),
		    CRIME("Crime"),
		    DRAMA("Drama"),
		    FANTASY("Fantasy"),
		    HISTORICAL("Historical"),
		    HORROR("Horror"),
		    ROMANCE("Romance"),
		    SCIENCE_FICTION("Science Fiction"),
		    THRILLER("Thriller"),
		    WESTERN("Western"),
		    OTHER("Other");

		    private final String displayName;

		    MovieCategory(String displayName) {
		        this.displayName = displayName;
		    }

		    public String getDisplayName() {
		        return displayName;
		    }

		    // Lấy danh sách tên các thể loại phim
		    public static List<String> getListCategories() {
		        List<String> categories = new ArrayList<>();
		        for (MovieCategory category : MovieCategory.values()) {
		            categories.add(category.getDisplayName());
		        }
		        return categories;
		    }
		
		}



