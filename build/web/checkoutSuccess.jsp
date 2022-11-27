<%-- 
    Document   : home
    Created on : 06/07/2022, 4:05:26 PM
    Author     : toanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="assets/milkktea.ico" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
        <style>
            body, html {
                height: 100%;
                font-family: "Inconsolata", sans-serif;
            }

            .bgimg {
                background-position: center;
                background-size: cover;
                background-image: url(image/milkteaa.jpg);
                min-height: 75%;
            }

            .menu {
                display: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>

        <!-- Links (sit on top) -->


        <!-- Header with image -->
        <header class="bgimg w3-display-container " id="home">
            <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
                <span class="w3-tag">Open from 6am to 5pm</span>
            </div>
            <div class="w3-display-middle w3-center">
                <span class="w3-text-white" style="font-size:50px"><br>Checkout Successfully</span>
                <span  style="font-size:30px" ><br><a href="http://localhost:8084/ManagementProject/MainController?action=Menu" class="btn btn-primary">By more</a></span>
            </div>
            <div class="w3-display-bottomright w3-center w3-padding-large">
                <span class="w3-text-white">15 Adr street, 5015</span>
            </div>
        </header>

       

        <!-- Footer -->

        <jsp:include page="./layout/footer.jsp"/>

        <script>
            // Tabbed Menu
            function openMenu(evt, menuName) {
                var i, x, tablinks;
                x = document.getElementsByClassName("menu");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablink");
                for (i = 0; i < x.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
                }
                document.getElementById(menuName).style.display = "block";
                evt.currentTarget.firstElementChild.className += " w3-dark-grey";
            }
            document.getElementById("myLink").click();
        </script>

    </body>
</html>

