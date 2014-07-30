require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  test 'should get project index' do
    get :index
    assert_response :success
    assigns(:project) == projects(:tree)
    assigns(:projects) == projects
    assert_template 'projects/index'
  end

  test 'should get project' do
    xhr :get, :show, id: 1, format: :js
    assert_response :success
    assigns(:project) == projects(:tree)
    assert_template 'projects/show'
  end

  test 'should create a new project' do
    assert_difference('Project.count') do
      xhr :post, :create, name: 'A test project', format: :js
    end
    assert_response :success
    assert_not_nil assigns(:project)
    assert_template 'projects/create'
  end

  test 'should delete a project' do
    deleted = projects(:tree)
    assert_difference('Project.count', -1) do
      xhr :delete, :destroy, id: 1, format: :js
    end
    assert_response :success
    assigns(:deleted) == deleted
    assigns(:project) == projects(:car)
    assert_template 'projects/show'
  end

end
