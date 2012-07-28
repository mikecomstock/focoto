class Focoto.Models.Board extends Backbone.Model
  paramRoot: 'board'
  urlRoot: '/boards'

  defaults:
    name: null

class Focoto.Collections.BoardsCollection extends Backbone.Collection
  model: Focoto.Models.Board
  url: '/boards'
