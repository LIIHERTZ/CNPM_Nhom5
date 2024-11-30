package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IReviewDao;
import com.cinema.dao.impl.ReviewDaoImpl;
import com.cinema.entity.Review;
import com.cinema.services.IReviewService;

public class ReviewServiceImpl implements IReviewService{
    private IReviewDao reviewDao;

    public ReviewServiceImpl() {
        reviewDao = new ReviewDaoImpl();
    }

    @Override
    public boolean addReview(Review review) {
        if (review == null) {
            System.err.println("Review object is null, cannot add to database.");
            return false;
        }
        return reviewDao.addReview(review);
    }

    @Override
    public void updateReview(Review review) {
        reviewDao.updateReview(review);
    }

    @Override
    public boolean deleteReview(int reviewID) {
        reviewDao.deleteReview(reviewID);
        return false;
    }

    @Override
    public int countReviewsByMovie(int movieId) {
        return reviewDao.countReviewsByMovie(movieId);
    }

    @Override
    public List<Review> getReviewsByMovie(int movieId) {
        return reviewDao.getReviewsByMovie(movieId);
    }
    @Override
    public boolean hasReviewed(int perID, int movieID) {
        List<Review> reviews = reviewDao.getReviewsByMovieAndPerson(perID, movieID );
        return reviews != null && !reviews.isEmpty();
    }
    @Override
    public List<Review> getReviewsByMovieWithPagination(int movieId, int page, int pageSize) {
        return reviewDao.getReviewsByMovieWithPagination(movieId, page, pageSize);
    }

    public int getTotalReviewCountByMovie(int movieId) {
        return reviewDao.countReviewsByMovie(movieId);
    }
}