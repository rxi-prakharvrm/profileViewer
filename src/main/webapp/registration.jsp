<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
	

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 
								<input type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> 
								<input type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="profession"><i class="zmdi zmdi-graduation-cap"></i></label> 
								<input type="text" name="profession" id="profession" placeholder="Profession" />
							</div>
							<div class="form-group">
								<label for="location"><i class="zmdi zmdi-pin-drop"></i></label> 
								<input type="text" name="location" id="location" placeholder="Location" />
							</div>
							<div class="form-group">
								<label for="github"><i class="zmdi zmdi-github"></i></label> 
								<input type="text" name="github" id="github" placeholder="Github" />
							</div>
							<div class="form-group">
								<label for="linkedin"><i class="zmdi zmdi-linkedin"></i></label> 
								<input type="text" name="linkedin" id="linkedin" placeholder="Linkedin" />
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status === "success") {
			swal("Congrats", "Account created successfully!", "success");
		} else if(status === "error") {
			swal("Sorry", "You're a registered user!", "error");
		}
	</script>



</body>
</html>