<% if @project.valid? %>

$('.tabs li').removeClass 'last'
$('.tabs').append '<li class=\"last\"><%= j(render @project) %></li>'
notice $('.project-<%= @project.id %>'), '#eaeaae'
$('.tabs input').val ''

<% else %>

notice $('.tabs input'), '#ff6666'
$('.tabs input').val ''
$('.tabs input').attr 'placeholder', '<%= @project.errors[:name].first %>'

<% end %>
