class PlurksController < ApplicationController
  before_action :set_plurk, only: [:destroy, :update, :edit]
  def index
    @plurks = Plurk.all
  end
  def new
    @plurk = Plurk.new
  end
  def create
    @plurk = Plurk.new(plurk_params)
    if @plurk.save
      redirect_to plurks_path
    else
      render :new
    end
  end
  def destroy
    @plurk.destroy
    redirect_to plurks_path
  end
  def update
    @plurk.update(plurk_params)
    redirect_to plurks_path
  end
  def plurk_params
    params.require(:plurk).permit(:name,:content)
  end
  def set_plurk
    @plurk = Plurk.find(params[:id])
  end

end
