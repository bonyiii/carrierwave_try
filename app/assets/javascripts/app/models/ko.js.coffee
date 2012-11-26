class window.ViewModel
  constructor: ->
    @firstName = ko.observable('Bob')
    @title = ko.observable('Smith')
    @fullName = ko.computed
      read: -> "#{@firstName()} #{@title()}"
      write: (value) ->
        lastSpacePos = value.lastIndexOf(" ")
        if lastSpacePos > 1
          @firstName(value.substring(0, lastSpacePos))
          @title(value.substring(lastSpacePos + 1))
      owner: @
