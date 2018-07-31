# frozen_string_literal: true

require 'test_helper'

class LoginServiceTest < ActiveSupport::TestCase
  setup do
    @login_service = LoginService.new
  end

  test 'should return false if validate_user given bad username' do
    username = 'doesntexist'
    password = 'nada'

    did_validate = @login_service.validate_user(username, password)

    assert_not did_validate
  end

  test 'should return true when valid username and password given' do
    username = 'andrew'
    password = 'eason'

    did_validate = @login_service.validate_user(username, password)

    assert did_validate
  end

  test 'should return false if password is wrong' do
    username = 'andrew'
    password = 'false'

    did_validate = @login_service.validate_user(username, password)

    assert_not did_validate
  end
end
