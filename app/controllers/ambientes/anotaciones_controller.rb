# frozen_string_literal: true

module Ambientes
  class AnotacionesController < ApplicationController
    before_action :authenticate_user!
    respond_to :html
    before_action :set_ambiente
    before_action :set_anotacion, only: %i[show edit update destroy]
    before_action :set_operator, only: %i[create update]

    def index
      @anotaciones = @ambiente.anotaciones.order(id: :asc).page params[:page]
      respond_html_and_csv
    end

def respond_html_and_csv
  respond_to do |format|
    format.html
    format.xlsx do
      response.headers['Content-Disposition'] = 'attachment; filename="AmbientesAnotaciones.xlsx"'
    end
  end
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

    def destroy
      @anotacion.destroy
      flash[:success] = t('.success')
      respond_with @ambiente, :anotaciones
    end

    private

    def set_anotacion
      @anotacion = Anotacion.find(params[:id])
    end

    def set_ambiente
      @ambiente = Ambiente.find(params[:ambiente_id])
    end

    def set_operator
      OperatorRecordable.operator = current_user
    end

    def anotacion_params
      params.require(:anotacion).permit(:descripcion)
    end
  end
end
