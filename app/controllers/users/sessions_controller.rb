class Users::SessionsController < Devise::SessionsController
 # before_filter :configure_sign_in_params, only: [:create]
  before_action :authenticate_user!
  def find_user
    if !current_user
      redirect_to root_path
    end
    @user = User.new
  end
  def result
    @user = User.find_for_authentication(:email => params["user"]["email"])
  end
  def follow
    @user = current_user
    @relationship = @user.relationships.new(follow_params)
    if @relationship.save
      redirect_to root_path
    else
      redirect_to find_path(follow_params)
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  def follow_params
    params.permit(:followed_id)
  end
end
