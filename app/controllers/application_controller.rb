class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:bc][:basic_auth_user] && password == Rails.application.credentials[:bc][:basic_auth_password]
    end
  end
end

