class AnotacionesController < ApplicationController
  def index
    @anotaciones = current_user.anotaciones
  end
end
