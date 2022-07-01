<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="utilisateur" type="com.eniencheres.bo.Utilisateur" scope="session" />
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Compte</title>
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

<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center">

        <h1 class="logo me-auto">
            <a href="${pageContext.request.contextPath}/">ENI-ENCHERES</a>
        </h1>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link active" href="#">Accueil</a></li>
                <li><a class="nav-link" href="#">Les Enchères</a></li>
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
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <ol>
                <li><a href="${pageContext.request.contextPath}/">Accueil</a></li>
                <li>Mon Compte</li>
            </ol>
            <h2>Mon Compte</h2>

        </div>
    </section>

    <section id="portfolio-details" class="section profile">
        <div class="container">
            <div class="row">
                <div class="col-xl-4">

                    <div class="card">
                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                            <img src="https://images.unsplash.com/photo-1634038971836-3ef8d473ccdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2380&q=80" alt="Profile" class="rounded-circle">
                            <h2>${utilisateur.nom} ${utilisateur.prenom}</h2>
                            <h3>${utilisateur.pseudo}</h3>
                            <div class="social-links mt-2">
                                <a href="#">
                                    <i class="bi bi-coin"></i>
                                    ${utilisateur.credit}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">

                    <c:if test="${! empty message}">
                        <div class="card mb-2 p-3">
                            <div class="row">
                                <div style="color: green" class="col-lg-9 col-md-8"><strong>${message}</strong></div>
                            </div>
                        </div>
                    </c:if>
                    <div class="card">
                        <div class="card-body pt-3">
                        <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered">

                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Détails profil</button>
                                </li>

                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Modifier profil</button>
                                </li>

                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Modifier mot de passe</button>
                                </li>

                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-list-product">Liste des enchères</button>
                                </li>
                            </ul>
                            <div class="tab-content pt-2">
                                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                    <div class="row mt-3">
                                        <div class="col-lg-3 col-md-4 label">Pseudo</div>
                                        <div class="col-lg-9 col-md-8">${utilisateur.pseudo}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label ">Nom</div>
                                        <div class="col-lg-9 col-md-8">${utilisateur.nom}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Prénom</div>
                                        <div class="col-lg-9 col-md-8">${utilisateur.prenom}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Email</div>
                                        <div class="col-lg-9 col-md-8">${utilisateur.email}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Adresse</div>
                                        <div class="col-lg-9 col-md-8">${utilisateur.rue} ${utilisateur.code_postal} ${utilisateur.ville}</div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Téléphone</div>
                                        <div class="col-lg-9 col-md-8">${utilisateur.telephone}</div>
                                    </div>

                                    <div class="d-flex justify-content-end">
                                        <form action="supprimer" method="post">
                                            <input hidden type="number" name="no_utilisateur" value="${utilisateur.no_utilisateur}" />
                                            <button type="submit" class="btn btn-danger">Supprimer votre Compte</button>
                                        </form>

                                    </div>
                                </div>

                                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                                <!-- Profile Edit Form -->
                                    <form action="modifier" method="post">
                                        <div hidden class="col-lg-9 col-md-8">
                                            <input name="no_utilisateur" type="number" class="form-control" id="id2" value="${utilisateur.no_utilisateur}">
                                        </div>

                                        <div class="row mb-3">
                                            <label for="pseudo" class="col-md-4 col-lg-3 col-form-label">Pseudo</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="pseudo" type="text" class="form-control" id="pseudo" value="${utilisateur.pseudo}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="nom" class="col-md-4 col-lg-3 col-form-label">Nom</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="nom" type="text" class="form-control" id="nom" value="${utilisateur.nom}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="prenom" class="col-md-4 col-lg-3 col-form-label">Prénom</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="prenom" type="text" class="form-control" id="prenom" value="${utilisateur.prenom}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="email" type="email" class="form-control" id="email" value="${utilisateur.email}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="rue" class="col-md-4 col-lg-3 col-form-label">N° et Nom de rue</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="rue" type="text" class="form-control" id="rue" value="${utilisateur.rue}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="codePostal" class="col-md-4 col-lg-3 col-form-label">Code Postal</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="code_postal" type="text" class="form-control" id="codePostal" value="${utilisateur.code_postal}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="ville" class="col-md-4 col-lg-3 col-form-label">Ville</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="ville" type="text" class="form-control" id="ville" value="${utilisateur.ville}">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="telephone" class="col-md-4 col-lg-3 col-form-label">Téléphone</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="telephone" type="text" class="form-control" id="telephone" value="${utilisateur.telephone}">
                                            </div>
                                        </div>

                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                    </form><!-- End Profile Edit Form -->
                                </div>

                                <div class="tab-pane fade pt-3" id="profile-change-password">
                                <!-- Change Password Form -->
                                    <form action="modifierMdp" method="post">
                                        <div hidden class="col-lg-9 col-md-8">
                                            <input name="no_utilisateur" type="number" class="form-control" id="id" value="${utilisateur.no_utilisateur}">
                                        </div>

                                        <div class="row mb-3">
                                            <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Mot de Passe actuel</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="mot_de_passe_actuel" type="password" class="form-control" id="currentPassword">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">Nouveau Mot de Passe</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="nouveau_mot_de_passe" type="password" class="form-control" id="newPassword">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Vérification nouveau Mot de Passe</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="mot_de_passe_verif" type="password" class="form-control" id="renewPassword">
                                            </div>
                                        </div>

                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary">Modifier</button>
                                        </div>
                                    </form><!-- End Change Password Form -->
                                </div>

                                <div class="tab-pane fade pt-3" id="profile-list-product">

                                    <div class="row mb-3">
                                    </div>

                                    <div class="row mb-3">
                                    </div>

                                    <div class="row mb-3">
                                    </div>
                                </div>
                            </div><!-- End Bordered Tabs -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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

</body>
</html>
