


<!-- user modal -->
				<form action="${pageContext.request.contextPath}/admin/users/update?userId=${user.perID } " method = "post" class="modal__form">
					<h4 class="modal__title">Edit User</h4>

					<div class="row">
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="email2">Email</label> <input
									id="email2" type="text" name="email" class="sign__input"
									placeholder="email@email.com" value = ${user.email}>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="fname">Name</label> <input
									id="fname" type="text" name="fname" class="sign__input"
									placeholder="John Doe" value = ${user.fullName}>
							</div>
						</div>

						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="password">Password</label> <input
									id="password" type="password" name="password" class="sign__input" value = ${user.password}>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="phone">Phone</label> <input
									id="phone" type="text" name="phone" class="sign__input"
									placeholder="023812319376" value = ${user.phone}>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="rights">Rights</label> <select
									class="sign__select" id="rights" name="rights" value = ${user.role}>
									<option value="User">User</option>
									<option value="Admin">Admin</option>
								</select>
							</div>
						</div>
						<div class="col-12 col-lg-6 offset-lg-3">
							<button type="submit" class="sign__btn sign__btn--modal">Update</button>
						</div>
					</div>
				</form>
<!-- end user modal -->