# frozen_string_literal: true

# Controlador de Ambientes
module Admin
  class AmbientesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_ambiente, only: %i[show edit update destroy]
    respond_to :html

    def index
      @ambientes = Ambiente.all.order(id: :asc).page params[:page]
      respond_to do |format|
        format.html
        format.xlsx do
          response.headers['Content-Disposition'] =
            'attachment; filename="ambientes.xlsx"'
        end
      end
    end

    def update
      if @ambiente.update_attributes(ambiente_params)
        flash[:success] = t('.success')
        respond_with :admin, @ambiente
      else
        render 'edit'
      end
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

    def destroy
      @ambiente.destroy
      flash[:success] = t('.success')
      respond_with :admin, :ambientes
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
