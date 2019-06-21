<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8">

    <title>Account</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<c:url var="deleteImgUrl" value="/resources/img/delete.png" />
<c:url var="payImgUrl" value="/resources/img/pay.png" />
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Sun travel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/"><spring:message code="home"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/search"><spring:message code="tours"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/account?username=${pageContext.request.userPrincipal.name}"><spring:message code="account"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/resort/list"><spring:message code="admin"/></a>
            </li>

        </ul>

        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name == null}">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/login"><spring:message code="logIn"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/registration"><spring:message code="createAccount"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}?lang=en">en</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}?lang=ru">ru</a>
                    </li>

                </ul>

            </c:when>
            <c:otherwise>
                <form id="logoutForm" method="POST" action="/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <div class="navbar-text"><a href="/account?username=${pageContext.request.userPrincipal.name}&lang=en">en</a> <a href="/account?username=${pageContext.request.userPrincipal.name}&lang=ru">ru</a> ${pageContext.request.userPrincipal.name}| <a onclick="document.forms['logoutForm'].submit()"><spring:message code="logOut"/></a></div>
            </c:otherwise>
        </c:choose>
    </div>

</nav>
<c:if test="${pageContext.request.userPrincipal.name != null}">

    <div class="container">
        <div class="row">
            <div class="col mb-4 mt-4">
                <h2><spring:message code="account"/> ${pageContext.request.userPrincipal.name}</h2>
            </div>
            <hr>
        </div>
    </div>
</c:if>


<c:forEach items="${booking.tours}" var="tour">
     <c:url var="deleteTour" value="/account/delete?tourId=${tour.id}&bookingId=${booking.id}&username=${pageContext.request.userPrincipal.name}" />
    <c:url var="pay" value="/account/pay"/>

<table class="table">
    <thead class="thead-light">
    <tr>
        <th scope="col"><c:out value="${tour.resort.name}" /></th>
        <th scope="col"><c:out value="${tour.name}" /></th>
        <th scope="col"><c:out value="${tour.full_price}" /></th>
        <th scope="col"><fmt:formatDate value="${tour.date_begin}" pattern="dd.MM.yyyy"  /></th>
        <th scope="col"><fmt:formatDate value="${tour.date_end}" pattern="dd.MM.yyyy"  /></th>
        <th scope="col"><a href="${deleteTour}"><img src="${deleteImgUrl}"></img></a></th>

    </tr>
    </thead>
    <tbody>
    <tr>
    <c:forEach items="${tour.transports}" var="transport">
        <c:if test="${transport.booked == true}">
            <th scope="row"><spring:message code="transport"/></th>
            <td> <c:out value="${transport.id}" /></td>
            <td> <c:out value="${transport.description}" /></td>
            <td> <c:out value="${transport.name}" /></td>
            <td> </td>
            <td> </td>
    </c:if>
    </c:forEach>
    </tr>

    <tr>
    <c:forEach items="${tour.hotels}" var="hotel">
        <c:if test="${hotel.booked == true}">
        <th scope="row"><spring:message code="hotel"/></th>
        <td><c:out value="${hotel.id}" /></td>
        <td><c:out value="${hotel.name}" /></td>
        <td><c:out value="${hotel.address}" /></td>
            <td> </td>
            <td> </td>
        </c:if>
    </c:forEach>
    </tr>
    </tbody>
</table>

</c:forEach>

    </div>
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