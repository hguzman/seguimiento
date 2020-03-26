# frozen_string_literal: true

# Controlador de Anotaciones
class AnotacionesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.has_role? :admin
      @anotaciones = if params[:q].present?
                       Anotacion.where('cast(anotaciones.id as text) ilike :q',
                                       q: "%#{params[:q]}%").page params[:page]
                     else
                       Anotacion.all.page params[:page]
                     end
    else
      @anotaciones = current_user.anotaciones.all.page params[:page]
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
      flash[:success] = 'Se ha creado la Anotacion'
      redirect_to anotaciones_path
    else
      flash[:success] = 'Verifique datos, Anotacion no cerada'
      render 'new'
    end
  end

  def anotacion_params
    params.require(:anotacion).permit(:descripcion, :anotable_id,
                                      :anotable_type, :global_anotable)
  end

  def edit
    @anotacion = Anotacion.find(params[:id])
  end

  def update
    @anotacion = Anotacion.find(params[:id])
    if @anotacion.update(anotacion_params)
      redirect_to anotacion_path(@anotacion)
      flash[:success] = 'Anotacion Registrada'
    else
      render 'edit'
    end
  end
end
