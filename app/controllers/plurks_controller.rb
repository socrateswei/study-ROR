class PlurksController < ApplicationController
  def index
    @plurks = Plurk.all
  end
  def new
    @plurk = Plurk.new
  end
end
