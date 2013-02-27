class TasksController < ApplicationController

  def create
    @task = Project.find(params[:project_id]).tasks.create(name: params[:name])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def finish
    @task = Task.find(params[:id])
    @task.update(done: true)
    render :refresh
  end

  def start
    @task = Task.find(params[:id])
    @log = Log.create(task: @task, start: Time.now)
    render :refresh
  end

  def stop
    @task = Task.find(params[:id])
    @log = @task.logs.first.update(stop: Time.now)
    render :refresh
  end

end
