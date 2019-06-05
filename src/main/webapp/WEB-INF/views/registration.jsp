<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <form:form method="POST" modelAttribute="userForm">

        <div class="container mt-3 mb-4 text-center" > <h2>Create your account</h2> </div>

        <spring:bind path="username">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="username">Username :</form:label>
                <div class="col-sm-7">
                    <form:input type="text" path="username" class="form-control" autofocus="true"></form:input>
                </div>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="password">Password :</form:label>
                <div class="col-sm-7">
                    <form:input type="password" path="password" class="form-control"></form:input>
                </div>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="form-group row ${status.error ? 'has-error' : ''}">
                <form:label class="col-sm-2 col-form-label" path="confirmPassword">Confirm password: </form:label>
                <div class="col-sm-7">
                    <form:input type="password" path="confirmPassword" class="form-control" ></form:input>
                </div>
                <form:errors path="confirmPassword"></form:errors>
            </div>
        </spring:bind>

        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="name">Name : </form:label>
            <div class="col-sm-7">
                <form:input path="name" class="form-control"/>
            </div>
            <form:errors path="name"/>
        </div>
        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="surname">Surname : </form:label>
            <div class="col-sm-7">
                <form:input path="surname" class="form-control"/>
            </div>
            <form:errors path="surname"/>
        </div>

        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="age">Age : </form:label>
            <div class="col-sm-7">
                <form:input path="age" class="form-control"/>
            </div>
            <form:errors path="age"/>
        </div>

        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label" path="email">Email:</form:label>
            <div class="col-sm-7">
                <form:input path="email" class="form-control"/>
            </div>
            <form:errors path="email"/>
        </div>


        <button type="submit" class="btn btn-primary btn-lg">Submit</button>
    </form:form>

</div>
<%--<form:form method="POST" modelAttribute="userForm">--%>

<%--<h2>Create your account</h2>--%>
<%--<spring:bind path="username">--%>
<%--<div class="form-group row ${status.error ? 'has-error' : ''}">--%>
<%--<form:label class="col-sm-2 col-form-label" path="username">Username :</form:label>--%>
<%--<div class="col-sm-10">--%>
<%--<form:input type="text" path="username" class="form-control" autofocus="true"></form:input>--%>
<%--</div>--%>
<%--<form:errors path="username"></form:errors>--%>
<%--</div>--%>
<%--</spring:bind>--%>

<%--<spring:bind path="password">--%>
<%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
<%--<form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>--%>
<%--<form:errors path="password"></form:errors>--%>
<%--</div>--%>
<%--</spring:bind>--%>

<%--<spring:bind path="confirmPassword">--%>
<%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
<%--<form:input type="password" path="confirmPassword" class="form-control"--%>
<%--placeholder="Confirm your password"></form:input>--%>
<%--<form:errors path="confirmPassword"></form:errors>--%>
<%--</div>--%>
<%--</spring:bind>--%>

<%--<table>--%>

<%--<tr>--%>
<%--<td><form:label path="name">Name:</form:label></td>--%>
<%--<td>--%>
<%--<form:input path="name"/>--%>
<%--<form:errors path="name"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td><form:label path="surname">Surname:</form:label></td>--%>
<%--<td>--%>
<%--<form:input path="surname"/>--%>
<%--<form:errors path="surname"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td><form:label path="age">age:</form:label></td>--%>
<%--<td>--%>
<%--<form:input path="age"/>--%>
<%--<form:errors path="age"/>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td><form:label path="email">email:</form:label></td>--%>
<%--<td>--%>
<%--<form:input path="email"/>--%>
<%--<form:errors path="email"/>--%>
<%--</td>--%>
<%--</tr>--%>

<%--</table>--%>


<%--<button type="submit">Submit</button>--%>
<%--</form:form>--%>

<%--</div>--%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>