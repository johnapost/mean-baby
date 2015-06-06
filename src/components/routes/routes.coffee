app.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider
      .when '/', {templateUrl: 'posts.html'}
      .when '/register', {templateUrl: 'register.html'}
      .when '/login', {templateUrl: 'login.html'}
]
