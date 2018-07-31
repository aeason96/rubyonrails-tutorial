# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save new user without username and password' do
    user = User.new

    did_save = user.save

    assert_not did_save
  end

  test 'should save a new user given username and password' do
    user = User.new
    user.username = 'Andrew'
    user.password = 'eason123'

    did_save = user.save

    assert did_save
  end
end
