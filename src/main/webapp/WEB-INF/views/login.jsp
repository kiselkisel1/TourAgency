<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">>
    <title>Log in</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>


<div class="container">
    <jsp:include page="/WEB-INF/views/template/language.jsp"></jsp:include>

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <div class="container mt-3 mb-4 text-center" > <h2><spring:message code="label.title"/></h2> </div>

        <div class="form-group row ${error != null ? 'has-error' : ''}">
            <span>${error}</span>
            <label class="col-sm-2 col-form-label"> <spring:message code="label.username"/> </label>
            <div class="col-sm-7">
                <input name="username" type="text" class="form-control" autofocus="true"/>
            </div>
        </div>

        <div class="form-group row ${error != null ? 'has-error' : ''}">
            <label class="col-sm-2 col-form-label"> <spring:message code="label.password"/></label>
            <div class="col-sm-7">
                <input name="password" type="password" class="form-control" placeholder="Password"/>
                <span>${message}</span>
              </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
        <button class="btn btn-primary btn-lg" type="submit"><spring:message code="logIn"/></button>

        <div class="container mb-3" >
            <h4><a href="${contextPath}/registration"><spring:message code="createAccount"/></a></h4>
        </div>

    </form>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>