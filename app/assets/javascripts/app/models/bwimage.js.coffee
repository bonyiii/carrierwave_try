class App.Bwimage extends Spine.Model
  @configure 'Bwimage', 'title', 'camera', 'taken_at', 'author', 'status', 'url', 'file'
  @extend Spine.Model.Ajax

  @url: "/bwimages"

  url: ->
    "/api/bwimages/#{@id}"

  koBinds: ->
    @titleObs = ko.observable(@title)
    @cameraObs = ko.observable(@camera)
    @fullName = ko.computed
      read: -> "#{@title} #{@camera}"
      write: (value) ->
        lastSpacePos = value.lastIndexOf(" ")
        if lastSpacePos > 1
          #@updateAttribute('title',value.substring(0, lastSpacePos))
          #@updateAttribute('camera',value.substring(lastSpacePos + 1))
          @title = value.substring(0, lastSpacePos)
          @camera = value.substring(lastSpacePos + 1)
      owner: @
