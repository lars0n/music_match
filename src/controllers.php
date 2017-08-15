<?php

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

//Request::setTrustedProxies(array('127.0.0.1'));

$app->get('/', function () use ($app) {
    return $app['twig']->render('index.html.twig', array());
})
->bind('homepage')
;

// ----------------- User ----------------- //


$app
    ->match('/inscription', 'user.controller:registerAction')
    ->bind('register')
;

$app
    ->match('/connexion', 'user.controller:loginAction')
    ->bind('login')
;

$app
    ->get('/{username}/profil', 'profile.controller:displayProfileAction')
    /*->assert('username', '/^[a-zA-Z0-9_-]{6,20}$/') /* username caractères acceptés : 
    a-z, A-Z, 0-9, _ -, de 6 à 20 caractères */
    ->bind('display')
;

$app
    ->match('/{username}/edition_profil', 'profile.controller:editProfileAction')
    ->bind('edit')
;

$app
    ->match('/deconnexion', 'user.controller:logoutAction')
    ->bind('logout')
;

// ----------------- Dashboard ----------------- //

$app
    ->get('/{username}/accueil', 'dashboard.controller:userMusicDisplayAction')
    ->bind('dashboardDisplay')
;


// ----------------- Album --------------------- //


$app
    ->get('/album/{id_album}', 'music.controller:showAlbumAction')
    ->bind('showAlbum')
;

$app
    ->get('/artist/{id_artist}', 'music.controller:showArtistAction')
    ->bind('showArtist')
;






$app->error(function (\Exception $e, Request $request, $code) use ($app) {
    if ($app['debug']) {
        return;
    }

    // 404.html, or 40x.html, or 4xx.html, or error.html
    $templates = array(
        'errors/'.$code.'.html.twig',
        'errors/'.substr($code, 0, 2).'x.html.twig',
        'errors/'.substr($code, 0, 1).'xx.html.twig',
        'errors/default.html.twig',
    );

    return new Response($app['twig']->resolveTemplate($templates)->render(array('code' => $code)), $code);
});
