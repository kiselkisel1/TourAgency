<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Мария
  Date: 17.05.2019
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hotel</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>

<jsp:include page="template/header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col mb-5 mt-2">
            <h1 class="display-4">Hotels</h1>
        </div>
        <hr>
    </div>
</div>


<div class="container padding">
    <div class="row padding mt-5">
  <c:forEach items="${tour.hotels}" var="hotel">
      <c:if test="${hotel.active == true}">
    <c:url var="chooseHotel" value="/choose?idTour=${tour.id}&idHotel=${hotel.id}" />

      <div class="col-md-4">
          <div class="card">
              <img src="/img/${hotel.filename}" class="card-img-top">
              <div class="card-body">
                  <h4 class="card-title"><c:out value="${hotel.name}" /></h4>
                  <p class="card-text">Hotel :
             <c:out value="${hotel.stars}" /> stars,
            Address : <c:out value="${hotel.address}" />
                  </p>
            <a href="${chooseHotel}" class="btn btn-info">Choose</a>
              </div>
          </div>
      </div>
         </c:if>
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
