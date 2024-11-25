package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IReviewDao;
import com.cinema.dao.impl.ReviewDaoImpl;
import com.cinema.entity.Review;
import com.cinema.services.IReviewService;

public class ReviewServiceImpl implements IReviewService{
	private ReviewDaoImpl reviewDAO;

    public ReviewServiceImpl() {
        reviewDAO = new ReviewDaoImpl();
    }

    public boolean addReview(Review review) {
        try {
            reviewDAO.addReview(review); // Attempt to add the review
            return true; // If no exception occurs, return true indicating success
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging purposes
            return false; // Return false if an exception occurs
        }
    }

    public void updateReview(Review review) {
        reviewDAO.updateReview(review);
    }

    public void deleteReview(int reviewID) {
        reviewDAO.deleteReview(reviewID);
    }
    
       
    public int countReviewsByMovie(int movieId) {
        return reviewDAO.countReviewsByMovie(movieId);
    }
    
    public List<Review> getReviewsByMovie(int movieId) {
        return reviewDAO.getReviewsByMovie(movieId);
    }
    
    public List<Review> getReviewsByMovieWithPagination(int movieId, int page, int pageSize) {
        int offset = (page - 1) * pageSize; // Tính `offset` dựa trên trang hiện tại và kích thước trang
        return reviewDAO.getReviewsByMovieWithPagination(movieId, offset, pageSize);
    }

   
   
    
	
}
