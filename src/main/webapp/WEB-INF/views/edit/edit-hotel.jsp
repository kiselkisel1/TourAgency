<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Edit hotel</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <jsp:include page="/WEB-INF/views/template/language.jsp"></jsp:include>

<c:url var="saveUrl" value="/hotel/edit?id=${hotelAttribute.id}" />
<form:form modelAttribute="hotelAttribute" method="POST" action="${saveUrl}" enctype="multipart/form-data">
    <div class="container mt-3 mb-4 text-center" > <h2><spring:message code="hotel"/></h2> </div>

    <div class="form-group row">
        <form:label path="id" class="col-sm-2 col-form-label"><spring:message code="id"/></form:label>
        <div class="col-sm-7">
            <form:input class="form-control" path="id" disabled="true"/>
        </div>
    </div>


    <div class="form-group row">
        <form:label path="name" class="col-sm-2 col-form-label"><spring:message code="name"/></form:label>
        <div class="col-sm-7">
            <form:input class="form-control" path="name"/>
            <form:errors path="name"/>
        </div>
    </div>

    <div class="form-group row">
        <form:label path="name" class="col-sm-2 col-form-label"><spring:message code="address"/> </form:label>
        <div class="col-sm-7">
            <form:input class="form-control" path="address"/>
            <form:errors path="address"/>
        </div>
    </div>
    <div class="form-group row">
        <form:label path="name" class="col-sm-2 col-form-label"><spring:message code="stars.add"/></form:label>
        <div class="col-sm-7">
            <form:input class="form-control" path="stars"/>
            <form:errors path="stars"/>
        </div>
    </div>

    <div class="form-group row">
        <input  type="file" name="file">
    </div>


    <button class="btn btn-primary btn-lg" type="submit"><spring:message code="save"/></button>
</form:form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
