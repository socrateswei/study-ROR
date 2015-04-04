class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = current_user
  end
  def find_user
    @user = User.find_for_authentication(:email => params[:email])
  end
  def follow
    @user = current_user
    @relationship = @user.relationships.new(follow_params)
    if @relationship.save
      redirect_to root_path
    else
      redirect_to find_user_path
    end
  end
  private
  def follow_params
    params.permit(:followed_id)
  end
end
