<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <jsp:include page="/WEB-INF/views/template/language.jsp"></jsp:include>

            <form:form modelAttribute="tourAttribute" method="POST" action="${saveUrl}"  enctype="multipart/form-data">
                <%--<c:url var="saveUrl" value="/add" />--%>
                <div class="container mt-3 mb-4 text-center" > <h2><spring:message code="tour"/></h2> </div>
                <c:url var="saveUrl" value="/tour/add?idResort=${idResort}" />

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"><spring:message code="id.resort"/></label>
                    <div class="col-sm-7">
                        <input type="text" value="${idResort}" class="form-control" disabled="true"/>
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
                    <form:label path="full_price" class="col-sm-2 col-form-label"><spring:message code="price"/></form:label>
                    <div class="col-sm-7">
                        <form:input class="form-control" path="full_price"/>
                        <form:errors path="full_price"/>
                    </div>
                </div>

                <div class="form-group row">
                    <form:label path="date_begin" class="col-sm-2 col-form-label"><spring:message code="date.begin"/></form:label>
                    <div class="col-sm-7">
                     <form:input class="form-control"  path="date_begin" type="date" min="12.05.2019" />
                    <form:errors path="date_begin"/>
                    </div>
                </div>

                <div class="form-group row">
                    <form:label path="date_end" class="col-sm-2 col-form-label"><spring:message code="date.end"/></form:label>
                    <div class="col-sm-7">
                        <%--<form:input path="date_end" type="date" class="min"  />--%>
                    <form:input class="form-control" path="date_end" type="date"  min="12.05.2019" />
                    <form:errors path="date_end"/>
                    </div>
                </div>

                <div class="form-group row">
                    <input  type="file" name="file">
                </div>

                <button class="btn btn-primary btn-lg" type="submit"><spring:message code="save"/></button>
    </form:form>
    <script type="text/javascript">
        window.onload= function(){
            // document.querySelector('input[type="date"]').value=(new Date()).toISOString().substr(0,10);
            var dateControl = document.querySelector('input[type="date"]');
            dateControl.min =(new Date()).toISOString().substr(0,10);
        }
    </script>
        </div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
