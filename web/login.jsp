<%-- 
    Document   : login
    Created on : 31/05/2022, 10:48:13 AM
    Author     : toanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/newCss.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="assets/admin.ico" />
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    </head>
    <jsp:include page="./layout/loginheader.jsp"/>

    <body style="background-image: url(image/backe.jpg)">
        <form action="MainController" method="POST" id="form"  >
            <div class="login-form">
                <div class="form-header">
                    <div class="user-logo">
                    </div>
                    <div class="title">Welcome</div>
                </div> 
                <div class="form-container">
                    <div >
                        <div class="form-element " >
                            <label class="fas fa-user " for="login-username"></label>
                            <input type="text" id="login-username"
                                   name="userID" placeholder="Username" required="required">
                        </div>
                        <div class="form-element">
                            <label class="fas fa-lock " for="login-password"></label>
                            <input type="password" id="login-password"
                                   name="password" placeholder="Password" required="required">
                        </div>
                    </div>

                    <p class="text-danger" style="color: red;float:left">${ERROR}</p>
                    <div class="row">
                        <div>
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8084/ManagementProject/LoginGoogleController&response_type=code
                       &client_id=936902202386-t8q121isjf70sfln6b4vrajhiuunomjg.apps.googleusercontent.com&approval_prompt=force" role="button" style="text-transform:none;border-color: #007bff;color: #007bff;">
                                <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                                Sign in Google
                            </a>
                        </div>
                    </div>
                    <div>
                        <div class="g-recaptcha" data-sitekey="6Ldik88gAAAAAIyunCyCAcbbM00F89g5Q0rs6cLz"></div>
                        <div id="error" style="color:red;">
                        </div>
                        <div  class="form-element" >
                            <input value="Login" name="action" hidden=""/>
                            <input class="btn"  type="submit" value="LOGIN"/>
                        </div>
                    </div>

                </div>
            </div>
        </form>

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>

        <!--<script>
            $(document).on('click','#aleee',function()
            {var response=grecaptcha.getResponse();
                if(response.length === 0){
                    alert("foul!");
                    return false;
                }
                return true;
                }};
               
        </script>-->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function(){
            let isValid = false;
            const form = document.getElementById("form");
            const error = document.getElementById("error")
                    form.addEventListener("submit", function (event){
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response){
                    form.submit();
                    } else {
                    error.innerHTML = "Please check recaptcha ";
                    }
                    });
            }
        </script>
        <script src="https://apis.google.com/js/api.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
    </head>
</body>
</html>
