app.factory 'User', [
  '$http'
  '$rootScope'
  ($http, $rootScope) ->
    path = window.location.origin.replace ':4000', ':3000'

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
            'X-Auth': factory.token
        ).success (data) ->
          factory.username = data.username
          $rootScope.$broadcast 'getUser'

      login: (username, password) ->
        $http.post(
          "#{path}/api/sessions"
          {
            username: username
            password: password
          }
        ).then (val) ->
          factory.token = val.data
          $http.defaults.headers.common['X-Auth'] = val.data
          factory.getUser()
]
