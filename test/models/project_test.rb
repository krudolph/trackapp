require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'should not save without a name' do
    project = projects(:tree)
    project.name = ''
    assert !project.valid?, 'Saves without a name'
    assert_equal 'Please provide a name', project.errors[:name].first, 'Does not throw an error message'
  end

  test 'should destroy all dependend tasks and logs' do
    project = projects(:tree)
    assert_equal 1, project.tasks.size
    assert_equal 2, project.tasks.first.logs.size
    project.destroy
    assert_raises ActiveRecord::RecordNotFound do
      tasks(:finished)
    end
    assert_raises ActiveRecord::RecordNotFound do
      logs(:long)
    end
    assert_raises ActiveRecord::RecordNotFound do
      logs(:hour)
    end
  end

  test 'should calculate the logged time correctly' do
    assert_equal 9296, projects(:tree).logged, 'Does not calculate the logged time correctly'
  end

end
