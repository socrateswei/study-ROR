class PlurksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plurk, only: [:destroy, :update, :edit, :reply, :create_reply]
  respond_to :html, :josn
  def index
    @plurks = current_user.plurks.order(created_at: :desc)
  end
  def new
    @plurk = Plurk.new
  end
  def create
    @plurk = current_user.plurks.new(plurk_params)
    if @plurk.valid?
      @plurk.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @plurk, :success => true }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: {message: 'Error: Invaild params'} }
      end
    end
  end
  def show
    @plurks = Plurk.where(user_id: [current_user.id, current_user.following_ids], id: params[:id]).order(created_at: :desc)
    if !@plurks.present?
      respond_to do |format|
        format.html { redirect_to plurks_path, alert: "No such Plurk"}
        format.json { render json: {message: 'No such Plurk'} }
      end
    end
  end
  def destroy
    if @plurk.user == current_user
      @plurk.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json {render json: {message: 'Deleted plurk'}}
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "permission denied!" }
        format.json { render json: {message: 'permission denied!'} }
      end
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
