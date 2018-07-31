# frozen_string_literal: true

require 'i_login_service'

class LoginService < ILoginService
  def validate_user(username, password)
    user = User.find_by username: username

    return false if user.nil?

    user.password == password
  end
end
