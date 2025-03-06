<%@page import="com.entity.User"%>
<%@page import="com.DAO.courseDAOImpl"%>
<%@page import="com.entity.course_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Courses</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background:
		url("https://thumbs.dreamstime.com/b/e-learning-edtech-education-technology-elearning-online-internet-concept-214734899.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #d9d6d4;
}
</style>
</head>
<body>

<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			courseDAOImpl dao2 = new courseDAOImpl(DBConnect.getConn());
			List<course_dtls> list2 = dao2.getAllRecentBook();
			for (course_dtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="courses/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=b.getCourse_name()%></p>
						<p><%=b.getAuthor()%></p>

						<%
						if (b.getcategory().equals("old")) {
						%>
						<p>
							Categories:<%=b.getcategory()%></p>
						<div class="row">
							<a href="view_book.jsp?bid=<%=b.getCourse_id()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p>
							Categories:<%=b.getcategory()%></p>
						<div class="row ">
							<!-- a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>cart</a--> 
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getCourse_id() %>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i> Cart
							</a>

							<%
							}
							%>
								<a href="view_book.jsp?bid=<%=b.getCourse_id()%>"class="btn btn-success btn-sm ml-1">View Details</a>
								 <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>