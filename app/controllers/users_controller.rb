class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, :only => [:show]
  respond_to :html, :json, :only => [:show]
  def show
  end
  def find_user
    @user = User.find_for_authentication(:email => params[:email])
  end
  def follow
    @subscription = current_user.subscriptions.new(:following_id => params[:following_id])
    if @subscription.valid?
      @subscription.save
      redirect_to root_path
    else
      redirect_to find_user_path, alert: @subscription.errors.messages[:user_id]
    end
  end
  def unfollow
    @subscription = current_user.subscriptions.where(:following_id => params[:following_id])
    if @subscription.destroy_all
      redirect_to user_path(current_user)
    else
      redirect_to :back, alert: "You can't unfollow this guy!"
    end
  end
  def followings
    @users = current_user.followings
    if @users.empty?
      respond_to do |format|
        format.json {render json: {message: 'No followings'} }
      end
    end
  end
  def followers
    @users = current_user.followers
    if @users.empty?
      respond_to do |format|
        format.json {render json: {message: 'No followers'} }
      end
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
