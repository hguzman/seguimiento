# frozen_string_literal: true

# Controlador de Anotaciones
class AnotacionesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :admin
      if params[:q].present?
        # buscar anotaciones por documento, nombres o apellidos
        # entre anotaciones y user
        @anotaciones = Anotacion.includes(:user).where('ndocumento ilike :q or
          nombres ilike :q or apellidos ilike :q', q: "%#{params[:q]}%")
                                .references(:users)
      else
        @anotaciones = Anotacion.all
      end
    else
      @anotaciones = current_user.anotaciones
    end
  end

  def show
    @anotacion = Anotacion.find(params[:id])
  end

  def new
    @anotacion = Anotacion.new
  end

  def create
    @anotacion = Anotacion.new(anotacion_params)
    if @anotacion.save
      redirect_to users_path,
      flash[:success] = 'Se ha creado la Anotacion'
    else
      render 'new'
    end
  end

  def anotacion_params
    params.require(:anotacion).permit(:user_id, :descripcion)
  end
end
