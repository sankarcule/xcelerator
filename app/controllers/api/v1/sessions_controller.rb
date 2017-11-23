class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action :require_login, only: [:create, :register], raise: false

  def create
    if user = User.valid_login?(params[:email], params[:password])
      generate_token(user)
      send_token_to_user(user)
    else
      render_unauthorized("Error with your login or password")
    end
  end

  def destroy
    authenticate_with_http_token do |token, options|
      logout(token)
      head :ok
    end
  end

  def register
    user = User.find_by_email(params[:email])
      if user
        json_response("User already present", :unauthorized)
      else
        user = User.new(email: params[:email], password: params[:password], full_name: params[:full_name])
        user.save!
        generate_token(user)
        send_token_to_user(user)
      end
  end

  private

    def send_token_to_user(user)
      token = user.api_keys.last.token
      json_response(token)
    end

    def generate_token(user)
      ApiKey.create(user_id: user.id)
    end

    def logout(token)
      ApiKey.find_by(token: token).invalidate_token
    end
end
