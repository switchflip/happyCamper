# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready =>
  #list filter
    $('.search-query').keyup ->
        filter = $(this).val()
        if filter == ''
            $('.table').find("tr").show()
        if filter.length
            console.log(filter)
            $('.table').find("tr .name:not(:Contains(" + filter + "))").parent().hide()
            $('.table').find("tr .name:Contains(" + filter + ")").parent().show()
        return
return
