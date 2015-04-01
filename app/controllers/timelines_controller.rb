class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def index
    @plurks = current_user.plurks
    current_user.followeds.each do |user|
      @plurks += user.plurks
    end
  end

end
