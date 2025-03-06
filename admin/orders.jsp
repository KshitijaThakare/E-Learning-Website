<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.orderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">

		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order No</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Course Name</th>
				<th scope="col">Professor Name</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>

			</tr>
		</thead>
		<tbody>

			<%
			orderDAOImpl dao = new orderDAOImpl(DBConnect.getConn());
			List<Book_order> blist = dao.getAllOrder();
			for (Book_order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrder_id()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFullAdd()%></td>
				<td><%=b.getPhone_no()%></td>
				<td><%=b.getCourseName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div style="margin-top: 300px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>