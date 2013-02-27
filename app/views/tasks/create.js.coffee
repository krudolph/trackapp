<% if @task.valid? %>

$('.taskpane').prepend '<%= j(render @task) %>'
notice $('.task-<%= @task.id %>'), '#eaeaae'
$('.task-create #name').val ''

<% else %>

notice $('.task-create #name'), '#ff6666'
$('.task-create #name').val ''
$('.task-create #name').attr 'placeholder', '<%= @task.errors[:name].first %>'

<% end %>
