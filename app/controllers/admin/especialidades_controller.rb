module Admin
  class EspecialidadesController < ApplicationController
    respond_to :html

    def index
      authorize Especialidad
      @especialidades = if params[:q].present?
                        Especialidad.where('nombre ilike :q', q:
                          "%#{params[:q]}%").page params[:page]
                      else
                        Especialidad.all.page params[:page]
                      end
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
      if @especialidad.save
        flash[:success] = t('.success')
        respond_with :admin, @especialidad
      else
        flash[:alert] = t('.alert')
        render 'new'
      end
    end

    def edit
      @especialidad = Especialidad.find(params[:id])
    end

    def update
      @especialidad = Especialidad.find(params[:id])
      if @especialidad.update(especialidad_params)
        redirect_to especialidad_path(@especialidad)
        flash[:success] = 'Especialidad Registrada'
      else
        render 'edit'
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
end