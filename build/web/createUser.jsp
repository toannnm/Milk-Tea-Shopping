<%-- 
    Document   : createUser
    Created on : 16/06/2022, 9:11:11 AM
    Author     : toanm
--%>

<%@page import="sample.product.ProductError"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="icon" type="image/x-icon" href="assets/admin.ico" />
    </head>
    <body style="background-image:url(image/backc.jpg)">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            ProductError producterror = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (producterror == null) {
                producterror = new ProductError();
            }
        %>
              
        <section>
            <form action="MainController" method="POST">
                <div class="formmer">
                    <h1>Create Product</h1>
                    <hr>
                    <label for="productID"><b>ProductID</b></label>
                    <input type="text" name="productID"  placeholder="Product ID"/><%= producterror.getProductID()%>
                    <label for="name"><i class='bx bxs-pencil'></i><b>Name</b></label>
                    <input type="text" name="name"  placeholder="Product Name"/><%= producterror.getName()%>
                    <label for="name"><i class='bx bxs-pencil'></i><b>Price</b></label>
                    <input type="text" name="price"  placeholder="Product Price"/><%= producterror.getPrice()%>
                    <label for="email"><i class='bx bxs-pencil'></i><b>Quantity</b></label>
                    <input type="text" name="quantity"  placeholder="Product Quantity"/><%= producterror.getQuantity()%>
                    <label for="email"><i class='bx bxs-pencil'></i><b>Image</b></label>
                    <input type="text" name="image"  placeholder="Product Image"/><%= producterror.getImage()%>
                    <label for="name"><i class='bx bxs-pencil'></i><b>CategoryID</b></label>
                    <input type="text" name="categoryID"  placeholder="Product CategoryID"/><%= producterror.getCategoryID()%>
                    <div class="form-group form-button">
                        <hr>
                        <input type="submit" name="action"  class="registerbtn" value="Create"/><%= producterror.getError()%>
                    </div>
            </form>
        </section>



        <style>
            * {box-sizing: border-box}

            /* Add padding to containers */
            .formmer {
                padding: 16px;
            }

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Overwrite default styles of hr */
            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            /* Set a style for the submit/register button */
            .registerbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            .registerbtn:hover {
                opacity:1;
            }

            /* Add a blue text color to links */
            a {
                color: dodgerblue;
            }

            /* Set a grey background color and center the text of the "sign in" section */
            .signin {
                background-color: #f1f1f1;
                text-align: center;
            }
        </style>


</html>

