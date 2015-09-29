app.factory 'User', [
  '$http'
  '$rootScope'
  '$window'
  '$location'
  ($http, $rootScope, $window, $location) ->
    path = $window.location.origin.replace ':4000', ':3000'

    currentUser: ''

    createUser: (username, password) ->
      $http.post(
        "#{path}/api/users"
        {
          username: username
          password: password
        }
      ).then =>
        @login username, password

    getUser: ->
      $http.get(
        "#{path}/api/users"
        headers:
          'X-Auth': $window.localStorage.token
      )

    login: (username, password) ->
      $http.post(
        "#{path}/api/sessions"
        {
          username: username
          password: password
        }
      ).then (val) =>
        $window.localStorage.token = val.data
        $http.defaults.headers.common['X-Auth'] = val.data
        @getUser().success (data) ->
          @currentUser = data
          $rootScope.$broadcast 'getUser'
          $location.path '/'

    logout: ->
      $window.localStorage.removeItem 'token'
      @currentUser = undefined
      $http.defaults.headers.common['X-Auth'] = undefined
      $rootScope.$broadcast 'logout'
]
