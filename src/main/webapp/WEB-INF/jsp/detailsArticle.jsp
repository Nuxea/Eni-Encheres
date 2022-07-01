<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: nchatelais2022
  Date: 27/06/2022
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="article" scope="request" type="com.eniencheres.bo.ArticleVendu"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>Détails Article</title>
</head>
<body class="container">


<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center ">
        <h1 class="logo me-auto"><a href="${pageContext.request.contextPath}/">ENI-ENCHERES</a></h1>
<%--        <h1 class="logo me-auto"><a href="#">Détails vente</a></h1>--%>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="${pageContext.request.contextPath}/">Accueil</a></li>
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/ListeEncheres">Les Enchères</a></li>
                <c:if test="${empty utilisateur}">
                    <li class="dropdown"><a href="#"><span>Compte</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="inscription">Inscription</a></li>
                            <li><a href="connexion">Connexion</a></li>

                        </ul>
                    </li>
                </c:if>
                <c:if test="${! empty utilisateur}">
                    <li class="dropdown"><a href="#"><span>Bonjour ${utilisateur.pseudo}</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="profil">Mon Compte</a></li>
                            <li><a href="${pageContext.request.contextPath}/CreationEnchere">Vendre un article</a></li>
                            <li><a href="deconnexion">Déconnexion</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
    </div>
</header>

<section class="portfolio-details">
    <fmt:parseDate value="${article.dateFinEncheres}" pattern="yyyy-MM-dd" var="parsedDate" type="both"/>

    <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="both" pattern="dd-MM-yyyy à HH:mm"/>

<%--    <p class="mt-5">${pageContext.request.getAttribute("datesOk")}</p>--%>

    <div class="container mt-5">
        <div class="portfolio-info d-flex">
            <div class="w-50">
                <h2>${article.nomArticle}</h2>
                <p><strong>Catégorie :</strong> ${article.categorieArticle.libelle}</p>
                <p><strong>Meilleure offre :</strong></p>
                <p><strong>Mise à prix :</strong> ${article.miseAPrix}
                    <c:if test="${ article.miseAPrix <= 1}">
                        <c:out value="point"/>
                    </c:if>
                    <c:if test="${ article.miseAPrix > 1}">
                        <c:out value="points"/>
                    </c:if>
                </p>
                <p><strong>Fin de l'enchère :</strong>
                    <%= article.getDateFinEncheres().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")) %></p>
                <p><strong>Retrait :</strong></p>
                <p><strong>Vendeur :</strong> ${article.noArticle}</p>
            </div>

            <div class="w-50">
                <img src="${pageContext.request.contextPath}/assets/img/images/poney.jpg" alt="poney" class="img-fluid rounded">
            </div>

        </div>
        <div class="portfolio-description">
            <h2>Description :</h2>
            <p>${article.description}</p>
        </div>

    </div>
</section>

<form action="${pageContext.request.contextPath}/AffichageDetailsArticle" method="post">
    <div class="form-group mb-5">
        <label for="proposition">Ma proposition : </label>
        <input type="number" id="proposition" name="proposition">
        <input type="submit" value="Enchérir" class="btn btn-primary">
    </div>

</form>

<div class="d-flex justify-content-around mt-5">
    <form action="${pageContext.request.contextPath}/Edition">

        <% session.setAttribute("idArticle", article.getNoArticle()); %>

        <input type="submit" value="Editer la vente" class="btn btn-success">

    </form>

    <form action="${pageContext.request.contextPath}/AnnulerVente" method="post">
        <div>

            <% session.setAttribute("idArticle", article.getNoArticle()); %>

            <input type="submit" value="Annuler la vente" class="btn btn-danger"
                   onclick="return confirm('Voulez-vous vraiment annuler la vente ?')">

        </div>
    </form>
</div>

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
