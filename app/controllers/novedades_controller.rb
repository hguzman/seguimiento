class NovedadesController < ApplicationController
  before_action :authenticate_user!

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
      @novedad = current_user.novedades.find(params[:id])
    end

    private

    def novedad_params
      params.require(:novedad).permit(:titulo, :descripcion)
    end

end
