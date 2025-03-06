<%@page import="com.entity.User"%>
<%@page import="com.entity.course_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.courseDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
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
<body style="background-color: #f7f7f7;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center" style="color: #d0dbd1;">Smart-Learning
			EHub</h2>

	</div>



	<!--  start recent  -->
	<div class="container">
		<h3 class="text-center">Recent Course</h3>
		<div class="row">
			<%
			courseDAOImpl dao2 = new courseDAOImpl(DBConnect.getConn());
			List<course_dtls> list2 = dao2.getRecentBook();
			for (course_dtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="courses/<%=b.getPhoto()%>"
							style="width: 200px; height: 250px;" class="img-thumblin">
						<p><%=b.getCourse_name()%></p>
						<p><%=b.getAuthor()%></p>

						<%
						if (b.getcategory().equals("old")) {
						%>
						<p>
							Categories:<%=b.getcategory()%></p>
						<div class="row ">
							<a href="view_book.jsp?bid=<%=b.getCourse_id()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p>
							Categories:<%=b.getcategory()%></p>
						<div class="row ">
						
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
							 <a href="view_book.jsp?bid=<%=b.getCourse_id()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
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
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!--  end recent -->

	<hr>

	<!--  start new  -->
	<div class="container">
		<h3 class="text-center">New Courses</h3>
		<div class="row">
			<%
			courseDAOImpl dao = new courseDAOImpl(DBConnect.getConn());
			List<course_dtls> list = dao.getNewBook();
			for (course_dtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="courses/<%=b.getPhoto()%>"
							style="width: 200px; height: 250px;" class="img-thumblin">
						<p><%=b.getCourse_name()%></p>
						<p><%=b.getAuthor()%></p>

						<p>
							Categories:<%=b.getcategory()%></p>
						<div class="row ">

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
							<a href="view_book.jsp?bid=<%=b.getCourse_id()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<!--  end new -->
	<hr>

	<!--  start old  -->
	<div class="container">
		<h3 class="text-center">Old Courses</h3>
		<div class="row">
			<%
			courseDAOImpl dao3 = new courseDAOImpl(DBConnect.getConn());
			List<course_dtls> list3 = dao2.getoldBook();
			for (course_dtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="courses/<%=b.getPhoto()%>"
							style="width: 200px; height: 250px;" class="img-thumblin">
						<p><%=b.getCourse_name()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getcategory()%></p>
						<div class="row ">

							<a href="view_book.jsp?bid=<%=b.getCourse_id()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<!--  end old -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>