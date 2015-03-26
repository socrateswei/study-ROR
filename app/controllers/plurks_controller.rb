class PlurksController < ApplicationController
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
  def plurk_params
    params.require(:plurk).permit(:name,:content)
  end
end
