require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test 'full title helper' do
        assert_equal full_title, 'MY PAGE'
        assert_equal full_title("Help"), 'Help | MY PAGE'
    end
end
