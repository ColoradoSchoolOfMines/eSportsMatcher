class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :correct_user]
  # finds current user before performing per-user actions (showing a user, editing that user, etc.)
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before controller does edit or update actions - check for logged_in_user
  before_action :correct_user, only: [:edit, :update]
  # correct_user must be logged in to do edit/update actions
  before_action :admin_user, only: :destroy
  # only admin users can destroy user accounts (through the destroy action of the controller)
  

  def find_user
    @user = User.find(params[:id]);
  end

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    unless @user.summoner.nil?
      @user.summoner.update
      @summoner = @user.summoner
    end
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
      create_summoner
      redirect_to root_url
    else
      render 'new'
    end
  end

   def edit
   end

   def update
     if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
       create_summoner
       redirect_to @user
     else
       render 'edit'
     end
   end

   def destroy
     @user.destroy
     flash[:success] = "User #{@user.name} deleted"
     redirect_to users_url
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
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def create_summoner
      unless @user.summoner_name.blank?
        # We allow users to register without providing a summoner name
        @user.create_summoner(name: @user.summoner_name)
        @user.summoner.update
      end
    end
end
