# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only:
    %i[show edit update]

    def index
      if params[:q].present?
        if params[:q].include? ':'
          @users = User.with_role :"#{params[:q].gsub(':', '')}"
        else
          @users = User.where('cast(ndocumento as text) ilike :q or cast(created_at as text) ilike :q or cast(nombres as text) ilike :q or cast(apellidos as text) ilike :q', q: "%#{params[:q]}%").order(id: :asc)
        end
      elsif current_user.has_role? :admin
        @users = User.order(id: :asc).page params[:page]
      end
      respond_html_and_csv
    end

  def respond_html_and_csv
    respond_to do |format|
      format.html
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="users.xlsx"'
      end
    end
  end

    def show; end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:success] = 'Registro Actualizado'
      else
        flash[:alert] = 'Error al Actualizar'
      end
      render :edit
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
