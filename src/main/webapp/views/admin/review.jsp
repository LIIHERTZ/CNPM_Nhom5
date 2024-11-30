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

				<!-- end reviews table -->

			</div>
		</div>
	</main>	
<style>
    .catalog__table-container {
        overflow-x: auto; /* Thêm thanh cuộn ngang khi bảng vượt quá độ rộng */
        max-width: 100%;  /* Giới hạn độ rộng tối đa cho bảng */
    }

    .catalog__table {
        min-width: 1000px; /* Đảm bảo bảng không bị co lại khi dữ liệu quá nhiều */
    }
</style>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/slimselect.min.js"></script>
	<script src="js/smooth-scrollbar.js"></script>
	<script src="js/admin.js"></script>
</body>
