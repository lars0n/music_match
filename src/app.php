<?php
use Controller\AjaxController;
use Controller\DashboardController;
use Controller\MusicController;
use Controller\ProfileController;
use Controller\UserController;
use Repository\DashboardRepository;
use Repository\ProfileRepository;
use Repository\SearchRepository;
use Repository\UserRepository;
use Service\UserManager;
use Silex\Application;
use Silex\Provider\AssetServiceProvider;
use Silex\Provider\DoctrineServiceProvider;
use Silex\Provider\FormServiceProvider;
use Silex\Provider\HttpFragmentServiceProvider;
use Silex\Provider\LocaleServiceProvider;
use Silex\Provider\ServiceControllerServiceProvider;
use Silex\Provider\SessionServiceProvider;
use Silex\Provider\TranslationServiceProvider;
use Silex\Provider\TwigServiceProvider;
use Silex\Provider\ValidatorServiceProvider;
use SpotifyWebAPI\Session;
use SpotifyWebAPI\SpotifyWebAPI;
$app = new Application();
$app->register(new ServiceControllerServiceProvider());
$app->register(new AssetServiceProvider());
$app->register(new TwigServiceProvider(),
        [
            'twig.form.templates' => [
                'bootstrap_3_layout.html.twig'
            ]
        ]
    );
$app->register(new HttpFragmentServiceProvider());
$app['twig'] = $app->extend('twig', function ($twig, $app) {
    // add custom globals, filters, tags, ...
    $twig->addGlobal('user_manager', $app['user.manager']);
    
    // function gravatar
    $function = new Twig_SimpleFunction('get_gravatar', function ($email, $s = 80, $d = 'mm', $r = 'g', $img = false, $atts = array() ) {
        $url = 'https://www.gravatar.com/avatar/';
        $url .= md5(strtolower(trim($email)));
        $url .= "?s=$s&d=$d&r=$r";
        if ($img) {
            $url = '<img src="' . $url . '"';
            foreach ($atts as $key => $val)
                $url .= ' ' . $key . '="' . $val . '"';
            $url .= ' />';
        }
        return $url;
    });
    $twig->addFunction($function);
    
    return $twig;
});
$app->register(
    new DoctrineServiceProvider(),
        [
            'db.options' => [
                'driver' => 'pdo_mysql',
                'host' => 'localhost',
                'dbname' => 'bdd_projet',
                'user' => 'root',
                'password' => '',
                'charset' => 'utf8'
            ]
        ]
);
// $app['session'] = gestionnaire de session de symfony
$app->register(new SessionServiceProvider());
$app->register(new FormServiceProvider());
$app->register(new LocaleServiceProvider());
$app->register(new ValidatorServiceProvider());
$app->register(new TranslationServiceProvider(), array(
/*    'translator.domains' => [
        'messages' => [
            'en' => [
                'Email' => 'email'
            ]
        ]
    ],
*/
    'locale' => 'fr'
));
// ----------------- Controller ----------------- //
            
$app['user.controller'] = function() use($app){
    return new UserController($app);
};          
     
$app['profile.controller'] = function() use($app){
    return new ProfileController($app);
};
     
$app['dashboard.controller'] = function() use($app){
    return new DashboardController($app);
}; 
$app['music.controller'] = function() use($app){
    return new MusicController($app);
};
$app['ajax.controller'] = function() use($app){
    return new AjaxController($app);
};
$app['search.controller'] = function() use($app){
    return new Controller\SearchController($app);
};
// ----------------- Repository ----------------- //
$app['user.repository'] = function() use($app){
    return new UserRepository($app);
};
$app['profile.repository'] = function() use($app){
    return new ProfileRepository($app);
};
$app['dashboard.repository'] = function() use($app){
    return new DashboardRepository($app);
};
$app['search.repository'] = function() use($app){
    return new SearchRepository($app);
};
// ----------------- Manager ----------------- //
$app['user.manager'] = function() use($app){
    return new UserManager($app['session']);
};
// ----------------- Service API Spotify ----------------- //
$app['spotify.api'] = function(){
    
    $session = new Session(
    '5caab53bc299402b84905322f4f2ab39', // Clé API public
    '0e0be2067ee84c0daeb725eda774164e' // Clé API privée
    );
    
    $api = new SpotifyWebAPI();
    
    // demande acces
    $session->requestCredentialsToken();
    $accessToken = $session->getAccessToken();
    // Set the code on the API wrapper
    $api->setAccessToken($accessToken);
    
    return $api;
};
return $app;