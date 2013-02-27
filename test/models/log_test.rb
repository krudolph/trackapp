require 'test_helper'

class LogTest < ActiveSupport::TestCase

  test 'should save without a stop time' do
    assert logs(:running).valid?, 'Does not save without a stop time'
  end

  test 'should not save without a task' do
    log = logs(:hour)
    log.task = nil
    assert !log.valid?, 'Saves without a task'
  end

  test 'should return the correct duration' do
    assert_equal 3600, logs(:hour).duration, 'Does not calculate duration right'
    assert_equal 670, logs(:minutes).duration, 'Does not calculate duration right'
  end

end
