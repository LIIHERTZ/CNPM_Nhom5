<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<body>
	
	<!-- main content -->
	<main class="container-fluid">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Movie</h2>

						<span class="main__title-stat">Total Movies :
							${noOfRecords}</span>
						<div class="main__title-wrap">		
							<!-- search -->
							<a
							href="${pageContext.request.contextPath}/admin/addMovie"
							class="main__title-link main__title-link--wrap">Add Movie</a>


						</div>			
					
						<div class="main__title">
						
						
							<form action="${pageContext.request.contextPath}/admin/searchMovie" method="get" class="main__title-form">
						    <input type="text" class="search__keyword" name="keyword" placeholder="Find Movie by name.............." value="${keyword != null ? keyword : ''}">
						    <select name="category" class="sign__selectjs" id="sign__genre" multiple>
						        <option value="All" <c:if test="${fn:contains(category, 'All') || empty category}">selected</c:if>>All Categories</option>
						        <option value="Action" <c:if test="${fn:contains(category, 'Action')}">selected</c:if>>Action</option>
						        <option value="Animation" <c:if test="${fn:contains(category, 'Animation')}">selected</c:if>>Animation</option>
						        <option value="Comedy" <c:if test="${fn:contains(category, 'Comedy')}">selected</c:if>>Comedy</option>
						        <option value="Crime" <c:if test="${fn:contains(category, 'Crime')}">selected</c:if>>Crime</option>
						        <option value="Drama" <c:if test="${fn:contains(category, 'Drama')}">selected</c:if>>Drama</option>
						        <option value="Fantasy" <c:if test="${fn:contains(category, 'Fantasy')}">selected</c:if>>Fantasy</option>
						        <option value="Historical" <c:if test="${fn:contains(category, 'Historical')}">selected</c:if>>Historical</option>
						        <option value="Horror" <c:if test="${fn:contains(category, 'Horror')}">selected</c:if>>Horror</option>
						        <option value="Romance" <c:if test="${fn:contains(category, 'Romance')}">selected</c:if>>Romance</option>
						        <option value="Science-fiction" <c:if test="${fn:contains(category, 'Science-fiction')}">selected</c:if>>Science-fiction</option>
						        <option value="Thriller" <c:if test="${fn:contains(category, 'Thriller')}">selected</c:if>>Thriller</option>
						        <option value="Western" <c:if test="${fn:contains(category, 'Western')}">selected</c:if>>Western</option>
						        <option value="Other" <c:if test="${fn:contains(category, 'Other')}">selected</c:if>>Other</option>
						    </select>
						    
						    <button type="submit">
						        <i class="ti ti-search"></i>
						    </button>
						</form>
						 	 </div>
						
						
					</div>
				</div>
				<!-- end main title -->

				<!-- items -->
				<div class="col-12">
					<div class="catalog catalog--1">
						<table class="catalog__table">
							<thead>
								<tr>
									<th>ID</th>
									<th>MovieName</th>
									<th>Category</th>
									<th>Image</th>
									<th>MovieDuration</th>
									<th>Rating</th>
									<th>Release Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="movie" items="${movies}">
									<tr>
										<td><div class="catalog__text">${movie.movieID}</div></td>
										<td><div class="catalog__text">${movie.movieName}</div></td>
										<td><div class="catalog__text">${movie.category}</div></td>
										<td><c:choose>
												<c:when test="${movie.image.substring(0,5) != 'https'}">
													<c:url value="/image?fname=${movie.image}" var="imgUrl" />
												</c:when>
												<c:otherwise>
													<c:set var="imgUrl" value="${movie.image}" />
												</c:otherwise>
											</c:choose>
											<div class="catalog__text">
												<img src="${imgUrl}" alt="${movie.image}" width="150"
													height="150" />
											</div></td>
										<td><div class="catalog__text">${movie.movieDuration}</div></td>
										<td><div class="catalog__text">${movie.rating}</div></td>
										<td>
    										<div class="catalog__text">
										        <fmt:formatDate value="${movie.releaseDay}" pattern="MM-dd-yyyy"/>
										    </div>
										</td>
										
										<td><div
												class="catalog__text ${movie.status ? 'catalog__text--green' : 'catalog__text--red'}">${movie.status ? 'Active' : 'Inactive'}</div></td>



										<td>
											<div class="catalog__btns">
												<a
													href="${pageContext.request.contextPath}/admin/editMovie?id=${movie.movieID}"
													class="catalog__btn catalog__btn--edit"> <i
													class="ti ti-edit"></i>
												</a>
												<button type="button" data-bs-toggle="modal"
													class="catalog__btn catalog__btn--delete"
													data-bs-target="#modal-delete"
													data-movie-id="${movie.movieID}">
													<i class="ti ti-trash"></i>
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
				<!-- end items -->

