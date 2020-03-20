# frozen_string_literal: true

# Controlador de Fichas
class FichasController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, :js

  def index
    authorize Ficha
    @fichas = if params[:q].present?
                Ficha.where(
                  'cast(numero as text) ilike :q ',
                  q: "%#{params[:q]}%"
                ).page params[:page]
              else
                Ficha.all.page params[:page]
              end
  end

  def show
    @ficha = Ficha.find(params[:id])
  end

  def new
    @ficha = Ficha.new
  end

  def create
    @ficha = Ficha.new(ficha_params)
    if @ficha.save
      flash[:success] = 'Se ha creado la Ficha'
      respond_with @ficha
    else
      render 'new'
    end
  end

  def edit
    @ficha = Ficha.find(params[:id])
  end

  def update
    @ficha = Ficha.find(params[:id])
    if @ficha.update_attributes(ficha_params)
      flash[:success] = 'Se ha Actualizado la Ficha'
      redirect_to ficha_path(@ficha)
    else
      render 'edit'
    end
  end

  # Genera excel.
  def toexcel
    @fichas = Ficha.all
    respond_to do |format|
      format.xlsx
    end
  end

  private

  def ficha_params
    params.require(:ficha).permit(:numero,
                                  :naprendices,
                                  :especialidad_id,
                                  :fechafin)
  end
end
