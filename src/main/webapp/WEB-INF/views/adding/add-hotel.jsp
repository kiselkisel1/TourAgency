<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <meta charset="utf-8">

    <title>Add hotel</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

<div class="container">
    <jsp:include page="/WEB-INF/views/template/language.jsp"></jsp:include>

    <form:form modelAttribute="hotelAttribute" method="POST" action="${saveUrl}" enctype="multipart/form-data">
     <div class="container mt-3 mb-4 text-center" > <h2><spring:message code="hotel"/></h2> </div>
    <c:url var="saveUrl" value="/hotel/add?idtour=${tourId}" />

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"><spring:message code="id.tour"/></label>
            <div class="col-sm-7">
            <input type="text" value="${tourId}" class="form-control" disabled="true"/>
            </div>
        </div>

        <div class="form-group row">
            <form:label path="name" class="col-sm-2 col-form-label"><spring:message code="name"/> </form:label>
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
    <%--<input type="submit" value="Save" />--%>
</form:form>
</div>

</body>
</html>
