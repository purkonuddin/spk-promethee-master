<?php

if($_SESSION['level']!='superadmin'){
	$_SESSION['pesan'] = "Anda tidak berhak mengakses halaman tersebut";
	header('location:/spk-promethee-master/index.php');
}

 ?>