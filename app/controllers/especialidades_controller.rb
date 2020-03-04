class EspecialidadesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Especialidad
    @especialidades = Especialidad.all
  end

  def new
    @especialidad = Especialidad.new
  end

  def create
    @especialidad = Especialidad.new(especialidad_params)
    if @especialidad.save
      redirect_to especialidades_path, notice: "Se ha creado la especialidad"
    else
      render "new"
    end
  end

  def edit
    @especialidad = Especialidad.find(params[:id])
  end

  def update
    @especialidad = Especialidad.find(params[:id])
    if @especialidad.update(especialidad_params)
      redirect_to especialidad_path(@especialidad), notice: "Se ha actualizado la especialidad"
    else
      render "edit"
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
