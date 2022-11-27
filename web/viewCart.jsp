<%-- 
    Document   : viewCart
    Created on : 21/06/2022, 10:57:42 AM
    Author     : toanm
--%>


<%@page import="sample.product.Cart"%>
<%@page import="sample.product.OrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your cart</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/milkktea.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body style="background-image:url(image/backg.jpg)">
        <jsp:include page="./layout/shoppingheader.jsp"/>
        <div  style="background-image:url(image/backg.jpg)" class="formmer">
            <div class="row" >
                <div class="col-md-12" >
                    <ol class="breadcrumb " style="background-image:url(image/backg.jpg)" >
                        <li class="breadcrumb-item"><a href="home.jsp" style="text-decoration: none; color: lightgray;">Home Page</a></li>
                        <li class="breadcrumb-item active">Your cart</li>
                    </ol>
                </div>
            </div>
            <%
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {


            %>
            <table border="1" class="table table-bordered overflow-x:auto;">
                <thead>
                    <tr style="text-align: center">
                        <th>No</th>
                        <th >ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Remove</th>
                        <th>Edit</th>

                    </tr>
                </thead>
                <tbody>
                    <%                    int count = 1;
                        double total = 0;
                        for (OrderDetail orderdetail : cart.getCart().values()) {
                            total += orderdetail.getPrice() * orderdetail.getQuantity();
                    %>
                <form action="MainController">
                    <tr>
                        <td><%= count++%></td>
                        <td><input style="width: 50px;display: block;text-align: center;justify-content: center;background-image:url(image/backg.jpg)"type="text" name="productID" value="<%=orderdetail.getProductID()%>" readonly=""</td>
                        <td>
                            <input style ="uppercase; justify-content: space-between;width: 235px;background-image:url(image/backg.jpg)"type="text" name="name" readonly="" value="<%=orderdetail.getName()%>" required=""/>
                        </td>
                        <td><img src="<%=orderdetail.getImage()%>" height="200px" width="200px"></td>
                        <td><input style="text-align: center;width: 50px;display: block;background-image:url(image/backg.jpg)" min="1" type="number" name="quantity" value="<%=orderdetail.getQuantity()%>"/></td>
                        <td><%=orderdetail.getPrice()%></td>
                        <td><%=orderdetail.getPrice() * orderdetail.getQuantity()%></td>
                        <td><input class="btn btn-primary btn-sm" type="submit" name="action" value="Remove"/></td>
                        <td><input class="btn btn-primary btn-sm" type="submit" name="action" value="Edit"/></td>
                    </tr>
                </form>
                <%  }

                %>
                </tbody>
            </table>
            <%        }
            %>
            <a class="btn btn-primary" href="CheckoutControl" >Checkout</a>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>  
        <jsp:include page="./layout/footer.jsp"/>

    </body>

</html>
