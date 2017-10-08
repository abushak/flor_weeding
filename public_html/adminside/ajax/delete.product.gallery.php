<?php
$picture = $_POST['name'];
$file = getFile($picture);
unlink(str_replace(SRV, ROOT, $file));