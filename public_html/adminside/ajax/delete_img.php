<?php
$link = $_POST['link'];
$file = str_replace(SRV, ROOT, $link);
if($file != ROOT.'adminside/skins/image/nophoto.jpg') unlink($file);