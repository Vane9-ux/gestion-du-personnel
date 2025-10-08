<?php
	//require_once("session/session.php");
	require_once("connexion.php");
	//require_once("role/roleutilisateur.php")
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<?php
	//require_once("header.php");
	?>
	<div class="col-md-12 col-xs-12 ">
		<div class="panel panel-info spacer">

		<div class="panel-heading centrer_en_tete">Liste des identifiants</div>

		<div class="panel-body">

			<table class="table table-striped">
			<thead>
				<tr>
					<th>gestionnaire_id</th><th>prenom</th><th>nom</th><th>date_embauche</th><th>email</th><th>entreprise_id</th><th>Envoyez login et pass</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				$requete="SELECT * FROM gestionaire";
                //$ps = $pdo->prepare($requete);
                //$ps->execute();
				while ($pr=$ps->fetch()) { ?>
					<tr>
					<td><?php echo ($pr['gestionnaire_id']) ?></td>
						<td><?php $prenom= $pr['prenom'] ;echo ($prenom) ?></td>
						<td><?php $nom = $pr['nom'] ;echo ($nom) ?></td>
						<td><?php echo ($pr['date_embauche']) ?></td>
						<td><?php echo ( $pr['email']) ?></td>
						<td><?php echo ($pr['entreprise_id']) ?></td>
						<td><a href="mailto:<?php echo ($pr['email']) ?>?subject= Activation de votre entreprise&body=Merci votre entreprise a été activée avec succes
						 prenom :<?php 
						echo $email?> votre email :<?php echo $email?>">Envoi</a></td>
					</tr>
						<?php } ?>
			</tbody>	
			</table>

		</div>
		</div>
</div>

</body>
</html>