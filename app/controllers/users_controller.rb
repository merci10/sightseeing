class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only:[:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    file = params[:user][:image]
    @user.set_image(file)
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー情報が更新されました"
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def current_user
      user = User.find(params[:id])
      if !current_user?(user)
        redirect_to root_path
      end
    end
end
