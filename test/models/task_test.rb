require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test 'should not save without a project' do
    task = tasks(:finished)
    task.project = nil
    assert !task.valid?, 'Saves without a project'
  end

  test 'should not save without a name' do
    task = tasks(:finished)
    task.name = ''
    assert !task.valid?, 'Saves without a name'
    assert_equal 'Please provide a name', task.errors[:name].first, 'Does not throw an error message'
  end

  test 'should calculate the logged time correctly' do
    assert_equal 9296, tasks(:finished).logged, 'Does not calculate the logged time correctly'
  end

  test 'should return the correct work status' do
    assert !tasks(:finished).work?, 'Does not return work status'
    assert tasks(:unfinished).work?, 'Does not return work status'
  end

end
