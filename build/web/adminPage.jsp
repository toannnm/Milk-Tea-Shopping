<%-- 
    Document   : adminPage
    Created on : 31/05/2022, 11:30:52 AM
    Author     : toanm
--%>

<%@page import="sample.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/admin.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body style="background-image:url(image/backb.jpg)">
        <jsp:include page="./layout/adminpageheader.jsp"/>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <!--        <div class="container" style="float:left">
                    welcome:
                    <h1><%=loginUser.getName()%></h1>-->
        <!--            <a href="MainController?action=Logout">Logout</a>
                    <form action="MainController">
                        Search<input type="search" name="search" value="<%=search%>" />
                        <input type="submit" name="action" value="Search"/>
                    </form>-->
        <%
            List<Product> ListProduct = (List<Product>) request.getAttribute("LIST_PRODUCT");
            if (ListProduct != null && ListProduct.size() > 0) {
        %>
        <h4 class="mb-sm-4 mb-3">Đang có 
            <span>${TOTAL} sản phẩm trên hệ thống</span>
        </h4>
        <table class="table table-bordered overflow-x:auto;" >
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th style="text-align: center">Name</th>
                    <th style="text-align: center">Price</th>
                    <th>Quantity</th>
                    <th style="text-align: center">Image</th>
                    <th>CategoryID</th>
                    <th>Delete</th>
                    <th>Update</th>
                    <th>Create</th>

                </tr>
            </thead>


            <tbody>
                <%
                    int count = 1;
                    for (Product product : ListProduct) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><input style="width: 50px;display: block;text-align: center;justify-content: center;background-image:url(image/backb.jpg);color: #fff;border-radius:0.2rem;transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;cursor: pointer;" type="text" name="productID" value="<%= product.getProductID()%>" readonly="" required=""/>

                    </td>
                    <td>
                        <input style=" uppercase; justify-content: space-between;width: 235px;display: block;background-image:url(image/backb.jpg);color: #fff;border-radius:0.2rem;transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;cursor: pointer;" type="text" name="name" value="<%=product.getName()%>"  readonly="" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center;width: 105px;display: block;background-image:url(image/backb.jpg);color: #fff;border-radius:0.2rem;transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;cursor: pointer;" type="number" min="1"  name="price" value="<%=product.getPrice()%>" required=""/>
                    </td>                   
                    <td>
                        <input style="text-align: center;width: 50px;display: block;background-image:url(image/backb.jpg);color: #fff;border-radius:0.2rem;transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;cursor: pointer;" type="number" min="1" name="quantity" value="<%=product.getQuantity()%>" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center;background-image:url(image/backb.jpg);color: #fff;border-radius:0.2rem;transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;cursor: pointer;" type="text" name="image" value="<%=product.getImage()%>" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center;width: 50px;display: block;background-image:url(image/backb.jpg);color: #fff;border-radius:0.2rem;transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;cursor: pointer;" type="text" name="categoryID" value="<%=product.getCategoryID()%>" readonly="" required=""/>
                    </td>
                    <!--delete function-->
                    <td>
                        <a class="btn btn-primary btn-sm" href="MainController?action=Delete&productID=<%=product.getProductID()%>&search=<%=search%>">Delete</a>
                    </td>
                    <!--update function-->
                    <td>
                        <input type="submit" name="action" value="Update" class="btn btn-primary btn-sm"/>
                        <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/>
                    </td>
                    <td>
                        <a class="btn btn-primary btn-sm" href="createProduct.jsp">Create</a>
                    </td>
                </tr>
            </form>
            <%
                }
            %>

        </tbody>
    </table>

    <%
        }
    %>
</div>

<%
    String error = (String) request.getAttribute("ERROR");
    if (error == null) {
        error = "";
    }
%>
<%=error%>       
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>  
<jsp:include page="./layout/footer.jsp"/>

</body>
</html>
