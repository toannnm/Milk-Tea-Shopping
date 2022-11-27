<%-- 
    Document   : shoppingheader
    Created on : 06/07/2022, 12:13:08 PM
    Author     : toanm
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style1.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<nav class="navbar navbar-expand-lg navbar-light " style="margin:0;padding:0;background-color: #D1E0EE" >
    <div class="formmer px-4 px-lg-5 ">
        <a style="float:left" class="navbar-brand" href="home.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <c:if test="${sessionScope.LOGIN_USER==null}">
                    <li class="nav-item"><a class="nav-link active " aria-current="page" href="login.jsp">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER!=null}">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Welcome ${sessionScope.LOGIN_USER.getName()}</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="MainController?action=Logout">Logout</a></li>
                    </c:if>
                <form action="MainController">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" ><input type="submit" style="border: none; background-color: #D1E0EE!important;"  name="action" value="Menu"/></a></li>
                </form>
                <c:if test="${sessionScope.LOGIN_USER.getRoleID()=='AD'}">
                    <li class="nav-item"><a class="nav-link active" href="MainController?search=&action=Search">ProductManagement</a></li>
                    </c:if>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                    <div class="col-10 agileits_search ">
                        <form class="form-inline" action="MainController" class="form-inline my-2 my-lg-0">
                            <div style="display: flex; margin-left: 5%;">
                                <input class=" mr-sm-2" name="name" type="search" style="display: inline; padding: 7px; padding-right: 200px;  " placeholder="Nhập sản phẩm cần tìm ..."  required>
                                <button style="display: inline; margin-left: 10px;"  class="btn btn-outline-primary" type="submit" name="action" value="SearchProduct">
                                    Search
                                </button>
                            </div>
                        </form>

                    </div>
                </ul>
            </ul>
            <style>
                li:hover{
                      background-color: #abdde5;
                }
            </style>


            <form  class="d-flex" action="MainController" >
                <button class="btn btn-outline-dark" type="submit" value="View" name="action" style="display: inline; margin-right:  6%;    margin: 15px 15px 15px;
                        float: right;">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>


