class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def provider
    super
    "code"
  end
end
