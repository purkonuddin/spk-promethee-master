<?php
include '../koneksi.php';

$id = $_GET['id'];

if (mysqli_query($koneksi, "DELETE FROM CALON where id= '$id'"))
	$_SESSION['pesan'] = "Berhasil hapus data calon";
else
	$_SESSION['pesan'] = "Gagal hapus data calon";

header('location:/spk-promethee-master/index.php?url=data_calon');
 ?>