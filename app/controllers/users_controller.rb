class UsersController < ApplicationController

  def new
    @user = User.new
    @cities = cities_list
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(post_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome Bro !"
    else
      flash[:messages] = @user.errors.full_messages
      @cities = cities_list
      render :new
    end
  end

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end

  private

  def post_params
    params.require(:user).permit(:email,:age,:description,:password,:password_confirmation,:first_name,:last_name,:city_id)
  end

  def cities_list
    cities =[]
    City.all.each {|city| cities << city}
    return cities
  end
  
end