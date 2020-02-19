class EspecialidadesController < ApplicationController
  def index
  @especialidades = Especialidad.all
  end
  
  def new
  @especialidad = Especialidad.new
  end
  
  def create
  @especialidad = Especialidad.new(especialidad_params)
  if @especialidad.save
  redirect_to especialidades_path, notice => "Se ha creado la especialidad"
  else
  render "new"
  end
  end
  
  def edit
  end
  
  def update
  end
  
  def show
  end
  
  private
  
  def especialidad_params
  params.require(:especialidad).permit(:nombre)
  end
  end