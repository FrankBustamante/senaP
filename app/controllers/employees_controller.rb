class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_areas, onli: [:new, :edit]
  after_action :verify_authorized

  # GET /clients
  # GET /clients.json
  def index
    @users = BranchOffice.find(params[:branch_office_id]).users.employee
    authorize @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(employee_params)
    authorize @user

    respond_to do |format|
      if @user.save
        @user.employee!
        format.html { redirect_to branch_office_employees_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user

    respond_to do |format|
      if @user.update(employee_params)
        format.html { redirect_to branch_office_employees_path, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user

    @user.destroy
    respond_to do |format|
      format.html { redirect_to branch_office_employees_path, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_areas
    @areas = BranchOffice.includes(:areas).find(params[:branch_office_id]).areas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:user).permit(:names, :identification, :last_names, :password, :email, :area_id, :role)
    end
end