<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-success">Add Address</h5>
						<form action="">

							<div class="form-row">

								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>

								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
							</div>

							<div class="form-row">

								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>

								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>

								<div class="form-group col-md-4">
									<label for="inputPassword4">Pincode</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
								<botton class="btn btn-warning text-black"> Add Address</botton>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>