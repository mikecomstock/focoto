Focoto.Views.Boards ||= {}

class Focoto.Views.Boards.Fluid extends Backbone.View

  initialize: () ->
    @collection.on 'add', @postAdd, @

  postAdd: (post) ->
    slide = $(_.template(@t, { p: post.attributes }))
    slide.prependTo @$el

  t: '<div class="post">
    <img src="<%= p.photo_info.medium %>"/>
    <p class="caption">id: <%= p.id %> subject: <%= p.subject %></p>
  </div>'

  render: ->
    index = Math.floor(Math.random()*@collection.length)
    return if !post
    post = @collection.at(index)
    slide = $(_.template(@t, { p: post.attributes }))
    console.log slide
    slide.prependTo $el
