<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:useBean id="utilisateur" type="com.eniencheres.bo.Utilisateur" scope="session" />--%>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
</head>
<body>
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

        <h1 class="logo me-auto"><a href="${pageContext.request.contextPath}/">ENI-ENCHERES</a></h1>


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

<section id="hero" class="d-flex align-items-center">

    <div class="container">
        <div class="row">
            <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
                <h1>Better Solutions For Your Business</h1>
                <h2>We are team of talented designers making websites with Bootstrap</h2>
                <div class="d-flex justify-content-center justify-content-lg-start">
                    <a href="#about" class="btn-get-started scrollto">Get Started</a>
                    <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
                </div>
            </div>
            <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
                <img src="${pageContext.request.contextPath}/assets/img/hero-img.png" class="img-fluid animated" alt="">
            </div>
        </div>
    </div>
</section>

<main>

</main>

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
                        <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/">Accueil</a></li>
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
</footer>


<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

<%--<div style="text-align: center">--%>
<%--    <h1>Welcome to Bookshop Website</h1>--%>
<%--    <c:if test="${! empty user}">--%>
<%--        <b>${user.prenom} (${user.email})</b>--%>
<%--        <br><br>--%>
<%--        <a href="${pageContext.request.contextPath}/deconnexion">Logout</a>--%>
<%--    </c:if>--%>
<%--    <c:if test="${empty user}">--%>
<%--        <p>Il n'y a rien à afficher</p>--%>
<%--    </c:if>--%>
<%--</div>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>--%>
</body>
</html>
