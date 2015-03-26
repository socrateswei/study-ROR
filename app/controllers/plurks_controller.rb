class PlurksController < ApplicationController
  def index
    @plurks = Plurk.all
  end
end
