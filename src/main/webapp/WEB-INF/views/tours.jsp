<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <title>Tours</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


</head>
<body>
<c:url var="deleteImgUrl" value="/resources/img/delete.png" />
<c:url var="addUrl" value="/resort/add" />
<c:url var="editImgUrl" value="/resources/img/edit.png" />
<h5 style="text-align: center;">Resort</h5>
<c:forEach items="${resorts}" var="resort">
    <c:url var="editUrl" value="/resort/edit?idResort=${resort.id}" />
    <c:url var="deleteUrl" value="/resort/delete?idResort=${resort.id}" />
    <ul style="text-align: center">
        <li> Id resort = <c:out value="${resort.id}" />
            Name =  <c:out value="${resort.name}" />
            <a href="${editUrl}"><img src="${editImgUrl}"></img></a>
            <a href="${deleteUrl}"><img src="${deleteImgUrl}"></img></a>
        </li>
    </ul>

    <c:url var="addTour" value="/tour/add?idResort=${resort.id}" />
    <h5 style="text-align: center;">Add tour <a href="${addTour}">+</a></h5>
    <c:if test="${!empty resort.tours}">
    <c:forEach items="${resort.tours}" var="tour">
        <c:if test="${tour.active == true}">

        <%--<c:url var="addTour" value="/tour/add?idResort=${resort.id}" />--%>
        <c:url var="editTour" value="/tour/edit?idResort=${resort.id}&tourId=${tour.id}" />
        <c:url var="deleteTour" value="/tour/delete?idResort=${resort.id}&tourId=${tour.id}" />
        <ul style="text-align: center">
            <li> Id tour = <c:out value="${tour.id}" />
               Name =  <c:out value="${tour.name}" />
              Full price =  <c:out value="${tour.full_price}" />
                Date begin=  <fmt:formatDate value="${tour.date_begin}" pattern="dd.MM.yyyy"  />
                Date end = <fmt:formatDate value="${tour.date_end}" pattern="dd.MM.yyyy"  />
                Photo= <img src="/img/${tour.filename}">
                    <a href="${editTour}"><img src="${editImgUrl}"></img></a>
                    <a href="${deleteTour}"><img src="${deleteImgUrl}"></img></a>

            </li>
        </ul>

       <c:url var="addTransport" value="/transport/add?idtour=${tour.id}" />
        <h5 style="text-align: center;">Add transport <a href="${addTransport}">+</a></h5>
        <table style="border: 1px solid; width: 100%; text-align:center">

        <tr>
        <th>Id transport</th>
        <th>Transport name</th>
        <th>Transport description</th>
            <th>Photo</th>
        <th colspan="1"></th>
        </tr>


            <c:if test="${!empty tour.transports}">

                <c:forEach items="${tour.transports}" var="transport">
                    <c:if test="${transport.active == true}">
           <tr>
                <td><c:out value="${transport.id}" /></td>
                <td><c:out value="${transport.description}" /></td>
                <td><c:out value="${transport.name}" /></td>
               <td><img src="/img/${transport.filename}"></td>
                <%--<c:url var="addTransport" value="/transport/add?idtour=${tour.id}" />--%>
               <%--<td><a href="${addTransport}">+</a></td>--%>
                   <c:url var="editTransport" value="/transport/edit?tourId=${tour.id}&transportId=${transport.id}" />
                   <c:url var="deleteTransport" value="/transport/delete?tourId=${tour.id}&transportId=${transport.id}" />
                   <td><a href="${editTransport}"><img src="${editImgUrl}"></img></a></td>
                   <td><a href="${deleteTransport}"><img src="${deleteImgUrl}"></img></a></td>
           </tr>
                    </c:if>
                </c:forEach>

            </c:if>

        <c:if test="${empty tour.transports}">
             <tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                 <td>-</td>
                 <c:url var="addTransport" value="/transport/add?idtour=${tour.id}" />
                 <td><a href="${addTransport}">+</a></td>
                <td></td>
                <td></td>
                </tr>

    </c:if>
        </table>

        <%--hotels--%>
        <c:url var="addHotel" value="/hotel/add?idtour=${tour.id}" />
<h5 style="text-align: center;" > Add hotel <a href="${addHotel}">+</a></h5>
        <table style="border: 2px; width: 100%; text-align:center">

        <tr>
        <th>Id hotel</th>
        <th>Hotel name</th>
        <th>Hotel address</th>
        <th>Hotel stars</th>
        <th>Photo</th>
        <th colspan="2"></th>
        </tr>


        <c:if test="${!empty tour.hotels}">
        <c:forEach items="${tour.hotels}" var="hotel">
            <c:if test="${hotel.active == true}">
        <tr>
        <td><c:out value="${hotel.id}" /></td>
        <td><c:out value="${hotel.name}" /></td>
        <td><c:out value="${hotel.address}" /></td>
        <td><c:out value="${hotel.stars}" /></td>
        <td><img src="/img/${hotel.filename}"></td>
        <%--<c:url var="addHotel" value="/hotel/add?idtour=${tour.id}" />--%>
        <%--<td><a href="${addHotel}">+</a></td>--%>
        <c:url var="editHotel" value="/hotel/edit?tourId=${tour.id}&hotelId=${hotel.id}" />
        <c:url var="deleteHotel" value="/hotel/delete?tourId=${tour.id}&hotelId=${hotel.id}" />
        <td><a href="${editHotel}"><img src="${editImgUrl}"></img></a></td>
        <td><a href="${deleteHotel}"><img src="${deleteImgUrl}"></img></a></td>
        </tr>
            </c:if>
        </c:forEach>
        </c:if>

        <c:if test="${empty tour.hotels}">
           <tr>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <c:url var="addHotel" value="/hotel/add?idtour=${tour.id}" />
        <td><a href="${addHotel}">+</a></td>
        <td></td>
        <td></td>
        </tr>
        </c:if>

        </table>


        </c:if>
    </c:forEach>
</c:if>


<c:if test="${empty resort.tours}">
  <h6 style="text-align: center;">  No tours found.</h6>
    <%--<c:url var="addTour" value="/tour/add?idResort=${resort.id}" />--%>
    <%--<p><a href="${addTour}">Add new tour</a></p>--%>
</c:if>


</c:forEach>


<p><a href="${addUrl}">Add new resort</a></p>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>