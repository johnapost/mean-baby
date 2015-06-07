app.directive 'login', [
  'User'
  (User) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.login = (username, password) ->
        User.login username, password

      scope.register = (username, password) ->
        User.createUser username, password
]
