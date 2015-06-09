app.factory 'User', [
  '$http'
  '$rootScope'
  '$window'
  '$location'
  ($http, $rootScope, $window, $location) ->
    path = $window.location.origin.replace ':4000', ':3000'

    factory =
      createUser: (username, password) ->
        $http.post(
          "#{path}/api/users"
          {
            username: username
            password: password
          }
        ).then ->
          factory.login username, password

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
        ).then (val) ->
          $window.localStorage.token = val.data
          $http.defaults.headers.common['X-Auth'] = val.data
          factory.getUser().success (data) ->
            factory.currentUser = data
            $rootScope.$broadcast 'getUser'
            $location.path '/'

      logout: ->
        $window.localStorage.removeItem 'token'
        factory.currentUser = undefined
        $http.defaults.headers.common['X-Auth'] = undefined
        $rootScope.$broadcast 'logout'
]
