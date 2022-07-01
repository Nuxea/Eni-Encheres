<%@ page import="java.time.format.DateTimeFormatter" %>

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
<body>


<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center ">
        <h1 class="logo me-auto"><a href="${pageContext.request.contextPath}/">ENI-ENCHERES</a></h1>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="${pageContext.request.contextPath}/">Accueil</a></li>
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/ListeEncheres">Les
                    Enchères</a></li>

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
                            <li><a href="deconnexion">Déconnexion</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
    </div>
</header>

<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

        <ol>
            <li><a href="${pageContext.request.contextPath}/">Accueil</a></li>
            <li>Liste des Enchères</li>
        </ol>
        <h2>Enchères</h2>

    </div>
</section>

<%--<main id="main">--%>
<%--    <section class="breadcrumbs mb-3" id="breadcrumbs">--%>
<%--        <div class="container">--%>
<%--            <h2 class="mb-0">Filtre</h2>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--    <form method="post" action="${pageContext.request.contextPath}/Recherche">--%>
<%--        <fieldset>--%>

<%--            <div>--%>

<%--                <div class="form-group">--%>
<%--                    <input type="text" name="recherche" placeholder="Le nom ou la description de l'article contient"--%>
<%--                           class="form-control mb-3"/>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label for="categorie" class="mb-1">Catégorie :</label>--%>
<%--                    <select name="categorie" id="categorie" class="form-control mb-4">--%>
<%--                        <option value="">Toutes</option>--%>
<%--                        <option value=INFORMATIQUE>Informatique</option>--%>
<%--                        <option value=AMEUBLEMENT>Ameublement</option>--%>
<%--                        <option value=VETEMENT>Vêtement</option>--%>
<%--                        <option value=SPORT_ET_LOISIRS>Sport&Loisirs</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <input type="submit" value="Rechercher" class="btn btn-primary mb-5"/>--%>

<%--        </fieldset>--%>
<%--    </form>--%>
<%--    <div>--%>
<%--        <div class="row">--%>
<%--            <h2>Liste des enchères</h2>--%>
<%--            <c:forEach var="art" items="${articles}">--%>
<%--                <fmt:parseDate value="${art.dateFinEncheres}" pattern="yyyy-MM-dd" var="parsedDate" type="both"/>--%>

<%--                <fmt:formatDate value="${parsedDate}" var="newParsedDate" type="both" pattern="dd-MM-yyyy à HH:mm"/>--%>


<%--                <a href="AffichageDetailsArticle?idArticle=${art.noArticle}" class="col-lg-6 mb-3">--%>
<%--                    <div class="d-flex">--%>
<%--                        <div class="list-group-item list-group-item-action w-50">--%>
<%--                            <h1>${art.nomArticle}</h1>--%>
<%--                            <p>Prix : ${art.miseAPrix}--%>
<%--                                <c:if test="${ art.miseAPrix <= 1}">--%>
<%--                                    <c:out value="point"/>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${ art.miseAPrix > 1}">--%>
<%--                                    <c:out value="points"/>--%>
<%--                                </c:if>--%>

<%--                            </p>--%>
<%--                            <c:set var="dateParsed" value="${art.dateFinEncheres}" scope="page"/>--%>
<%--                            <p>Fin de l'enchère : <c:out--%>
<%--                                    value="${pageScope.dateParsed.format(DateTimeFormatter.ofPattern(\"dd-MM-yyyy à HH:mm\"))}"/></p>--%>
<%--                            <p>Vendeur : jojo44</p>--%>
<%--                        </div>--%>
<%--                        <div class="w-50">--%>
<%--                            <img src="${pageContext.request.contextPath}/assets/img/images/poney.jpg" alt="poney"--%>
<%--                                 class="img-fluid">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </c:forEach>--%>


<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>

<main id="main">
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>Liste des enchères</h2>
                <%--                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>--%>
            </div>

            <div id="search">
                <div class="search-bar">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <h4>Rechercher</h4>
                                <p>Entrez le nom ou la description de l'article recherché</p>
                                <form action="${pageContext.request.contextPath}/Recherche" method="post">
                                    <input type="text" name="recherche" placeholder="Rechercher">
                                    <input type="submit" value="Rechercher">
                                </form>
                            </div>
                        </div>
                        <ul id="portfolio-flters" class="d-flex justify-content-center" data-aos="fade-up"
                            data-aos-delay="100">
                            <li data-filter="*" class="filter-active">All</li>
                            <c:forEach var="cat" items="${categories}" >
                                <li data-filter=".filter-${cat.libelle}">${cat.libelle}</li>
                            </c:forEach>

                            <%--                            <li data-filter=".filter-INFORMATIQUE">INFORMATIQUE</li>--%>
                            <%--                            <li data-filter=".filter-AMEUBLEMENT">AMEUBLEMENT</li>--%>
                            <%--                            <li data-filter=".filter-VETEMENT">VETEMENT</li>--%>
                            <%--                            <li data-filter=".filter-SPORT_ET_LOISIRS">SPORT & LOISIRS</li>--%>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row portfolio-container mt-3" data-aos="fade-up" data-aos-delay="200">

                <c:forEach var="art" items="${articles}">
                    <div class="col-lg-4 col-md-6 portfolio-item filter-${art.categorieArticle.libelle}">
                        <div class="portfolio-img"><img
                                src="${pageContext.request.contextPath}/assets/img/portfolio/portfolio-1.jpg"
                                class="img-fluid"
                                alt=""></div>
                        <div class="portfolio-info">
                            <h4>${art.nomArticle}</h4>
                            <p>Prix : ${art.miseAPrix} €</p>
                            <a href="${pageContext.request.contextPath}/assets/img/portfolio/portfolio-1.jpg"
                               data-gallery="portfolioGallery" class="portfolio-lightbox preview-link"
                               title="${art.nomArticle}"><i
                                    class="bx bx-plus"></i></a>
                            <a href="AffichageDetailsArticle?idArticle=${art.noArticle}" class="details-link"
                               title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </section><!-- End Portfolio Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-6 col-md-6 footer-contact">
                    <h3>Eni-Encheres</h3>
                    <p>
                        3 Rue Michael Faraday <br>
                        44800<br>
                        Saint-Herblain <br><br>
                        <strong>Téléphone :</strong> 02 28 03 17 28<br>
                    </p>
                </div>

                <div class="col-lg-6 col-md-6 footer-links">
                    <h4>Liens Utiles</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a
                                href="${pageContext.request.contextPath}/">Accueil</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Les Enchères</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <div class="container footer-bottom clearfix">
        <div class="copyright">
            &copy; Copyright <strong><span>Eni-Encheres</span></strong>.
        </div>
    </div>

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>
</footer>

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
