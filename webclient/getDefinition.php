<?php
require 'vendor/autoload.php';
use GuzzleHttp\Client;

$palabrejas= explode("\n", file_get_contents('palabrejas'));

$palabreja = $palabrejas[array_rand($palabrejas)];

$client = new Client([
    'base_uri' => 'https://dle.rae.es',
]);
$response = $client->request('GET', '/' . $palabreja);
$body = $response->getBody();

$pattern = "/<meta name=\"description\" content=\"(.*)\"/";

preg_match($pattern, $body, $matches);

$def = $matches[1];

if (strstr($def, "RAE")) {
    $subdef = (explode(":", $def));
    echo implode("", array_slice($subdef, 1));
} else {
    echo $def;
}

echo "<br/><br/><a href=\"http://dle.rae.es/$palabreja\" target='_blank'>ver</a>";

echo "<br/><br/><a href='javascript:location.reload();'>actualiza</a>";
?>
