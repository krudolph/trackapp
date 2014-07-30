require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test 'should create a new task' do
    assert_difference('Task.count') do
      xhr :post, :create, project_id: 1, name: 'A test task', format: :js
    end
    assert_response :success
    assert_not_nil assigns(:task)
    assert_template 'tasks/create'
  end

  test 'should close a task' do
    task = tasks(:unfinished)
    xhr :get, :finish, id: 2, format: :js
    assert task.reload.done?
    assert_response :success
    assigns(:task) == task
    assert_template 'tasks/refresh'
  end

  test 'should delete a task' do
    deleted = tasks(:finished)
    assert_difference('Task.count', -1) do
      xhr :delete, :destroy, id: 1, format: :js
    end
    assert_response :success
    assigns(:task) == deleted
    assert_template 'tasks/destroy'
  end

  test 'should create a new log on start' do
    assert_difference('tasks(:finished).logs.size') do
      xhr :get, :start, id: 1, format: :js
    end
    assert_response :success
    assigns(:task) == tasks(:finished)
    assigns(:log) == tasks(:finished).logs.last
    assert_template 'tasks/refresh'
  end

  test 'should update a log on stop' do
    xhr :get, :stop, id: 1, format: :js
    assert_response :success
    assert !tasks(:finished).logs.last.stop.nil?
    assigns(:task) == tasks(:finished)
    assigns(:log) == tasks(:finished).logs.last
    assert_template 'tasks/refresh'
  end

end
