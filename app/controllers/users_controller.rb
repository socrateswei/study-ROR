class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_current_user, :only => [:follow, :unfollow]
  def show
    @user = User.find(params[:id])
  end
  def find_user
    @user = User.find_for_authentication(:email => params[:email])
  end
  def follow
    @relationship = @user.relationships.new(follow_params)
    if @relationship.save
      redirect_to root_path
    else
      redirect_to find_user_path
    end
  end
  def unfollow
    @relationship = @user.relationships.where(:followed_id => params[:users])
    if @relationship.destroy_all
      redirect_to user_path(current_user)
    else
      redirect_to :back, alert: "You can't unfollow this guy!"
    end
  end
  private
  def get_current_user
    @user = current_user
  end
  def follow_params
    params.permit(:followed_id)
  end
end
