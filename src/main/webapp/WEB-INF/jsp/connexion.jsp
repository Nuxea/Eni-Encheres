<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
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
                    <h5 class="card-title text-center">Connexion</h5>
                    <form action="connexion" method="post" class="form-signin">
                        <div class="form-label-group saisie">
                            <p style="color: red">${message}</p>
                        </div>
                        <div class="form-label-group saisie">
                            <input type="text" id="email" class="form-control" placeholder="Email/Pseudo" name="identifiant" required>
                            <label for="email">Email / Pseudo</label>
                        </div>

                        <div class="form-label-group saisie">
                            <input type="password" id="password" class="form-control" placeholder="Mot de Passe" name="mot_de_passe" required>
                            <label for="password">Mot de Passe</label>
                        </div>

                        <div class="col-12">
                            <button class="btn btn-lg btn-success btn-block text-uppercase" type="submit">Se Connecter</button>
                            <a class="btn btn-lg btn-primary btn-block text-uppercase mt-2 small" href="inscription">S'inscrire</a>
                            <a class="btn btn-lg btn-outline-danger btn-block text-uppercase mt-2 small" href="${pageContext.request.contextPath}/">Annuler</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
<script>
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: "requis",
            },
            messages: {
                email: {
                    required: "Veuillez entrer une adresse mail",
                    email: "Veuillez entrer une adresse mail valide"
                },
                password: "Veuillez entrer un mot de passe"
            }
        });
    });
</script>
</body>
</html>
