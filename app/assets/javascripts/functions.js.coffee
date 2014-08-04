@notice = (element, color) ->
  element.animate {backgroundColor: color}, 800
  element.animate {backgroundColor: "#fff"}, 800

@toggable = (parent) ->
  parent.find('.show-logs').on 'click', ->
    $(this).parents('.task:first').find('.task-logs').toggle 'slow'

$ ->
  for task in $('.task')
    toggable $(task)
