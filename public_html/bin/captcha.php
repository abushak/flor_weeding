<?php
$capletters = 'ABCDEFGKIJKLMNOPQRSTUVWXYZ123456789';
$captlen = 5;
$capwidth = 90; $capheight = 35;
$capfont = $_SERVER['DOCUMENT_ROOT'].'/skins/fonts/comic.ttf';
$capfontsize = 14;

header('Content-type: image/png');

$capim = imagecreatetruecolor($capwidth, $capheight);
imagesavealpha($capim, true);
$capbg = imagecolorallocatealpha($capim, 0, 0, 0, 127);
imagefill($capim, 0, 0, $capbg);

$capcha = '';

for ($i = 0; $i < $captlen; $i++) {
    $capcha .= $capletters[rand(0, strlen($capletters)-1) ];
    $x = ($capwidth - 20) / $captlen * $i + 10;
    $x = rand($x, $x+5);
    $y = $capheight - ( ($capheight - $capfontsize) / 2 );
    $capcolor = imagecolorallocate($capim, rand(0, 100), rand(0, 100), rand(0, 100) );
    $capangle = rand(-25, 25);
    imagettftext($capim, $capfontsize, $capangle, $x, $y, $capcolor, $capfont, $capcha[$i]);
}

session_start();
$_SESSION['captcha'] = $capcha;

imagepng($capim);
imagedestroy($capim);
