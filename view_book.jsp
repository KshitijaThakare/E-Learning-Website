<%@page import="com.entity.course_dtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.courseDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	courseDAOImpl dao = new courseDAOImpl(DBConnect.getConn());
	course_dtls b = dao.getCourseById(bid);
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="courses/<%=b.getPhoto()%>"
					style="height: 150px; width: 100px"><br>
				<h4 class="mt-3">
					Course Name:<span class="text-success"><%=b.getCourse_name()%></span>
				</h4>
				<h4>
					Author Name:<span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category:<span class="text-success"><%=b.getcategory()%></span>
				</h4>
			</div>

			<div class="col-md-6  text-center p-5 border bg-white">
				<h2><%=b.getCourse_name()%></h2>

				<%
				if ("old".equals(b.getcategory())) {
				%>
				<div>
					<h6 class="text-primary">Contact To Seller</h6>
					<h6 class="text-primary">
						<i class="fa-solid fa-envelope"></i>Email:<%=b.getUser_email()%></h6>
				</div>
				<%
				}
				%>


				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("old".equals(b.getcategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i>Continue Shopping</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
				</div>
				<%
				} else {
				%>

				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>