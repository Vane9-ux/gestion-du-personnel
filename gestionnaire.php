<?php
require_once("connexion.php");
$gestionnaire_id=$_POST['gestionnaire_id'];
$prenom=$_POST['prenom'];
$nom=$_POST['nom'];
$email=$_POST['email'];
$entreprise_id='entreprise_id';
$date_embauche=$_POST['date_embauche'];
$ps=$pdo->prepare("INSERT INTO gestionaire VALUES ('','$prenom ','$nom','$email','$date_embauche','$entrepise_id')");
$ps->execute();
header("location:identifiant.php");

?>