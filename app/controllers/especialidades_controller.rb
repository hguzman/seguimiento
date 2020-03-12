# frozen_string_literal: true

# Controlador de Especialidades
class EspecialidadesController < ApplicationController
  respond_to :html, :json, :js
  before_action :authenticate_user!

  def index
    authorize Especialidad
    @especialidades = Especialidad.all
  end

  def new
    @especialidad = Especialidad.new
    respond_to do |f|
      # f.html
      f.js
    end
  end

  def create
    @especialidad = Especialidad.new(especialidad_params)
    if @especialidad.save
      flash[:success] = 'Especialidad Registrada'
      respond_with @especialidad
    else
      flash[:alert] = 'Error de Registro'
      render :new
    end
  end

  def edit
    @especialidad = Especialidad.find(params[:id])
  end

  def update
    @especialidad = Especialidad.find(params[:id])
    if @especialidad.update(especialidad_params)
      redirect_to especialidad_path(@especialidad)
      flash[:success] = 'Especialidad Registrada'
    else
      render 'edit'
    end
  end

  def show
    @especialidad = Especialidad.find(params[:id])
  end

  private

  def especialidad_params
    params.require(:especialidad).permit(:nombre)
  end
end
