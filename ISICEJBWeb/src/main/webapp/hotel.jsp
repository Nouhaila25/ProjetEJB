<%@ page import="entities.Hotel" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Hotels</title>
    <!-- Ajout des liens vers Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* Boutons verts pour tous les boutons dans le tableau */
        .btn-table {
            background-color: #28a745;
            color: #fff;
        }

        th, td {
            text-align: center;
        }

        /* Styles spécifiques aux boutons du tableau */
        .btn-table {
            background-color: #28a745;
            color: #fff;
        }

        /* Taille petite pour les champs de texte */
        .form-control-sm {
            height: calc(1.5em + .5rem + 2px);
            padding: .25rem .5rem;
            font-size: .75rem;
        }
    </style>
</head>
<body>

<div class="container mt-3">
    <form action="HotelController" method="post" class="mt-3">
        <div class="form-group">
            <label for="nom">Nom :</label> 
            <input type="text" name="nom" id="nom" class="form-control form-control-sm" required value="${empty hotel ? '' : hotel.nom}" />
        </div>
        <div class="form-group">
            <label for="adresse">Adresse :</label> 
            <input type="text" name="adresse" id="adresse" class="form-control form-control-sm" required value="${empty hotel ? '' : hotel.adresse}" />
        </div>
        <div class="form-group">
            <label for="telephone">Téléphone :</label> 
            <input type="text" name="telephone" id="telephone" class="form-control form-control-sm" required value="${empty hotel ? '' : hotel.telephone}" />
        </div>
			<div class="form-group">
				<label for="ville">Ville ID :</label> <input type="text"
					name="ville" id="ville" class="form-control form-control-sm"
					required value="${empty hotel ? '' : hotel.ville.id}" />
			</div>


			<c:choose>
            <c:when test="${empty hotel}">
                <button type="submit" name="action" value="ajouter" class="btn btn-table">Enregistrer</button>
            </c:when>
            <c:otherwise>
                <button type="submit" name="action" value="modifier" class="btn btn-warning">Modifier</button>
                <input type="hidden" name="id" value="${hotel.id}" />
            </c:otherwise>
        </c:choose>
    </form>

    <h1 class="mt-3">Liste des hotels</h1>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Adresse</th>
                <th>Téléphone</th>
                <th>Ville</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${hotels}" var="h">
                <tr>
                    <td>${h.id}</td>
                    <td>${h.nom}</td>
                    <td>${h.adresse}</td>
                    <td>${h.telephone}</td>
                    <td>${h.ville.nom}</td>
                    <td>
                        <a href="#"  class="btn btn-table btn-sm">Modifier</a>
                        <a href="#"  class="btn btn-table btn-sm btn-danger">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Ajout des liens vers Bootstrap JS et jQuery (si besoin) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

</body>
</html>
