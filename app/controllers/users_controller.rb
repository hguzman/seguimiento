class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :edit]

  def index

    @users = User.all

  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] ="Registro actualizado"
    else
      flash[:alert]= "Problemas"
      render :show
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nombre, :apellido, :documento)
  end

end
