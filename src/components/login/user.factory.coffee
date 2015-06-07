app.factory 'User', [
  '$http'
  '$rootScope'
  ($http, $rootScope) ->
    path = window.location.origin.replace ':4000', ':3000'

    factory =
      setUser: ->
        $http.get(
          "#{path}/api/users"
          headers:
            'X-Auth': factory.token
        ).success (data) ->
          factory.username = data.username
          $rootScope.$broadcast 'setUser'

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
          factory.setUser()
]
