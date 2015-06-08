app.directive 'session', [
  'User'
  '$window'
  (User, $window) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      User.getUser() if 'token' of $window.localStorage

      scope.login = (username, password) ->
        User.login username, password

      scope.logout = ->
        User.logout()

      scope.register = (username, password) ->
        User.createUser username, password
]
