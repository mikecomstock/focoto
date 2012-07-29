Focoto.Views.Boards ||= {}

class Focoto.Views.Boards.Slideshow extends Backbone.View

  initialize: () ->
    @collection.on 'add', @postAdd, @

  postAdd: (post) ->
    console.log 'add', post
    console.log @$el

  t: '<div class="slide">
    <img src="<%= p.photo_info.medium %>"/>
    <p>id: <%= p.id %> subject: <%= p.subject %></p>
  </div>'

  render: ->
    index = Math.floor(Math.random()*@collection.length)
    post = @collection.at(index)
    html = $(_.template(@t, { p: post.attributes }))
    @$el.html html
