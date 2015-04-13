class PlurksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plurk, only: [:destroy, :update, :edit, :reply, :create_reply]
  def index
    @plurks = current_user.plurks
    current_user.followings.each do |user|
      @plurks += user.plurks
    end
  end
  def new
    @plurk = Plurk.new
  end
  def create
    @plurk = current_user.plurks.new(plurk_params)
    if @plurk.save
      redirect_to root_path
    else
      render :new
    end
  end
  def destroy
    if @plurk.user == current_user
      @plurk.destroy
      redirect_to root_path
    else
      redirect_to root_path, alert: "permission denied!"
    end
  end
  def update
    if @plurk.user == current_user
      @plurk.update(plurk_params)
      redirect_to root_path
    else
      redirect_to root_path, alert: "permission denied!"
    end
  end
  def reply
    @reply = Reply.new
  end
  def create_reply
    @reply = @plurk.replies.new(reply_params)
    if @reply.save
      redirect_to root_path
    else
      render :reply
    end
  end

  private
  def plurk_params
    params.require(:plurk).permit(:content)
  end
  def reply_params
    params.require(:reply).permit(:plurk_id,:content).merge(user: current_user)
  end
  def set_plurk
    @plurk = Plurk.find(params[:id])
  end

end
