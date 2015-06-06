app.factory 'User', [
  '$http'
  '$rootScope'
  ($http, $rootScope) ->
    path = window.location.origin.replace ':4000', ':3000'

    factory =
      getUser: ->
        $http.get(
          "#{path}/api/users"
          headers:
            'X-Auth': factory.token
        ).success (data) ->
          $rootScope.$broadcast 'login', data

      login: (username, password) ->
        $http.post(
          "#{path}/api/sessions"
          {
            username: username
            password: password
          }
        ).then (val) ->
          factory.token = val.data
          factory.getUser()
]
