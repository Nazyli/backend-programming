<?php

function calculateAreaOfCircle($jari){
    $PHI = 3.14;
    return $PHI * pow($jari, 2);
}

echo calculateAreaOfCircle(5);
echo "</br>";
echo calculateAreaOfCircle(10);
echo "</br>";
echo calculateAreaOfCircle(20);