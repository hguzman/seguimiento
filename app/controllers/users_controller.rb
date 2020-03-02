class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :show ,:change_password, :update_password, :update]
  before_action :setiar_user, only: [:ver_user]

  def index
      @users = User.all
  end

  def show
    @user = User.find(current_user.id)
  end

  def ver_user
    render :template => 'users/show'
  end

  def edit
  end

  def change_password
  end

  def update_password
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      flash[:success] ="Contraseña Actualizada"
      redirect_to "/"
    else
      flash[:alert]="Error al Actualizar"
      render "change_password"
    end
  end

  def update
    if current_user.update(user_params)
      flash[:success]="Registro Actualizado"
      redirect_to edit_user_path
    else
      flash[:alert]="Error al Actualizar"
      render :edit
    end
  end

  private
  def set_user
    @user = current_user
  end

  def setiar_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :current_password,
                                 :password_confirmation,
                                 :nombres,
                                 :apellidos,
                                 :ndocumento,
                                 :telefono,
                                 :direccion,
                                 :avatar
                                 )
  end

end
