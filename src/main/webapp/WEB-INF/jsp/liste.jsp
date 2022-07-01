<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: nchatelais2022
  Date: 27/06/2022
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liste des enchères</title>
</head>
<body class="container">

<%--<c:if test="${ !empty sessionScope.user }">--%>
<%--    <p>Vous êtes ${ sessionScope.user }  !</p>--%>
<%--</c:if>--%>

<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center ">
        <h1 class="logo me-auto"><a href="#">Liste des enchères</a></h1>
        <nav id="navbar" class="navbar">
            <ul>
                <li class="ms-3"><a class="nav-link scrollto active"
                                    href="${pageContext.request.contextPath}/ListeEncheres">Enchères</a>
                </li>
                <li class="ms-3"><a class="nav-link scrollto active"
                                    href="${pageContext.request.contextPath}/CreationEnchere">Vendre
                    un
                    article</a></li>
                <li class="ms-3"><a class="nav-link scrollto active" href="#/*profil.jsp*/">Mon profil</a></li>
                <li class="ms-3"><a class="nav-link scrollto active" href="#/*logout.jsp*/">Déconnexion</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
    </div>
</header>
<main id="main">
    <section class="breadcrumbs mb-3" id="breadcrumbs">
        <div class="container">
            <h2>Filtre</h2>
        </div>
    </section>
    <form method="post" action="${pageContext.request.contextPath}/Recherche">
        <fieldset>

            <div>

                <div class="form-group">
                    <input type="text" name="recherche" placeholder="Le nom ou la description de l'article contient"
                           class="form-control mb-3"/>
                </div>

                <div class="form-group">
                    <label for="categorie" class="mb-1">Catégorie :</label>
                    <select name="categorie" id="categorie" class="form-control mb-4">
                        <option value="">Toutes</option>
                        <option value=INFORMATIQUE>Informatique</option>
                        <option value=AMEUBLEMENT>Ameublement</option>
                        <option value=VETEMENT>Vêtement</option>
                        <option value=SPORT_ET_LOISIRS>Sport&Loisirs</option>
                    </select>
                </div>
            </div>
            <input type="submit" value="Rechercher" class="btn btn-primary mb-5"/>

        </fieldset>
    </form>
    <div>
        <div class="row">

            <c:forEach var="art" items="${articles}">
                <fmt:parseDate value="${art.dateFinEncheres}" pattern="yyyy-MM-dd" var="parsedDate" type="both"/>

                <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="both" pattern="dd-MM-yyyy à HH:mm"/>



                <a href="AffichageDetailsArticle?idArticle=${art.noArticle}" class="col-lg-6 mb-3">
                    <div class="d-flex">
                        <div class="list-group-item list-group-item-action w-50">
                            <h1>${art.nomArticle}</h1>
                            <p>Prix : ${art.miseAPrix}
                                <c:if test="${ art.miseAPrix <= 1}">
                                    <c:out value="point"/>
                                </c:if>
                                <c:if test="${ art.miseAPrix > 1}">
                                    <c:out value="points"/>
                                </c:if>

                            </p>
                            <c:set var="dateParsed" value="${art.dateFinEncheres}" scope="page" />
                            <p>Fin de l'enchère : <c:out
                                    value="${pageScope.dateParsed.format(DateTimeFormatter.ofPattern(\"dd-MM-yyyy à HH:mm\"))}" /></p>
                            <p>Vendeur : jojo44</p>
                        </div>
                        <div class="w-50">
                            <img src="${pageContext.request.contextPath}/images/poney.jpg" alt="poney"
                                 class="img-fluid">
                        </div>
                    </div>
                </a>
            </c:forEach>


        </div>
    </div>
</main>


<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>
