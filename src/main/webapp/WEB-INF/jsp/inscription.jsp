<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>

    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link href="${pageContext.request.contextPath}/assets/css/log.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
            <div class="card card-signin flex-row my-5">
                <div class="card-img-left d-none d-md-flex">
                    <!-- Background image for card set in CSS! -->
                </div>
                <div class="card-body">
                    <h5 class="card-title text-center">Inscription</h5>
                    <form action="<c:url value="/inscription" />" method="post" class="form-signin">
                        <div class="form-label-group saisie">
                            <p style="color: red">${message}</p>
                        </div>
                        <div class="d-flex">
                            <div class="col-6">
                                <div class="form-label-group saisie">
                                    <input type="text" id="inputUserame" class="form-control" placeholder="Pseudo" name="pseudo" value="${param.pseudo}" required autofocus>
                                    <label for="inputUserame">Pseudo</label>
                                </div>


                                <div class="form-label-group saisie">
                                    <input type="text" id="inputFirstName" class="form-control" placeholder="Nom" name="nom" value="${param.nom}" required autofocus>
                                    <label for="inputFirstName">Nom</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="text" id="inputLastName" class="form-control" placeholder="Prénom" name="prenom" value="${param.prenom}" required autofocus>
                                    <label for="inputLastName">Prénom</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="email" id="inputEmail" class="form-control" placeholder="Email" name="email" value="${param.email}" required>
                                    <label for="inputEmail">Email</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="text" id="inputTelephone" class="form-control" placeholder="Téléphone" name="telephone" value="${param.telephone}" required>
                                    <label for="inputTelephone">Téléphone</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-label-group saisie">
                                    <input type="text" id="inputRue" class="form-control" placeholder="Numéro et Nom de rue" name="rue" value="${param.rue}" required>
                                    <label for="inputRue">N° et Nom de rue</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="text" id="inputCodePostal" class="form-control" placeholder="Code Postal" name="code_postal" value="${param.code_postal}" required>
                                    <label for="inputCodePostal">Code Postal</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="text" id="inputVille" class="form-control" placeholder="Ville" name="ville" value="${param.ville}" required>
                                    <label for="inputVille">Ville</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="password" id="inputMotDePasse" class="form-control" placeholder="Mot de Passe" name="mot_de_passe" value="${param.mot_de_passe}" required>
                                    <label for="inputMotDePasse">Mot de Passe</label>
                                </div>

                                <div class="form-label-group saisie">
                                    <input type="password" id="inputVerifMotDePasse" class="form-control" placeholder="Verification Mot de Passe" name="mot_de_passe_verif" value="${param.mot_de_passe}" required>
                                    <label for="inputVerifMotDePasse">Vérification de Mot de Passe</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">S'enregistrer</button>
                            <a class="btn btn-lg btn-success btn-block text-uppercase mt-2 small" href="connexion">Se Connecter</a>
                            <a class="btn btn-lg btn-outline-danger btn-block text-uppercase mt-2 small" href="${pageContext.request.contextPath}/">Annuler</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
