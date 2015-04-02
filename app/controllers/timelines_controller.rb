class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def index
    @plurks = Plurk.where(user_id: [current_user.id, current_user.followed_ids]).order(created_at: :desc)
  end

end
