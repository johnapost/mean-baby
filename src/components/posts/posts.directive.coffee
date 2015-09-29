app.directive 'posts', [
  'Post'
  'User'
  'Socket'
  (Post, User, Socket) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      Post.getPosts().success (data) ->
        scope.posts = data

      scope.addPost = ->
        if scope.postBody
          input =
            userId: User.currentUser._id
            body: scope.postBody

          Post.addPost input
          scope.postBody = null

      # Live update
      Socket.on 'post.created', (post) ->
        scope.posts.unshift
          _user: username: post._user.username
          body: post.body
]
