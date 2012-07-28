class Focoto.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    url_medium: null

class Focoto.Collections.PostsCollection extends Backbone.Collection
  model: Focoto.Models.Post
  url: '/posts'
