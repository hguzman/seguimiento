# frozen_string_literal: true

# Controlador de Ambientes
module Admin
  class AmbientesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_ambiente, only: %i[show edit update destroy]
    respond_to :html

    def index
      @ambientes = Ambiente.all.order(id: :asc).page params[:page]
    end

    def new
      @ambiente = Ambiente.new
    end

    def edit; end

    def show; end

    def create
      @ambiente = Ambiente.new(ambiente_params)
      if @ambiente.save
        flash[:success] = t('.success')
        respond_with :admin, @ambiente
      else
        flash[:alert] = t('.alert')
        render 'new'
      end
    end

    private

    def ambiente_params
      params.require(:ambiente).permit(:nombre, :descripcion)
    end

    def set_ambiente
      @ambiente = Ambiente.find(params[:id])
    end
  end
end
