<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <%--<meta charset="utf-8">--%>
    <title>Login</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<body>

<c:url var="img1" value="/resources/img/imag2.jpg" />
<c:url var="img2" value="/resources/img/imag3.jpg" />
<c:url var="img3" value="/resources/img/imag4.jpg" />

<jsp:include page="template/header.jsp"></jsp:include>

<div class="carousel slide" data-ride="carousel" id="slides">
    <ul class="carousel-indicators">
        <li data-target="#slides" data-slide-to="0" class="active"></li>
        <li data-target="#slides" data-slide-to="1"></li>
        <li data-target="#slides" data-slide-to="2" ></li>
    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${img1}">
            <div class="carousel-caption">
                <h1 class="display-3">
                    <spring:message code="h1.text"/>
                </h1>
                <h5><spring:message code="h5.text"/></h5>
                <a href="/search" class="btn btn-outline-light btn-lg"><spring:message code="button.search"/></a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${img2}">
        </div>
        <div class="carousel-item">
            <img src="${img3}">
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col mb-4 mt-5">
            <h1 class="display-4"><spring:message code="header"/></h1>
        </div>
        <hr>
        <div class="col-12">
            <p class="lead"><spring:message code="p.text"/></p>
        </div>
    </div>
</div>

<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-xs-12 col-sm-6 col-md-4">
            <i class="far fa-handshake"></i>
            <h4><spring:message code="h4.text1"/></h4>
            <p><spring:message code="p.text2"/></p>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4">
            <i class="	far fa-thumbs-up"></i>
            <h4><spring:message code="h4.text2"/></h4>
            <p><spring:message code="p.text3"/></p>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4">
            <i class="far fa-credit-card"></i>
            <h4><spring:message code="h4.text3"/></h4>
            <p><spring:message code="p.text4"/></p>
        </div>
    </div>
    <hr class="my-4">
</div>


<jsp:include page="template/footer.jsp"></jsp:include>


<!-- Optioanal JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

</body>
</html>