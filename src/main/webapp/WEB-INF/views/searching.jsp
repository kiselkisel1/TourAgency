<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Мария
  Date: 23.05.2019
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"> function validate_form(data) {
        if(data.name != null && data.name.value.length == 0)
        {
            alert("Field name is required ");
            return false;
        }
    }
    </script>
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

<%--<div class="container-fluid ">--%>
    <%--<div class="row alert text-center">--%>
        <%--<div class="col-12">--%>
            <%--<h1 class="display-4">Tours</h1>--%>
            <%--<h1 style="text-align: center">Tours</h1>--%>
        <%--</div>--%>
        <%--<hr>--%>
    <%--</div>--%>
<%--</div>--%>



<div class="container">
    <div class="row">
        <div class="col mb-5 mt-2">
            <h1 style="text-align: center" class="display-4">Tours</h1>
        </div>
        <hr>
    </div>
</div>

<form:form action="/search"  method="POST">


    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                <div class="form-inline">
                <%--<div class="row alert text-center">--%>
                    <div class="md-form my-0">
                        <input type="search" class="form-control mr-sm-4" name="name" placeholder="input resort" aria-label="Search">
                    </div>
                    <div class="md-form my-0">
                        <input type="date" class="form-control mr-sm-4" name="date" placeholder="input date" min="12.05.2019" aria-label="Search">
                    </div>
                    <div class="md-form my-0">
                        <input type="text" class="form-control mr-sm-4"  name="price" placeholder="input price" aria-label="Search">
                    </div>
                    <div class="md-form my-0">
                        <input type="submit"  onClick="return validate_form(this.form)" class="btn btn-secondary form-control mr-sm-4"  value="Search">
                    </div>
                </div>
                <%--</div>--%>
            </div>

        </nav>
    </div>

<div class="container padding">
    <div class="row padding mt-5">
        <c:if test="${exception == null}">
    <c:forEach items="${tours}" var="tour">
        <c:if test="${tour.active == true}">
            <c:url var="saveUrl" value="/next?idTour=${tour.id}" />

            <div class="col-md-4">
                <div class="card">
                    <%--<img src="${img1}" class="card-img-top">--%>
                        <img src="/img/${tour.filename}" class="card-img-top">
                    <div class="card-body">
                        <h4 class="card-title"><c:out value="${tour.name}" /></h4>
                        <p class="card-text">Tour :
                            Resort = <c:out value="${tour.resort.name}" />
                            Full price =  <c:out value="${tour.full_price}" />
                            <%--Date begin = <c:out value="${tour.date_begin}"/>--%>
                            <%--Date end = <c:out value="${tour.date_end}"/>--%>
                            Data begin =  <fmt:formatDate value="${tour.date_begin}" pattern="dd.MM.yyyy"  />
                            Date end = <fmt:formatDate value="${tour.date_end}" pattern="dd.MM.yyyy"  />
                        </p>
                        <a href="${saveUrl}" class="btn btn-info">Book</a>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
    </c:if>
        <c:if test="${exception != null}">
            <div> <c:out value="${exception}" /></div>
        </c:if>
    </div>
</div>
</form:form>
<script type="text/javascript">
    window.onload= function(){
        // document.querySelector('input[type="date"]').value=(new Date()).toISOString().substr(0,10);
        var dateControl = document.querySelector('input[type="date"]');
        dateControl.min =(new Date()).toISOString().substr(0,10);
    }
</script>
<jsp:include page="template/footer.jsp"></jsp:include>

<!-- Optioanal JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

</body>
</html>
