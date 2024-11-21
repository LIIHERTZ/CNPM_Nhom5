<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- user modal -->
<form
	action="${pageContext.request.contextPath}/admin/coupons/update?couponID=${coupon.couponID}"
	method="post" class="modal__form">
	<h4 class="modal__title">Edit Coupon</h4>

	<div class="row">
		<div class="col-12">
			<div class="sign__group">
				<label class="sign__label" for="couponName">Coupon Name</label> <input
					type="text" class="sign__input" name="couponName" id="couponName"
					placeholder="Coupon Name" required value="${coupon.couponName }">
			</div>
		</div>
		<div class="col-12">
			<div class="sign__group">
				<label class="sign__label" for="couponType">Type</label> <select
					class="sign__selectjs" name="couponType" id="couponType" required
					value="${coupon.couponType }">
					<option value="Coupon 1">Coupon 1</option>
					<option value="Coupon 2">Coupon 2</option>
					<option value="Coupon 3">Coupon 3</option>
					<option value="Coupon 4 ">Coupon 4</option>
				</select>
			</div>
		</div>
		<div class="col-12">
			<div class="sign__group">
				<label class="sign__label" for="couponValue">Coupon Value</label> <input
					type="text" class="sign__input" name="couponValue" id="couponValue"
					placeholder="Coupon Value" required value="${coupon.couponValue }">
			</div>
			<!-- Định dạng ngày sử dụng JSTL -->
			<fmt:formatDate value="${coupon.startDate}" pattern="yyyy-MM-dd"
				var="formattedDate" />
		</div>
		<div class="col-12">
			<div class="sign__group">
				<label class="sign__label" for="startDate">Start Date</label> <input
					type="Date" class="sign__input" name="startDate" id="startDate"
					required value="${formattedDate}">
			</div>
		</div>
		<!-- Định dạng ngày sử dụng JSTL -->
			<fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"
				var="formattedDate" />
		<div class="col-12">
			<div class="sign__group">
				<label class="sign__label" for="endDate">End Date</label> <input
					type="Date" class="sign__input" name="endDate" id="endDate"
					required value="${formattedDate }">
			</div>
		</div>

		<div class="col-12">
			<button type="submit" class="sign__btn sign__btn--small">
				<span>Update</span>
			</button>
		</div>
	</div>
</form>
<!-- end user modal -->