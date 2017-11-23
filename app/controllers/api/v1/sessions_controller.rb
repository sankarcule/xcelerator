class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action :require_login, only: [:create, :register], raise: false

  # Login
  #
  # @query_parameter [string] email
  # @query_parameter [string] password
  # @response_class UserSerializer
  def create
    if user = User.valid_login?(params[:email], params[:password])
      generate_token(user)
      send_token_to_user(user)
    else
      render_unauthorized("Error with your login or password")
    end
  end

  # Logout
  #
  # @query_parameter [string] token
  # @response_class UserSerializer
  def destroy
    begin
      logout(params[:token])
    rescue
      json_response(message: 'Token invalid')
    else
      json_response(message: 'Logged out succeessfully')
    end
  end

  # Register user
  #
  # @query_parameter [string] email
  # @query_parameter [string] password
  # @response_class UserSerializer
  def register
    user = User.find_by_email(params[:email])
      if user
        json_response(message: 'User already present')
      else
        user_new = User.new(email: params[:email], password: params[:password], full_name: params[:full_name])
        user_new.save!
        generate_token(user_new)
        send_token_to_user(user_new)
      end
  end

  private

    def send_token_to_user(user)
      token = user.api_keys.last.token
      json_response(token: token)
    end

    def generate_token(user)
      ApiKey.create(user_id: user.id, token: SecureRandom.base58)
    end

    def logout(token)
        ApiKey.find_by(token: token).invalidate_token
    end
end
