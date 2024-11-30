package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Review;

public interface IReviewDao {
	boolean addReview(Review review);

	void updateReview(Review review);

	void deleteReview(int reviewID);

	int countReviewsByMovie(int movieId);

	List<Review> getReviewsByMovie(int movieId);

	List<Review> getReviewsByMovieAndPerson(int perID, int movieID);

	List<Review> getReviewsByMovieWithPagination(int movieId, int page, int pageSize);
}