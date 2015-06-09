# Routes
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

# Authentication
app.run [
  '$rootScope'
  '$location'
  '$window'
  '$http'
  'User'
  ($rootScope, $location, $window, $http, User) ->

    # Use token as auth header for each request
    if 'token' of $window.localStorage
      $http.defaults.headers.common['X-Auth'] = $window.localStorage.token

    # Redirect to safe page if necessary
    protectRoutes = ->

      # Redirect to safe page if no token present
      return $location.path '/register' unless 'token' of $window.localStorage

      # Redirect to safe page if the token is invalid
      User.getUser().error (message, code) ->
        $location.path '/register' if code is 401 or code is 500
      .success (data) ->
        User.currentUser = data
        $rootScope.$broadcast 'getUser'

    protectRoutes()

    $rootScope.$on '$routeChangeStart', (event, next) ->

      # Check if the route requires login protection
      protectRoutes() if next.requiresLogin
]
