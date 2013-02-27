<% if !@deleted.nil? %>

notice $('.project-<%= @deleted.id %>'), '#ff6666'
$('.project-<%= @deleted.id %>').hide 'slow'
$('.tabs li:last-child').prev('li').addClass 'last'
notice $('.project-<%= @project.id %>'), '#fff68f'

<% end %>

$('.taskpane').replaceWith '<div class="taskpane"><%= j(render @project.tasks) %></div>'
$('.tabs li').removeClass 'active'
$('.project-<%= @project.id %>').parents('li:first').addClass 'active'
$('.task-create #project_id').val '<%= @project.id %>'
$('.project-delete').attr 'href', '<%= project_path(id: @project.id, format: 'js') %>'
$('.project-time').html '<%= j(format_logged(@project.logged)) %>'

toggable $('.task')
