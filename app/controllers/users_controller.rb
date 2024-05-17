class UsersController < ApplicationController
  protect_from_forgery except: %i[ create verify ]
  before_action :set_user, only: %i[ show update destroy ]
  before_action :authorize_request, except: :create
  # wrap_parameters :user, include: [:password, :password_confirmation]

  # GET /users or /users.json
  def index
    # @users = User.all
    unauthorized
  end

  # GET /users/1 
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if params[:password] == params[:password_confirmation]
      @user.password = params[:password]
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      @user.errors.add(:password_confirmation, "password confirmation not matching")
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    response = @user.destroy
    if response
      render json: { delete: "success" }
    else
      render json: response, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:photo, :name, :email, :number, :address, :password, :password_confirmation)
    end
end
