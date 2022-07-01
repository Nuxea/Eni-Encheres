<%--
  Created by IntelliJ IDEA.
  User: nchatelais2022
  Date: 29/06/2022
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Editer</title>
</head>
<body class="container">

<%--<c:if test="${ !empty sessionScope.user }">&lt;%&ndash; && sessionScope.user.equals("proprietaire")&ndash;%&gt;--%>
<%--    <p>Vous êtes ${ sessionScope.user }  !</p>--%>
<%--</c:if>--%>

<jsp:useBean id="article"   type="fr.eni.projet.encheres.bo.ArticleVendu" scope="request" />

<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center ">
        <h1 class="logo me-auto"><a href="#">Editer vente</a></h1>
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
            <h2>Modification d'une vente</h2>
        </div>
    </section>

<%--formulaire d'édition d'enchère--%>
<form action="${pageContext.request.contextPath}/Edition" method="post">

    <div class="form-group mb-2">
        <label for="article">Article</label>
        <input type="text" name="article" id="article" value="${article.nomArticle}" class="form-control"/>
    </div>

    <div class="form-group mb-2">
        <label for="description">Description</label>
        <textarea name="description" id="description" cols="30" rows="10" class="form-control">${article.description}</textarea>
    </div>

    <div class="form-group mb-2">
<%--        TODO : selected la bonne catégorie --%>
        <label for="categorie">Catégorie</label>
        <select name="categorie" id="categorie" class="form-control">
            <option value=INFORMATIQUE>Informatique</option>
            <option value=AMEUBLEMENT>Ameublement</option>
            <option value=VETEMENT>Vêtement</option>
            <option value=SPORT_ET_LOISIRS>Sport&Loisirs</option>
        </select>
    </div>

    <div class="form-group mb-2">
        <label for="photo">Photo de l'article</label>
        <button type="button" id="photo" class="btn btn-secondary">UPLOADER</button>
    </div>

    <div class="form-group mb-2">
        <label for="miseAPrix">Mise à prix</label>
        <input type="number" name="miseAPrix" id="miseAPrix" value="${article.miseAPrix}" class="form-control"/>
    </div>

    <div class="form-group mb-2">
        <label for="dateDebut">Début de l'enchère</label>
        <input type="date" name="dateDebut" id="dateDebut" value="" class="form-control"/>
    </div>

    <div class="form-group mb-2">
        <label for="dateFin">Fin de l'enchère</label>
        <input type="date" name="dateFin" id="dateFin" value="" class="form-control"/>
    </div>

    <fieldset>
        <legend>Retrait</legend>
        <div class="form-group mb-2">
            <label for="rue">Rue :</label>
            <input type="text" name="rue" id="rue" class="form-control"/>
        </div>

        <div class="form-group mb-2">
            <label for="codePostal">Code postal :</label>
            <input type="text" name="codePostal" id="codePostal" class="form-control"/>
        </div>

        <div class="form-group mb-2">
            <label for="ville">Ville :</label>
            <input type="text" name="ville" id="ville" class="form-control"/>
        </div>

    </fieldset>

    <div class="d-flex justify-content-center">
        <input type="submit" value="Enregistrer" class="btn btn-primary"/>
        <input type="reset" value="Annuler" class="btn btn-light"  onclick="window.history.go(-1); return false;"/>
    </div>

</form>
<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</main>
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
