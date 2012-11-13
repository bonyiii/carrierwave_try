class window.ViewModel
  constructor: ->
    @firstName = ko.observable('Bob')
    @lastName = ko.observable('Smith')
    @fullName = ko.computed => "#{@firstName()} #{@lastName()}"
