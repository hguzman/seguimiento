# frozen_string_literal: true

module Admin
  class FichasController < ApplicationController
    before_action :authenticate_user!
    before_action :set_ficha, only: %i[show edit update destroy]
    respond_to :html

    def index
      @fichas = Ficha.all.page params[:page]
    end

    def show; end

    def new
      @ficha = Ficha.new
    end

    def create
      @ficha = Ficha.new(ficha_params)
      if @ficha.save
        flash[:success] = t('.success')
        respond_with :admin, @ficha
      else
        flash[:success] = t('.success')
        render 'new'
      end
    end

    def edit; end

    def update
      if @ficha.update_attributes(ficha_params)
        flash[:success] = t('.success')
        redirect_to ficha_path(@ficha)
      else
        flash[:success] = t('.success')
        render 'edit'
      end
    end

    private

    def set_ficha
      @ficha = Ficha.find(params[:ficha_id])
    end

    def ficha_params
      params.require(:ficha).permit(:numero,
                                    :naprendices,
                                    :especialidad_id,
                                    :fechafin)
    end
  end
end
