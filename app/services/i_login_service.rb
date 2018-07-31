# frozen_string_literal: true

class ILoginService
  def validate_user(_username, _password)
    raise NotImplementedError
  end
end
