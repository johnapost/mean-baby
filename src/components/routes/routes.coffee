app.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'posts.html'
        requiresLogin: true
      .when '/register',
        templateUrl: 'register.html'
        requiresLogin: false
      .when '/login',
        templateUrl: 'login.html'
        requiresLogin: false
      .otherwise redirectTo: '/'
]

app.run [
  '$rootScope'
  '$location'
  '$window'
  'User'
  ($rootScope, $location, $window, User) ->
    User.getUser() if 'token' of $window.localStorage

    $rootScope.$on '$routeChangeStart', (event, next) ->
      if next.requiresLogin
        $location.path '/register' unless User.currentUser
]
