<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>Nouvelle Enchère</title>
</head>
<body class="container">

<%--<c:if test="${ !empty sessionScope.user }">&lt;%&ndash; && sessionScope.user.equals("proprietaire")&ndash;%&gt;--%>
<%--    <p>Vous êtes ${ sessionScope.user }  !</p>--%>
<%--</c:if>--%>

<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center ">
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

<main id="main">
    <section class="breadcrumbs mb-3" id="breadcrumbs">
        <div class="container">
            <h2>Créer une nouvelle vente</h2>
        </div>
    </section>

    <%--formulaire de création d'enchère--%>
    <form action="${pageContext.request.contextPath}/CreationEnchere" method="post">

        <div class="form-group mb-2">
            <label for="article">Article</label>
            <input type="text" name="article" id="article" class="form-control"/>
            <c:if test="${!empty errorForm.getErreurNom }">
                <div class="alert alert-danger">
                    <strong>Erreur!</strong> <c:out value="${errorForm.getErreurNom}"/>
                </div>
            </c:if>
        </div>

        <div class="form-group mb-2">
            <label for="description">Description</label>
            <textarea name="description" id="description" cols="30" rows="10" class="form-control"></textarea>
        </div>

        <div class="form-group mb-2">
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
            <input type="file" id="photo" class="btn btn-secondary">
        </div>

        <div class="form-group mb-2">
            <label for="miseAPrix">Mise à prix</label>
            <input type="number" name="miseAPrix" id="miseAPrix" class="form-control"/>
        </div>

        <div class="form-group mb-2">
            <label for="dateDebut">Début de l'enchère</label>
            <input type="date" name="dateDebut" id="dateDebut" class="form-control"/>
            <input type="time" name="heureDebut" id="heureDebut" class="form-control"/>
        </div>

        <div class="form-group mb-2">
            <label for="dateFin">Fin de l'enchère</label>
            <input type="date" name="dateFin" id="dateFin" class="form-control"/>
            <input type="time" name="heureFin" id="heureFin" class="form-control"/>
            <c:if test="${!empty errorForm.getErreurDateFin }">
                <div class="alert alert-danger">
                    <strong>Erreur!</strong> <c:out value="${errorForm.getErreurDateFin}"/>
                </div>
            </c:if>
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

        <%--    <input type="datetime-local"  />--%>

        <div class="d-flex justify-content-around">
            <input type="submit" value="Enregistrer" class="btn btn-primary"
                   onclick="return confirm('Voulez-vous vraiment créer cette vente ?')"/>
            <input type="reset" value="Annuler" class="btn btn-light"/>
        </div>

    </form>

    <div id="preloader"></div>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

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
