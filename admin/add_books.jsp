<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%-- 	<!%@page import="com.entity.userDtls" %>
<%
userDtls user1=(userDtls) session.getAttribute("admin");
	if (user1 == null) {
		response.sendRedirect("../login.jsp");
	}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Courses</title>
<%@ include file="allCss.jsp"%>
</head>

<body style="background-color: #f0f2f2;">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	
	<c:redirect url="../login.jsp"/>
	</c:if>
	<!--  %
	String successMsg = (String) session.getAttribute("successMsg");
	String errorMsg = (String) session.getAttribute("errorMsg");
	%-->
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<!-- div class="text-center"-->
						<h4 class="text-center">Add Course</h4>
						<c:if test="${ not empty succMsg}">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${ not empty failedMsg}">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>

						<%-- <%
						if(successMsg !=null){
					    %>	
					    <p class="text-success"><%=successMsg%></p>
					    <%
					    session.removeAttribute("successMsg");
					    }
						if(errorMsg!=null){
						%>
						<p class="text-danger"><%=errorMsg%></p>
						<%
						session.removeAttribute("errorMsg");
						}
						%> --%>
						<form action="../add_books" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Course Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Professsor Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="inputState">Course Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Course</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Course Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exmapleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exmapleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>