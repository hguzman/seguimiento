class AnotacionesController < ApplicationController
  def index
    @anotaciones = current_user.anotaciones
  end

  def show
    @anotacion = Anotacion.find(params[:id])
  end

  def new

  end

  def create

  end

end
