app.directive 'nav', [
  'User'
  (User) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.currentUser =
        username: User.username

      scope.$on 'getUser', ->
        scope.currentUser.username = User.username
]
