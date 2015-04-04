class UsersController < ApplicationController
  before_filter :authenticate_user!
  def find_user
    @user = User.find_for_authentication(:email => params[:email])
  end
end
