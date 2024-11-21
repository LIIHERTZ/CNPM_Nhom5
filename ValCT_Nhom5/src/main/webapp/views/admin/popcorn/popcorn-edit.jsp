
				<form action="${pageContext.request.contextPath}/admin/popcorns/update?popcornID=${popcorn.popcornID}" method = "post" class="modal__form">
					<h4 class="modal__title">Edit PopCorn</h4>

					<div class="row">
						<div class="col-12">
                                <div class="sign__group">
                                <label class="sign__label" for="namePopCorn">PopCorn Name</label>
                                    <input type="text" class="sign__input" name="namePopCorn"  id = "namePopCorn" placeholder="Popcorn Combo Name" required value ="${popcorn.namePopCorn}">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="sign__group">
                                 <label class="sign__label" for="price">Price</label>
                                    <input type="number" class="sign__input" name="price"  id = "price"placeholder="Price" required value ="${popcorn.price}">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="sign__group">
                                <label class="sign__label" for="typePopCorn">Type</label>
                                    <select class="sign__selectjs" name="typePopCorn" id="typePopCorn" required value ="${popcorn.typePopCorn}">
                                        <option value="Small">Small</option>
                                        <option value="Regular">Regular</option>
                                        <option value="Large">Large</option>
                                        <option value="Extra Large">Extra Large</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="sign__group">
                                 <label class="sign__label" for="status">Status</label>
                                    <select class="sign__selectjs" name="status" id="status" required value ="${popcorn.status}">
                                        <option value="Available">Available</option>
                                        <option value="Unavailable">Unavailable</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="submit" class="sign__btn sign__btn--small"><span>Update</span></button>
                            </div>
					</div>
				</form>
<!-- end user modal -->