<!-- pagination -->
<div class="col-12">
    <div class="main__paginator">
        <!-- amount -->
        <span class="main__paginator-pages">${currentPage} of ${noOfPages}</span>
        <!-- end amount -->

        <ul class="main__paginator-list">
            <!-- Previous Page Link -->
            <li>
                <c:choose>
                    <c:when test="${not empty keyword || (not empty category && !fn:contains(category, 'All'))}">
                        <a href="<c:url value='/admin/searchMovie'>
                            <c:param name='keyword' value='${keyword}'/>
                            <c:forEach var="cat" items="${category}">
                                <c:param name="category" value="${cat}"/>
                            </c:forEach>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                            <span>Prev</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/movies'>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                            <span>Prev</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>

            <!-- Next Page Link -->
            <li>
                <c:choose>
                    <c:when test="${not empty keyword || (not empty category && !fn:contains(category, 'All'))}">
                        <a href="<c:url value='/admin/searchMovie'>
                            <c:param name='keyword' value='${keyword}'/>
                            <c:forEach var="cat" items="${category}">
                                <c:param name="category" value="${cat}"/>
                            </c:forEach>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <span>Next</span>
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/movies'>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <span>Next</span>
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>

        <ul class="paginator">
            <!-- Previous Page Link -->
            <li class="paginator__item paginator__item--prev">
                <c:choose>
                    <c:when test="${not empty keyword || (not empty category && !fn:contains(category, 'All'))}">
                        <a href="<c:url value='/admin/searchMovie'>
                            <c:param name='keyword' value='${keyword}'/>
                            <c:forEach var="cat" items="${category}">
                                <c:param name="category" value="${cat}"/>
                            </c:forEach>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/movies'>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>

            <!-- Page Numbers -->
            <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                <li class="paginator__item ${pageNumber == currentPage ? 'paginator__item--active' : ''}">
                    <c:choose>
                        <c:when test="${not empty keyword || (not empty category && !fn:contains(category, 'All'))}">
                            <a href="<c:url value='/admin/searchMovie'>
                                <c:param name='keyword' value='${keyword}'/>
                                <c:forEach var="cat" items="${category}">
                                    <c:param name="category" value="${cat}"/>
                                </c:forEach>
                                <c:param name='page' value='${pageNumber}'/>
                            </c:url>">${pageNumber}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/admin/movies'>
                                <c:param name='page' value='${pageNumber}'/>
                            </c:url>">${pageNumber}</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:forEach>

            <!-- Next Page Link -->
            <li class="paginator__item paginator__item--next">
                <c:choose>
                    <c:when test="${not empty keyword || (not empty category && !fn:contains(category, 'All'))}">
                        <a href="<c:url value='/admin/searchMovie'>
                            <c:param name='keyword' value='${keyword}'/>
                            <c:forEach var="cat" items="${category}">
                                <c:param name="category" value="${cat}"/>
                            </c:forEach>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/movies'>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</div>
<!-- end pagination -->


			</div>
			<!-- end items -->
		</div>
	</main>
	<!-- end main content -->
	<!-- delete modal -->
	<div class="modal fade" id="modal-delete" tabindex="-1"
		aria-labelledby="modal-delete" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal__content">
					<form action="${pageContext.request.contextPath}/admin/deleteMovie"
						class="modal__form">
						<h4 class="modal__title">Delete Movie</h4>

						<p class="modal__text">Are you sure to permanently delete this
							Movie?</p>
						<input type="hidden" name="id" id="deleteMovieId">
						<div class="modal__btns">
							<button class="modal__btn modal__btn--apply" type="submit">
								<span>Delete</span>
							</button>
							<button class="modal__btn modal__btn--dismiss" type="button"
								data-bs-dismiss="modal" aria-label="Close">
								<span>Dismiss</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end delete modal -->
	<!-- Add Item Modal -->
	<!-- add cinema modal -->
	<div class="modal fade" id="modal-add-movie" tabindex="-1"
		aria-labelledby="modal-add-movie" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/admin/addMovie"
					method="POST" class="sign__form sign__form--add">
					<h4 class="modal__title">Add Movie</h4>
					<div class="row">
						<div class="col-12">
							<label class="sign__label" for="movie_name">Movie Name</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="movie_name"
									placeholder="Movie Name" required>
							</div>
						</div>
						<div class="col-12">
							<label class="sign__label" for="movie_name">Category</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="category"
									placeholder="Category" required>
							</div>
						</div>
						<div class="col-12">
							<label class="sign__label" for="movie_name">Movie Duration</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="movie_duration"
									placeholder="Example: 1h 30m" required>
							</div>
						</div>
						<div class="col-12">
							<label class="sign__label" for="address">Description</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="description"
									placeholder="Description" required>
							</div>
						</div>

						<div class="col-12">
							<label class="sign__label" for="location">Release Day</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="release_day"
									placeholder="Release Day" required>
							</div>
						</div>


						<div class="col-12">
							<label class="sign__label" for="status">Status</label>
							<div class="sign__group">
								<select class="sign__selectjs" name="status" id="sign__status"
									required>
									<option value="true">Active</option>
									<option value="false">Inactive</option>
								</select>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<div class="sign__gallery">
									<label id="gallery1" for="sign__gallery-upload">Upload
										cover (240x340)</label> <input data-name="#gallery1"
										id="sign__gallery-upload" name="images"
										class="sign__gallery-upload" type="file"
										accept=".png, .jpg, .jpeg" style="display: none;"
										onchange="chooseFile(this)">
								</div>
							</div>

							<div class="col-12">
								<button type="submit" class="sign__btn sign__btn--small">
									<span>Insert</span>
								</button>
							</div>
						</div>
						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small">
								<span>Save</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end add cinema modal -->

	<script>
    // JavaScript to assign the cinema ID to the hidden input field in the delete form
    document.querySelectorAll('.catalog__btn--delete').forEach(button => {
        button.addEventListener('click', function () {
            const movieId = this.getAttribute('data-movie-id');
            document.getElementById('deleteMovieId').value = movieId;
        });
    });
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
	<style>
	
	
	.sign__selectjs {
    width: 110%;  /* Đảm bảo thẻ select chiếm đủ không gian của container */
    max-width: 477px; /* Bạn có thể điều chỉnh max-width để thẻ rộng hơn */
}
	.search__keyword {
	width: 150%;
    max-width: 450px; /* Thay đổi giá trị này để điều chỉnh độ dài */
}
			
	
	</style>




}
</body>