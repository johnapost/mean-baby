app.directive 'session', [
  'User'
  (User) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.login = (username, password) ->
        User.login username, password

      scope.logout = ->
        User.logout()

      scope.register = (username, password) ->
        User.createUser username, password
]
