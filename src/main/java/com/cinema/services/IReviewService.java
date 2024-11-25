package com.cinema.services;

import java.util.List;

import com.cinema.entity.Review;

public interface IReviewService {

	void updateReview(Review review);

	void deleteReview(int reviewID);
	
	int countReviewsByMovie(int movieId);

	List<Review> getReviewsByMovie(int movieId);

	boolean addReview(Review review);

	List<Review> getReviewsByMovieWithPagination(int movieId, int page, int pageSize);

	
	
	
}
