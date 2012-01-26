# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#project_customer_name').autocomplete
    source: $('#project_customer_name').data('autocomplete-source')

  $( "#dialog" ).dialog({
    autoOpen: false,
    height: 420,
    width: 880,
    modal: true,
    show: "slide",
    hide: "slide",
    resizable: false,
    draggable: false
  })
  $('#cliente_perfil').click ->
    $('#dialog').dialog( "open" )
    return false


