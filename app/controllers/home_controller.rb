# frozen_string_literal: true

# Controlador de Home
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def minor; end
end
