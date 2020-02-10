class NovedadesController < ApplicationController
  before_action :authenticate_user! 

    def index
      @novedades = current_user.novedades
    end

    def show
      @novedad = current_user.novedades.find(params[:id])      
    end

end
