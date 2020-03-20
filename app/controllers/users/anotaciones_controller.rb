module Users
  # frozen_string_literal: true

  # Controlador Users/Anotaciones => Module Users
  class AnotacionesController < ApplicationController
    before_action :set_user

    def index
      @anotaciones = @user.anotaciones.all.page params[:page]
    end

    def show; end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
