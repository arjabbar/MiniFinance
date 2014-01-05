class AuthenticatedController < ApplicationController

  def login
    return head :unauthorized unless authenticate!
    render json: @current_user.session, status: :ok
  end

  def authenticate!
    if verify_params && verify_credentials
      extend_user_session
      set_new_token
      return save_changes
    end
    head :unauthorized
  end

  private

  def verify_params
    @token = params[:token] || api_token
    @email = params[:email]
    @password = params[:password]
    @current_user = User.find_by(token: @token) || User.find_by(email: @email)
  end

  def verify_credentials
    @authenticated_using_token = @current_user.authenticate_with_token @token
    @authenticated_using_password = @current_user.authenticate @password
    @authenticated_using_token || @authenticated_using_password
  end

  def extend_user_session
    @current_user.extend_session
  end

  def set_new_token
    if @authenticated_using_password
      @token = generate_new_token
      @current_user.assign_attributes token: @token
    end
    set_token_in_header @token
  end

  def generate_new_token
    new_token = nil
    begin
      new_token = SecureRandom.hex
    end while User.exists? token: new_token
    new_token
  end

  def set_token_in_header token
    response.headers[MiniFinance::Application::Constants::API_TOKEN_HEADER_KEY] = token
  end

  def api_token
    env['HTTP_' + MiniFinance::Application::Constants::API_TOKEN_HEADER_KEY]
  end

  def save_changes
    @current_user.save
  end

end
