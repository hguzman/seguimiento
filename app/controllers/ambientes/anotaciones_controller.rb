module Ambientes
  class AnotacionesController < ApplicationController
    respond_to :html
    before_action :set_ambiente


    def new
      @anotacion = @ambiente.anotaciones.new
    end

    def create
      @anotacion = @ambiente.anotaciones.new(anotacion_params)
      if @anotacion.save
        flash[:success] = t('.success')
        respond_with @ambiente
      else
        flash[:alert] = t('.alert')
        render :new
      end
    end

    def edit
         @anotacion= Anotacion.find(params[:id])
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

    private

    def set_ambiente
      @ambiente = Ambiente.find(params[:ambiente_id])
    end


    def anotacion_params
      params.require(:anotacion).permit(:descripcion)
    end

  end
end
