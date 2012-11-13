class App.Bwimage extends Spine.Model
  @configure 'Bwimage', 'title', 'camera', 'taken_at', 'author', 'status', 'url', 'file'
  @extend Spine.Model.Ajax

  @url: "/bwimages"

  url: ->
    "/api/bwimages/#{@id}"
