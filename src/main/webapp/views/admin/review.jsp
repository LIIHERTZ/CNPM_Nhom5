<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<body>
<!-- main content -->
<main class="container-fluid">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Reviews</h2>
					<span class="main__title-stat">Total Reviews:
						${noOfRecords}</span>
				</div>
			</div>
			<!-- reviews table -->
			<div class="col-12">
				<div class="catalog catalog--1">
					<div class="catalog__table-container">
						<!-- Bọc bảng trong thẻ này -->
						<table class="catalog__table">
							<thead>
							<tr>
								<th>ID</th>
								<th>Reviewer</th>
								<th>Rating</th>
								<th>Content</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="review" items="${reviews}">
								<tr>
									<td><div class="catalog__text">${review.reviewID}</div></td>
									<td><div class="catalog__text">${review.person.fullName}</div></td>
									<td><div class="catalog__text catalog__text--rate">${review.evaluate}</div></td>
									<td><div class="catalog__text">${review.content}</div></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end reviews table -->
			<div class="col-12">
				<div class="main__paginator">
						<span class="main__paginator-pages"> ${currentPage} of
							${totalPages} </span>
					<ul class="main__paginator-list">
						<!-- Nút Prev: chỉ hoạt động khi currentPage > 1 -->
						<li><a
								href="${pageContext.request.contextPath}/adminReview?movieID=${movieId}&page=${currentPage > 1 ? currentPage - 1 : 1}">
							<i class="ti ti-chevron-left"></i> <span>Prev</span>
						</a></li>
						<!-- Nút Next: chỉ hoạt động khi currentPage < totalPages -->
						<li><a
								href="${pageContext.request.contextPath}/adminReview?movieID=${movieId}&page=${currentPage < totalPages ? currentPage + 1 : totalPages}">
							<span>Next</span> <i class="ti ti-chevron-right"></i>
						</a></li>
					</ul>
					<ul class="paginator">
						<li class="paginator__item paginator__item--prev"><a
								href="${pageContext.request.contextPath}/adminReview?movieID=${movieId}&page=${currentPage > 1 ? currentPage - 1 : 1}">
							<i class="ti ti-chevron-left"></i>
						</a></li>
						<!-- Hiển thị các trang -->
						<c:forEach begin="0" end="${totalPages - 1}" var="i">
							<li
									class="paginator__item ${i == currentPage - 1 ? 'paginator__item--active' : ''}">
								<a
										href="${pageContext.request.contextPath}/adminReview?movieID=${movieId}&page=${i + 1}">${i + 1}</a>
							</li>
						</c:forEach>
						<li class="paginator__item paginator__item--next"><a
								href="${pageContext.request.contextPath}/adminReview?movieID=${movieId}&page=${currentPage < totalPages ? currentPage + 1 : totalPages}">
							<i class="ti ti-chevron-right"></i>
						</a></li>
					</ul>
				</div>
			</div>


		</div>
	</div>
</main>

</body>