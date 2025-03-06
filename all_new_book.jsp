<%@page import="com.entity.User"%>
<%@page import="com.DAO.courseDAOImpl"%>
<%@page import="com.entity.course_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

		<c:remove var="addcart" scope="session" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			courseDAOImpl dao = new courseDAOImpl(DBConnect.getConn());
			List<course_dtls> list = dao.getAllNewBook();
			for (course_dtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="courses/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
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
							<a href="cart?bid=<%=b.getCourse_id()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i> Cart
							</a>

							<%
							}
							%>
							<a href="view_book.jsp?bid=<%=b.getCourse_id()%>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

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