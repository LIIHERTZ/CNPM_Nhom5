package com.cinema.services;

import java.util.List;

import com.cinema.entity.Review;

public interface IReviewService {

	boolean addReview(Review review);

	void updateReview(Review review);

	boolean deleteReview(int reviewID);

	int countReviewsByMovie(int movieId);

	List<Review> getReviewsByMovie(int movieId);

	boolean hasReviewed(int perID, int movieID);

	List<Review> getReviewsByMovieWithPagination(int movieId, int page, int pageSize);
	int getTotalReviewCountByMovie(int movieId);
}