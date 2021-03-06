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
    <title>D??tails Article</title>
</head>
<body>


<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center ">
        <h1 class="logo me-auto"><a href="${pageContext.request.contextPath}/">ENI-ENCHERES</a></h1>
        <%--        <h1 class="logo me-auto"><a href="#">D??tails vente</a></h1>--%>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="${pageContext.request.contextPath}/">Accueil</a></li>
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/ListeEncheres">Les
                    Ench??res</a></li>
                <c:if test="${empty utilisateur}">
                    <li class="dropdown"><a href="#"><span>Compte</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="inscription">Inscription</a></li>
                            <li><a href="connexion">Connexion</a></li>

                        </ul>
                    </li>
                </c:if>
                <c:if test="${! empty utilisateur}">
                    <li class="dropdown"><a href="#"><span>Bonjour ${utilisateur.pseudo}</span> <i
                            class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="profil">Mon Compte</a></li>
                            <li><a href="${pageContext.request.contextPath}/CreationEnchere">Vendre un article</a></li>
                            <li><a href="deconnexion">D??connexion</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
    </div>
</header>

<%--<section class="portfolio-details">--%>
<%--    <fmt:parseDate value="${article.dateFinEncheres}" pattern="yyyy-MM-dd" var="parsedDate" type="both"/>--%>

<%--    <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="both" pattern="dd-MM-yyyy ?? HH:mm"/>--%>

<%--    &lt;%&ndash;    <p class="mt-5">${pageContext.request.getAttribute("datesOk")}</p>&ndash;%&gt;--%>

<%--    <div class="container mt-5">--%>
<%--        <div class="portfolio-info d-flex">--%>
<%--            <div class="w-50">--%>
<%--                <h2>${article.nomArticle}</h2>--%>
<%--                <p><strong>Cat??gorie :</strong> ${article.categorieArticle.libelle}</p>--%>
<%--                <p><strong>Meilleure offre :</strong></p>--%>
<%--                <p><strong>Mise ?? prix :</strong> ${article.miseAPrix}--%>
<%--                    <c:if test="${ article.miseAPrix <= 1}">--%>
<%--                        <c:out value="point"/>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${ article.miseAPrix > 1}">--%>
<%--                        <c:out value="points"/>--%>
<%--                    </c:if>--%>
<%--                </p>--%>
<%--                <p><strong>Fin de l'ench??re :</strong>--%>
<%--                    <%= article.getDateFinEncheres().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")) %>--%>
<%--                </p>--%>
<%--                <p><strong>Retrait :</strong></p>--%>
<%--                <p><strong>Vendeur :</strong> ${vendeur.pseudo}</p>--%>
<%--            </div>--%>

<%--            <div class="w-50">--%>
<%--                <img src="${pageContext.request.contextPath}/assets/img/images/poney.jpg" alt="poney"--%>
<%--                     class="img-fluid rounded">--%>
<%--            </div>--%>

<%--        </div>--%>
<%--        <div class="portfolio-description">--%>
<%--            <h2>Description :</h2>--%>
<%--            <p>${article.description}</p>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</section>--%>

<%--<form action="${pageContext.request.contextPath}/AffichageDetailsArticle" method="post">--%>
<%--    <div class="form-group mb-5">--%>
<%--        <label for="proposition">Ma proposition : </label>--%>
<%--        <input type="number" id="proposition" name="proposition">--%>
<%--        <input type="submit" value="Ench??rir" class="btn btn-primary">--%>
<%--    </div>--%>

<%--</form>--%>

<%--<div class="d-flex justify-content-around mt-5">--%>

<%--    <c:if test="${ utilisateur.pseudo.equals(vendeur.pseudo)}">--%>
<%--        <form action="${pageContext.request.contextPath}/Edition">--%>

<%--            <% session.setAttribute("idArticle", article.getNoArticle()); %>--%>

<%--            <input type="submit" value="Editer la vente" class="btn btn-success">--%>

<%--        </form>--%>


<%--        <form action="${pageContext.request.contextPath}/AnnulerVente" method="post">--%>
<%--            <div>--%>

<%--                <% session.setAttribute("idArticle", article.getNoArticle()); %>--%>

<%--                <input type="submit" value="Annuler la vente" class="btn btn-danger"--%>
<%--                       onclick="return confirm('Voulez-vous vraiment annuler la vente ?')">--%>

<%--            </div>--%>
<%--        </form>--%>
<%--    </c:if>--%>
<%--</div>--%>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <ol>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li>D??tails de l'ench??re</li>
            </ol>
            <h2>D??tails</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-8">
                    <div class="portfolio-details-slider swiper">
                        <div class="swiper-wrapper align-items-center">

                            <div class="swiper-slide">
                                <img src="${pageContext.request.contextPath}/assets/img/portfolio/portfolio-details-2.jpg" alt="">
                            </div>

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="portfolio-info">
                        <h3>${article.nomArticle}</h3>
                        <ul>
                            <li><strong>Cat??gorie</strong>: ${article.categorieArticle.libelle}</li>
                            <li><strong>Mise ?? Prix</strong>: ${article.miseAPrix} ???</li>
                            <li><strong>Fin de l'ench??re</strong>: <%=
                            article.getDateFinEncheres().format(DateTimeFormatter.ofPattern("dd-MM-yyyy ?? HH:mm")) %></li>
                            <li><strong>Retrait</strong>: ${vendeur.ville} </li>
                        </ul>
                    </div>
                    <div class="portfolio-description">
                        <h2><strong>Vendeur</strong>: ${vendeur.pseudo}</h2>
                        <p>${article.description}</p>
                    </div>
                </div>

            </div>
            <div class="container-fluid breadcrumbs">
                <div class="container d-flex justify-content-between align-items-center">
                    <div class="col-5 mt-3">
                        <form action="${pageContext.request.contextPath}/AffichageDetailsArticle" method="post">
                                <label hidden for="proposition">Ma proposition : </label>
                                <input type="number" id="proposition" name="proposition" placeholder="Ma Proposition :">
                                <input type="submit" value="Ench??rir" class="btn btn-primary">
                        </form>
                    </div>

                    <c:if test="${ utilisateur.pseudo.equals(vendeur.pseudo)}">
                        <div class="row">
                            <div class="col">
                                <form action="${pageContext.request.contextPath}/Edition">
                                    <% session.setAttribute("idArticle", article.getNoArticle()); %>
                                    <input type="submit" value="Editer la vente" class="btn btn-success">
                                </form>
                            </div>

                            <div class="col">
                                <form action="${pageContext.request.contextPath}/AnnulerVente" method="post">
                                    <% session.setAttribute("idArticle", article.getNoArticle()); %>
                                    <input type="submit" value="Annuler la vente" class="btn btn-danger" onclick="return confirm('Voulez-vous vraiment annuler la vente ?')">
                                </form>
                            </div>

                        </div>
                    </c:if>
                </div>


            </div>
        </div>
    </section><!-- End Portfolio Details Section -->

</main><!-- End #main -->


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
