<%@page import="com.entity.course_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.courseDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECourse:Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty succMsg }">
							<div class="alert alert-success text-center">${succMsg }</div>

							<c:remove var="succMsg" scope="session" />
						</c:if>
	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Course Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				courseDAOImpl dao = new courseDAOImpl(DBConnect.getConn());
				List<course_dtls> list = dao.getBookByOld(email, "Old");
				for (course_dtls b : list) {
				%>

				<tr>
					<td><%=b.getCourse_name() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getcategory() %></td>
					<td><a href="delete_old_book?em=<%=email %>&&id=<%=b.getCourse_id() %>" class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>

</html>