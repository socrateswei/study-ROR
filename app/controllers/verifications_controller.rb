class VerificationsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create, :new]
  respond_to :json
  def new
  end
  def create
    user = User.find_by(:email => params[:email])
    return invalid_login unless user
    if user.valid_password?(params[:password])
      user.save if !user.authentication_token.present?
      sign_in(user)
      render :json => { user: { email: user.email, :auth_token => user.authentication_token } }, success: true, status: :created
    else
      return invalid_login
    end
  end
  def destroy
    user = User.find_by(:email => request.headers['X-API-EMAIL'])
    return invalid_login unless user
    if user.authentication_token == request.headers['X-API-TOKEN']
      user.reset_authentication_token!
      render :json => {message: 'Logout!'}, :success => true, :status => 200
    else
      return invalid_login
    end
  end

  protected

  def invalid_login
    render :json => {message: 'Invalid email or password/token'}, :status => 401
  end
end
