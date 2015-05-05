app.directive 'posts', [
  ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.posts = [
        {username: 'johnapost', body: 'Node rules!'}
        {username: 'aimwill', body: 'jQuery rules!'}
      ]

      scope.addPost = ->
        if scope.postBody
          scope.posts.unshift
            username: 'johnapost'
            body: scope.postBody

          scope.postBody = null
]