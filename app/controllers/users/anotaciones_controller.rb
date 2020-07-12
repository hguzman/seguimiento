module Users
  # frozen_string_literal: true

  # Controlador Users/Anotaciones => Module Users
  class AnotacionesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_anotacion, only: %i[show edit update destroy notificar]
    before_action :set_operator, only: %i[create update]
    respond_to :html

    def index
      @anotaciones = @user.anotaciones.page params[:page]
    end

    def show; end

    def new
      @anotacion = @user.anotaciones.new
    end

    def create
      @anotacion = @user.anotaciones.new(anotacion_params)
      if @anotacion.save
        flash[:success] = t('.success')
        respond_with @user, @anotacion
        UserMailer.anotacion_mailer(@user, @anotacion).deliver_now
      else
        flash[:alert] = t('.alert')
        render :new
      end
    end

    def edit; end

    def update
      if @anotacion.update(anotacion_params)
        flash[:success] = 'Anotacion Registrada'
        respond_with @user, @anotacion
      else
        flash[:alert] = t('.alert')
        render 'edit'
      end
    end

    def destroy
      @anotacion.destroy
      flash[:success] = t('.success')
      respond_with @user, :anotaciones
    end

    private

    def set_anotacion
      @anotacion = Anotacion.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_operator
      OperatorRecordable.operator = current_user
    end

    def anotacion_params
      params.require(:anotacion).permit(:descripcion)
    end
  end
end
