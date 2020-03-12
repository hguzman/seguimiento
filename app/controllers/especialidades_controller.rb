class EspecialidadesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Especialidad
    @especialidades = Especialidad.all.page params[:page]
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
    respond_to do |format|
      if @especialidad.save
          flash[:success]="Especialidad Registrada"
          format.html {redirect_to @especialidad}
          format.json {render :index, status: :created, location: @espcialidad}
          format.js
        else
          flash[:alert]="Error de Registro"
          format.html {render :show}
          format.json {render json: @especialidad.errors, status: :unprocessable_entity}
      end
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
