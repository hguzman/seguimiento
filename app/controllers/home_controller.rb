# frozen_string_literal: true

# Controlador de Home
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @anotaciones = current_user.anotaciones.all.page params[:page]
  end

  def minor; end
end
