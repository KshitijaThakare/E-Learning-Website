<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary">Edit Profile</h5>
						
						<c:if test="${not empty failedMsg }">
							<h3 class="text-center text-danger">${failedMsg }</h3>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<h3 class="text-center text-success">${succMsg }</h3>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action="update_profile" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter FullName</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									required="required" name="fname" value="${userobj.name}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Contact</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="phone_no" value="${userobj.phone_no }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>