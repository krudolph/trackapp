require 'test_helper'

class LogsHelperTest < ActionView::TestCase

  test 'should format logged time' do
    assert_equal '01:00:00', format_logged(3600), 'Does not format logged time'
    assert_equal '34:17:36', format_logged(123456), 'Does not format logged time'
  end

end
