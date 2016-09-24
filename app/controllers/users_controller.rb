class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before controller does edit or update actions - check for logged_in_user
  before_action :correct_user, only: [:edit, :update]
  # correct_user must be logged in to do edit/update actions
  before_action :admin_user, only: :destroy
  # only admin users can destroy user accounts (through the destroy action of the controller)
  
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    pull_summoner_data
    redirect_to root_url and return unless @user.activated?
  end

  def new
     @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "Thank you for registering for the eSports matching engine! Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
     else
       render 'edit'
     end
   end

   def destroy
     @user = User.find(params[:id])
     @user.destroy
     flash[:success] = "User #{@user.name} deleted"
     redirect_to users_url
   end

   def pull_summoner_data
    return if @user.summoner_name.nil?
    url = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{@user.summoner_name}?api_key=#{ENV['riot_api_key']}"
    @summoner_data = HTTParty.get(url)
    unless @summoner_data["status"].nil?
      # api request will not have a "status" field if it succeeded
      @summoner_data = "No Summoner Data Found"
    end
   end

  private
    def user_params
      params.require(:user).permit(:name, :email, :summoner_name,
                                   :password, :password_confirmation)
    end

    # Before filters
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms logged-in as correct user.
    def correct_user 
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
