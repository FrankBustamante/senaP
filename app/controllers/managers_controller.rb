class ManagersController < ApplicationController
  after_action :verify_authorized

  def index
    @users = User.manager
    authorize @users
  end

  def new_manager
    @user = User.new
    authorize @user
  end

  def create_manager
    @user = User.new(manager_params)
    authorize @user

    respond_to do |format|
      if @user.save
        @user.manager!
        format.html { redirect_to root_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def manager_params
    params.require(:user).permit(:names, :identification, :last_names, :password, :email)
  end
end