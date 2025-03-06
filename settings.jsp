<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f1f2">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />

	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="cantainer">
		<h3 class="text-center">Hello ${userobj.name }</h3>

		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Courses</h4>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4>Old Courses</h4>
						</div>
					</div>
				</a>
			</div>
			




			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-address-card fa-3x"></i>
							</div>
							<h4>Login & Security(Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-6 mt-3">
				<a href="order_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3">
				<a href="support.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-id-card-clip fa-3x"></i>
							</div>
							<h4>Customer Support</h4>
							<p>Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div style="margin-top: 70px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>