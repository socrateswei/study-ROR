class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.following_ids.present?
      @plurks = Plurk.where(user_id: [current_user.id, current_user.following_ids]).order(created_at: :desc)
    else
      @plurks = current_user.plurks.order(created_at: :desc)
    end
  end

end
