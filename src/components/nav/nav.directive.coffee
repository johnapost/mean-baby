app.directive 'nav', [
  'User'
  (User) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.currentUser =
        username: User.username

      scope.$on 'setUser', ->
        scope.currentUser.username = User.username
]
