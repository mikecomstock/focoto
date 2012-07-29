Focoto.Views.Boards ||= {}

class Focoto.Views.Boards.Fluid extends Backbone.View

  initialize: ->
    _.bindAll this
    @render()
    $(window).resize @render
    @collection.on 'add', @postAdd, @

  postAdd: (post) ->
    slide = $(_.template(@t, { p: post.attributes }))
    minHeight = _.min(@columnHeights)
    minIndex = _.indexOf @columnHeights, minHeight
    shortestColumn = @columns.get(minIndex)

    slide.css 'opacity', 0
    slide.prependTo shortestColumn
    # TODO: this doesn't work because the image isn't loaded yet
    @columnHeights[minIndex] += slide.outerHeight()
    slide.css 'opacity', 1

  t: '<div class="post">
    <img src="<%= p.photo_info.medium %>"/>
    <p class="caption"><%= p.from_name %><strong><%= p.subject ? ": " + p.subject : "" %></strong></p>
  </div>'

  colWidth: 300
  columns: []
  columnHeights: []

  render: ->
    @$el.empty()
    @columns.length = 0
    @columnHeights.length = 0

    containerWidth = @$el.width()
    numCols = Math.max(Math.floor(containerWidth / @colWidth), 1)
    totalColWidth = numCols * @colWidth
    totalMarginWidth = containerWidth - totalColWidth
    numMargins = numCols + 1
    @marginWidth = Math.max(Math.floor(totalMarginWidth / numMargins), 0)

    @createColumn num for num in [1..numCols]
    @columns = @$('.column')
    @postAdd post for post in @collection.models

  createColumn: (i) ->
    column = $('<div class="column">').appendTo(@$el)
    @columnHeights.push 0
    column.css('width', @colWidth)
    column.css('margin-left', @marginWidth)
