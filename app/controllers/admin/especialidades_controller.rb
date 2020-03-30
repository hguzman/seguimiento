# frozen_string_literal: true

module Admin
  class EspecialidadesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_especialidad, only: %i[show edit update destroy]
    respond_to :html

    def index
      # authorize Especialidad
      @especialidades = if params[:q].present?
                          Especialidad.where('nombre ilike :q', q:
                          "%#{params[:q]}%").page params[:page]
                        else
                          Especialidad.all.page params[:page]
                        end
    end

    def show; end

    def new
      @especialidad = Especialidad.new
      respond_to do |f|
        # f.html
        f.js
      end
    end

    def create
      @especialidad = Especialidad.new(especialidad_params)
      if @especialidad.save
        flash[:success] = t('.success')
        respond_with :admin, @especialidad
      else
        flash[:alert] = t('.alert')
        render 'new'
      end
    end

    def edit; end

    def update
      @especialidad = Especialidad.find(params[:id])
      if @especialidad.update(especialidad_params)
        flash[:success] = t('.success')
        respond_with :admin, @especialidad
      else
        flash[:alert] = t(`'alert'`)
        render 'edit'
      end
    end

    def destroy
      @especialidad.destroy
      flash[:success] = t('.success')
      respond_with :admin, :especialidades
    end

    private

    def set_especialidad
      @especialidad = Especialidad.find(params[:id])
    end

    def especialidad_params
      params.require(:especialidad).permit(:nombre)
    end
  end
end
