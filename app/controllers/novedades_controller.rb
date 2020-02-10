class NovedadesController < ApplicationController
  before_action :authenticate_user!

    def index
      @novedades = current_user.novedades
    end

end
