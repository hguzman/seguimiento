class NovedadesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_novedad, only: [:show, :update, :edit]

    def index
      @novedades = current_user.novedades
    end


    def new
      @novedad = current_user.novedades.new
    end

    def create
      @novedad = current_user.novedades.new(novedad_params)
      if @novedad.save
        redirect_to novedad_path(@novedad)
      else
        render :new
      end
    end

    def show

    end

    def edit

    end

    def update
      if @novedad.update(novedad_params)
        redirect_to novedad_path(@novedad)
      else
        render :edit
      end
    end

    private

    def set_novedad
      @novedad = current_user.novedades.find(params[:id])
    end

    def novedad_params
      params.require(:novedad).permit(:titulo, :descripcion)
    end

end
