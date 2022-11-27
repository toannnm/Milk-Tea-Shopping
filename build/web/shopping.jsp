<%-- 
    Document   : shopping
    Created on : 04/07/2022, 12:56:59 PM
    Author     : toanm
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.Product"%>
<%@page import="sample.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Milktea Shop</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/milkktea.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>

    <body>

        <jsp:include page="./layout/shoppingheader.jsp"/>        
        <header class="bg-dark py-5  " style="background-image: url(image/milkteaa.jpg); width:100%">
            <div class="formmer px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Milktea Shop</h1>
                </div>
            </div>
        </header>
        <!-- Section-->
        <%
            List<Product> listP = (List<Product>) request.getAttribute("LIST_PRODUCT");
            if (listP != null && listP.size() > 0) {
        %>
        <section style="background-image:url(image/BACk.png) " class="py-5">
            <div class="formmer px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%                        for (Product product : listP) {
                    %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" height="350" width="300" src="<%= product.getImage()%>" alt="..."  />
                            <!-- Product details-->
                            <div class="card-body p-4" style="padding-bottom: 15px !important; ">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=product.getCategoryID()%> - <%=product.getProductID()%> - <%=product.getName()%></h5>
                                    <!-- Product price-->
                                    <%= product.getPrice()%> $
                                </div>
                            </div>

                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <form action="MainController" method="POST" style="display: flex;flex-direction: column; align-items: center;">
                                    <input type="hidden" name="categoryID" value="<%=product.getCategoryID()%>"/>
                                    <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                                    <input type="hidden" name="name" value="<%=product.getName()%>"/>
                                    <input type="hidden" name="image" value="<%=product.getImage()%>"/>
                                    <input type="hidden" name="price" value="<%=product.getPrice()%>"/>
                                    <input type="number" name="quantity" min="1" max="<%=product.getQuantity()%>" value="1" min="1" class="form-control" style="width: 50px;display: block"/>
                                    <div class="text-center" style="margin-top: 5px;"><input class="btn btn-outline-dark mt-auto" type="submit" name="action" value="Add"/></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>

            </div>


        </section>

        <!-- Footer-->
        <jsp:include page="./layout/footer.jsp"/>

        <footer class="py-5 bg-dark">
            <div class="formmer"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        
        <script src="js/scripts.js"></script>    </body>
        <%
            }
        %>
</html>
