<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Мария
  Date: 16.05.2019
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<c:url var="deleteImgUrl" value="/resources/img/delete.png" />
<c:url var="payImgUrl" value="/resources/img/pay.png" />
<jsp:include page="template/header.jsp"></jsp:include>

<c:if test="${pageContext.request.userPrincipal.name != null}">

    <div class="container">
        <div class="row">
            <div class="col mb-4 mt-4">
                <h2>Account ${pageContext.request.userPrincipal.name}</h2>
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
        <th scope="col">Resort = <c:out value="${tour.resort.name}" /></th>
        <th scope="col">Tour = <c:out value="${tour.name}" /></th>
        <th scope="col">Price = <c:out value="${tour.full_price}" /></th>
        <th scope="col">Data begin =  <fmt:formatDate value="${tour.date_begin}" pattern="dd.MM.yyyy"  /></th>
        <th scope="col">Date end = <fmt:formatDate value="${tour.date_end}" pattern="dd.MM.yyyy"  /></th>
        <th scope="col"> <a href="${deleteTour}"><img src="${deleteImgUrl}"></img></a></th>
        <%--<th scope="col"> <a href="${pay}"><img src="${payImgUrl}"></img></a></th>--%>
        <%--<th scope="col"> <a href="#"><img src="${payImgUrl}"></img></a></th>--%>


    </tr>
    </thead>
    <tbody>
    <tr>
    <c:forEach items="${tour.transports}" var="transport">
        <c:if test="${transport.booked == true}">
            <th scope="row">Transport</th>
            <td> <c:out value="${transport.id}" /></td>
            <td> <c:out value="${transport.description}" /></td>
            <td>  <c:out value="${transport.name}" /></td>
            <td> </td>
            <td> </td>
        <%--<c:out value="${transport.id}" />--%>
        <%--<c:out value="${transport.description}" />--%>
        <%--<c:out value="${transport.name}" />--%>

    </c:if>
    </c:forEach>
    </tr>

    <tr>
    <c:forEach items="${tour.hotels}" var="hotel">
        <c:if test="${hotel.booked == true}">
        <th scope="row">Hotel</th>
        <td> <c:out value="${hotel.id}" /></td>
        <td>  <c:out value="${hotel.name}" /></td>
        <td>   <c:out value="${hotel.address}" /></td>
            <td> </td>
            <td> </td>
            <%--<c:out value="${hotel.id}" />--%>
            <%--<c:out value="${hotel.name}" />--%>
            <%--<c:out value="${hotel.address}" />--%>

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