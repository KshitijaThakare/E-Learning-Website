<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ECourse: Register</title>
<%@include file="all_component/allCss.jsp"%>
<script type="text/javascript">
    function validateForm() {
    
        var email = document.getElementById("email").value;
        var phone_no = document.getElementById("phone_no").value;
        var password = document.getElementById("password").value;
        var check = document.getElementById("check").checked;
        var errorMessage = "";

        
        // Validate Email
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (email === "") {
            errorMessage += "Email is required.\n";
        } else if (!emailPattern.test(email)) {
            errorMessage += "Please enter a valid email address.\n";
        }

        // Validate Phone Number
        if (phone_no === "") {
            errorMessage += "Phone Number is required.\n";
        } else if (phone_no.length < 10) {
            errorMessage += "Phone number must be at least 10 digits.\n";
        }

        // Validate Password
        if (password === "") {
            errorMessage += "Password is required.\n";
        } else if (password.length < 8) {
            errorMessage += "Password must be at least 8 characters long.\n";
        }

        // Validate Terms and Conditions checkbox
        if (!check) {
            errorMessage += "You must agree to the Terms and Conditions.\n";
        }

        // If any validation error occurs, show alert and prevent form submission
        if (errorMessage !== "") {
            alert(errorMessage);
            return false;  // Prevent form submission
        }

        return true;  // Allow form submission
    }
</script>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>

							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
						<form action="register" method="post" onsubmit="return validateForm()">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter FullName</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="phone_no">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
