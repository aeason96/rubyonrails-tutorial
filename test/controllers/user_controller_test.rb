# frozen_string_literal: true

require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'user is not created if username and password not provided' do
    new_user = User.new
    assert_not new_user.save
  end
end
