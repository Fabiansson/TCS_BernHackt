class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    redirect_to user_path current_user && return if logged_in?
    redirect_to login_path
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user.update!(edit_params)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the TCS App!"
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = 'User was successfully updates.'
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    flash[:success] = 'User was successfully destroyed.'
    redirect_to users_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :email, :tcs_number, :password, :password_confirmation)
  end

  def edit_params
    params.permit(:first_name, :last_name, :birth_date, :email, :tcs_number).delete_if { |_, v| v.blank? }.to_h
  end
end
