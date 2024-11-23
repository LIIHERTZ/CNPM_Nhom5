<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->


<main class="container-fluid">
	<div class="container-fluid">


		<!-- user modal -->
		<form action="${pageContext.request.contextPath}/admin/users/save "
			method="post" class="modal__form">
			<h4 class="modal__title">Add User</h4>

			<div class="row">
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="email2">Email</label> <input
							id="email2" type="text" name="email" class="sign__input"
							placeholder="email@email.com">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="fname">Name</label> <input
							id="fname" type="text" name="fname" class="sign__input"
							placeholder="John Doe">
					</div>
				</div>

				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="password">Password</label> <input
							id="password" type="password" name="password" class="sign__input">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="phone">Phone</label> <input
							id="phone" type="text" name="phone" class="sign__input"
							placeholder="023812319376">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="rights">Rights</label> <select
							class="sign__select" id="rights" name="rights">
							<option value="User">User</option>
							<option value="Admin">Admin</option>
						</select>
					</div>
				</div>
				<div class="col-12 col-lg-6 offset-lg-3">
					<button type="submit" class="sign__btn sign__btn--modal">Add</button>
				</div>
			</div>
		</form>
		<!-- end user modal -->
	</div>
</main>