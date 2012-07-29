Focoto.Views.Boards ||= {}

class Focoto.Views.Boards.Fluid extends Backbone.View

  initialize: ->
    _.bindAll this
    @render()
    $(window).resize @render
    @collection.on 'add', @postAdd, @

  postAdd: (post) ->
    slide = $(_.template(@t, { p: post.attributes }))
    shortestColumn = @columns.first()
    shortestHeight = shortestColumn.height()

    @columns.each (i, c) ->
      console.log i, c
      column = $(c)
      height = column.height()
      console.log 'column', column, height
      if height < shortestHeight
        shortestColumn = column
        shortestHeight = height

    slide.prependTo shortestColumn

  t: '<div class="post">
    <img src="<%= p.photo_info.medium %>"/>
    <p class="caption"><%= p.from_name %>: <%= p.subject %></p>
  </div>'

  colWidth: 300
  columns: []

  render: ->
    @$el.empty()
    @columns.length = 0
    containerWidth = @$el.width()
    numCols = Math.max(Math.floor(containerWidth / @colWidth), 1)
    totalColWidth = numCols * @colWidth
    totalMarginWidth = containerWidth - totalColWidth
    numMargins = numCols + 1
    @marginWidth = Math.max(Math.floor(totalMarginWidth / numMargins), 0)

    @createColumn num for num in [1..numCols]
    @columns = @$('.column')
    
    console.log 'adding posts'
    @postAdd post for post in @collection.models
    

  createColumn: (i) ->
    column = $('<div class="column">').appendTo(@$el)
    column.css('width', @colWidth)
    column.css('margin-left', @marginWidth)

    


