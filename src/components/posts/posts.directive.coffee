app.directive 'posts', [
  'Post'
  'User'
  (Post, User) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      Post.getPosts().success (data) ->
        scope.posts = data

      scope.addPost = ->
        if scope.postBody

          input =
            username: User.username
            body: scope.postBody

          Post.addPost(input).success (data) ->
            scope.posts.unshift input

          scope.postBody = null
]
