class AnotacionesController < ApplicationController
  before_action :authenticate_user!

  def index
    @anotaciones = current_user.anotaciones
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
      redirect_to users_path, notice: "Se ha creado la novedad"
    else
      render "new"
    end
  end

  def anotacion_params
    params.require(:anotacion).permit(:user_id, :descripcion)
  end

end

