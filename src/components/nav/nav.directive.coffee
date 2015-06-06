app.directive 'nav', [
  ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.currentUser = {}

      scope.$on 'login', (broadcasted_scope, data) ->
        scope.currentUser.username = data.username
]
