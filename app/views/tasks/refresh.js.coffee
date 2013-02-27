$('.logs-<%=@task.id%>').parents('.task:first').replaceWith '<%= j(render @task) %>'
notice $('.task-<%= @task.id %>'), '#fff68f'
$('.project-time').html '<%= j(format_logged(@task.project.logged)) %>'
notice $('.project-time'), '#fff68f'
toggable $('.task-<%=@task.id%>')
