<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
     <title>Admin</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <script type="text/javascript" src="/resources/js/openBlock.js">
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
 <c:url var="deleteImgUrl" value="/resources/img/delete.png" />
<c:url var="addUrl" value="/resort/add" />
<c:url var="editImgUrl" value="/resources/img/edit.png" />

<jsp:include page="template/header.jsp"></jsp:include>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <h2><spring:message code="admin"/>  ${pageContext.request.userPrincipal.name}</h2>
</c:if>


<a id="toggler" href="#"><spring:message code="statistics"/></a>
<div id="box" style="display: none;">
    <ul>
        <c:forEach items="${allTours}" var="tour">
            <li>
                 <spring:message code="resort.placeholder"/>: <c:out value="${tour.resort.name}" />,
                 <c:out value="${tour.name}" />
                <spring:message code="price"/> <c:out value="${tour.full_price}" />
                <fmt:formatDate value="${tour.date_begin}" pattern="dd.MM.yyyy"  /> -
                <fmt:formatDate value="${tour.date_end}" pattern="dd.MM.yyyy"  />
            </li>
        </c:forEach>
    </ul>
</div>
<c:if test="${!empty resorts}">
    <c:forEach items="${resorts}" var="resort">
        <c:url var="editUrl" value="/resort/edit?idResort=${resort.id}" />
        <c:url var="deleteUrl" value="/resort/delete?idResort=${resort.id}" />
        <c:url var="addTour" value="/tour/add?idResort=${resort.id}" />
        <table class="table mb-4">
            <thead class="table-primary">
            <tr>
                <th scope="col"><spring:message code="resort.placeholder"/></th>
                <th scope="col"> <c:out value="${resort.id}" /> </th>
                <th scope="col"> <c:out value="${resort.name}" /></th>
                <th scope="col"> </th>
                <th scope="col"> </th>
                <th scope="col"> </th>

                <th scope="col"><a href="${addUrl}">+</a></th>
                <th scope="col"> <a href="${editUrl}"><img src="${editImgUrl}"></img></a></th>
                <th scope="col"> <a href="${deleteUrl}"><img src="${deleteImgUrl}"></img></a></th>
            </tr>
            </thead>

            <tbody >
            <c:if test="${!empty resort.tours}">
                <c:forEach items="${resort.tours}" var="tour">
                    <c:if test="${tour.active == true}">
                        <c:url var="editTour" value="/tour/edit?idResort=${resort.id}&tourId=${tour.id}" />
                        <c:url var="deleteTour" value="/tour/delete?idResort=${resort.id}&tourId=${tour.id}" />
                        <tr class="table-secondary">
                        <th scope="row"><spring:message code="tour"/></th>
                        <td><c:out value="${tour.id}" /></td>
                        <td><c:out value="${tour.name}" /></td>
                        <td><c:out value="${tour.full_price}" /></td>
                        <td><fmt:formatDate value="${tour.date_begin}" pattern="dd.MM.yyyy"  /></td>
                        <td><fmt:formatDate value="${tour.date_end}" pattern="dd.MM.yyyy"  /></td>

                        <td> <a href="${addTour}">+</a></td>
                        <td> <a href="${editTour}"><img src="${editImgUrl}"></img></a></td>
                        <td> <a href="${deleteTour}"><img src="${deleteImgUrl}"></img></a></td>



                        <c:url var="addTransport" value="/transport/add?idtour=${tour.id}" />
                        <c:if test="${!empty tour.transports}">

                            <c:forEach items="${tour.transports}" var="transport">

                                <c:url var="editTransport" value="/transport/edit?tourId=${tour.id}&transportId=${transport.id}" />
                                <c:url var="deleteTransport" value="/transport/delete?tourId=${tour.id}&transportId=${transport.id}" />
                                <c:url var="addTransport" value="/transport/add?idtour=${tour.id}" />

                                <c:if test="${transport.active == true}">
                                    <tr>
                                        <th scope="row"><spring:message code="transport"/></th>
                                        <td><c:out value="${transport.id}" /></td>
                                        <td><c:out value="${transport.name}" /></td>
                                        <td><c:out value="${transport.description}" /></td>
                                        <td> </td>
                                        <td> </td>
                                        <td><a href="${addTransport}">+</a></td>
                                        <td><a href="${editTransport}"><img src="${editImgUrl}"></img></a></td>
                                        <td><a href="${deleteTransport}"><img src="${deleteImgUrl}"></img></a></td>
                                    </tr>

                                </c:if>
                            </c:forEach>
                        </c:if>

                        <c:if test="${empty tour.transports}">
                            <tr>
                                <th scope="row"><spring:message code="transport"/></th>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td><a href="${addTransport}">+</a></td>
                                <td></td>
                                <td></td>
                            </tr>

                        </c:if>
                        <c:if test="${activeTransports==false}">
                            <tr>
                                <th scope="row"><spring:message code="transport"/>/th>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td><a href="${addTransport}">+</a></td>
                                <td></td>
                                <td></td>
                            </tr>

                        </c:if>

                        <c:url var="addHotel" value="/hotel/add?idtour=${tour.id}" />

                        <c:if test="${!empty tour.hotels}">
                            <c:forEach items="${tour.hotels}" var="hotel">
                                <c:if test="${hotel.active == true }">
                                    <tr  class="table-success">
                                        <th scope="row"><spring:message code="hotel"/></th>
                                        <td><c:out value="${hotel.id}" /></td>
                                        <td><c:out value="${hotel.name}" /></td>
                                        <td><c:out value="${hotel.address}" /></td>
                                        <td><c:out value="${hotel.stars}" /></td>
                                        <td> </td>
                                        <c:url var="addHotel" value="/hotel/add?idtour=${tour.id}" />
                                        <td><a href="${addHotel}">+</a></td>
                                        <c:url var="editHotel" value="/hotel/edit?tourId=${tour.id}&hotelId=${hotel.id}" />
                                        <c:url var="deleteHotel" value="/hotel/delete?tourId=${tour.id}&hotelId=${hotel.id}" />
                                        <td><a href="${editHotel}"><img src="${editImgUrl}"></img></a></td>
                                        <td><a href="${deleteHotel}"><img src="${deleteImgUrl}"></img></a></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:if>

                        <c:if test="${activeHotels==false}">
                            <tr >
                                <th scope="row"><spring:message code="hotel"/></th>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>

                                <td><a href="${addHotel}">+</a></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:if>
                        <c:if test="${empty tour.hotels}">
                            <tr >
                                <th scope="row"><spring:message code="hotel"/></th>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>

                                <td><a href="${addHotel}">+</a></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:if>


                    </c:if>
                </c:forEach>
            </c:if>

            <c:if test="${empty resort.tours}">
                <tr class="table-secondary">
                    <td scope="row"><spring:message code="tour"/></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                        <%--<c:url var="addTour" value="/tour/add?idResort=${resort.id}" />--%>
                    <td><a href="${addTour}">+</a></td>
                    <td></td>
                    <td></td>
                </tr>
            </c:if>

            <c:if test="${activeTours==false}">
                <tr class="table-secondary">
                    <td scope="row"><spring:message code="tour"/></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                        <%--<c:url var="addTour" value="/tour/add?idResort=${resort.id}" />--%>
                    <td><a href="${addTour}">+</a></td>
                    <td></td>
                    <td></td>
                </tr>
            </c:if>

            </tbody>
        </table>

    </c:forEach>
</c:if>



<c:if test="${activeResorts==false}">
    <thead class="table-primary">
    <tr>
        <th scope="col"><spring:message code="resort.placeholder"/></th>
        <th scope="col">-</th>
        <th scope="col">-</th>
        <th scope="col">-</th>
        <th scope="col">-</th>
        <th scope="col">-</th>
        <th scope="col"><a href="${addUrl}">+</a></th>
    </tr>
    </thead>
</c:if>


<jsp:include page="template/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

</body>
</html>

