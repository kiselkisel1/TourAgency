<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


    <title>Create an account</title>
</head>

<body>

<div class="container">
    <jsp:include page="/WEB-INF/views/template/language.jsp"></jsp:include>
    <form:form method="POST" modelAttribute="userForm">

        <div class="container mt-3 mb-4 text-center" > <h2><spring:message code="createAccount"/></h2> </div>

        <spring:bind path="username">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="username"><spring:message code="label.username"/></form:label>
                <div class="col-sm-7">
                    <form:input type="text" path="username" class="form-control" autofocus="true"></form:input>
                </div>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="password"><spring:message code="label.password"/></form:label>
                <div class="col-sm-7">
                    <form:input type="password" path="password" class="form-control"></form:input>
                </div>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="confirmPassword"><spring:message code="confirm.password"/>  </form:label>
                <div class="col-sm-7">
                    <form:input type="password" path="confirmPassword" class="form-control" ></form:input>
                </div>
                <form:errors path="confirmPassword"></form:errors>
            </div>
        </spring:bind>

        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="name"><spring:message code="name"/></form:label>
            <div class="col-sm-7">
                <form:input path="name" class="form-control"/>
            </div>
            <form:errors path="name"/>
        </div>
        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="surname"><spring:message code="surname"/> </form:label>
            <div class="col-sm-7">
                <form:input path="surname" class="form-control"/>
            </div>
            <form:errors path="surname"/>
        </div>

        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="age"><spring:message code="age"/> </form:label>
            <div class="col-sm-7">
                <form:input path="age" class="form-control"/>
            </div>
            <form:errors path="age"/>
        </div>

        <spring:bind path="email">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="password"><spring:message code="email"/></form:label>
                <div class="col-sm-7">
                    <form:input  path="email" class="form-control"></form:input>
                </div>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>

        <button type="submit" class="btn btn-primary btn-lg"><spring:message code="save"/></button>
    </form:form>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>