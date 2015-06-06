app.directive 'login', [
  'User'
  (User) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.login = (username, password) ->
        User.login username, password
]
