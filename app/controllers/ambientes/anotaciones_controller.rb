# frozen_string_literal: true

module Ambientes
  class AnotacionesController < ApplicationController
    before_action :authenticate_user!
    respond_to :html
    before_action :set_ambiente
    before_action :set_anotacion, only: %i[show edit update destroy]

    def index
      @anotaciones = @ambiente.anotaciones
    end

    def show; end

    def new
      @anotacion = @ambiente.anotaciones.new
    end

    def create
      @anotacion = @ambiente.anotaciones.new(anotacion_params)
      if @anotacion.save
        flash[:success] = t('.success')
        respond_with @ambiente, @anotacion
      else
        flash[:alert] = t('.alert')
        render :new
      end
    end

    def edit; end

    def update
      if @anotacion.update(anotacion_params)
        flash[:success] = 'Anotacion Registrada'
        respond_with @ambiente, @anotacion
      else
        flash[:alert] = t('.alert')
        render 'edit'
      end
    end

    private

    def set_anotacion
      @anotacion = Anotacion.find(params[:id])
    end

    def set_ambiente
      @ambiente = Ambiente.find(params[:ambiente_id])
    end

    def anotacion_params
      params.require(:anotacion).permit(:descripcion)
    end
  end
end
