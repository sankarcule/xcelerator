class Api::V1::ApiController < ApplicationController
  include Response

  def require_login
    authenticate_token || render_unauthorized("Access denied")
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

    def render_unauthorized(message)
      errors = { errors: [ { detail: message } ] }
      json_response(errors, :unauthorized)
    end

  private

    def authenticate_token
      api = ApiKey.find_by(token: params[:token])
      if api && !api.expired?
        User.find(api.user_id)
      else
        false
      end
    end
end
