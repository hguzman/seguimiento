# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only:
    %i[show edit update]

    def index
      @users = User.all
    end

    def show; end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:success] = 'Registro Actualizado'
        render :edit
      else
        flash[:alert] = 'Error al Actualizar'
        render :edit
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :current_password, :password_confirmation,
        :nombres, :apellidos,
        :ndocumento, :telefono,
        :direccion, :avatar,
        :tipodocumento_id, :ficha_id, role_ids: []
      )
    end
  end
end
