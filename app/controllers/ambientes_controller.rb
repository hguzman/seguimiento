# frozen_string_literal: true

# Controlador de Ambientes
class AmbientesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ambiente, only: %i[show edit update destroy]

  def index
    authorize Ambiente
    if params[:q].present?
      if params[:q].include? ':'
        @ambientes = Ambiente.where('cast(id as text) ilike :q', q: "%#{params[:q].gsub(":","").to_i}%").order(id: :asc).page params[:page]
      else
        @ambientes = Ambiente.where('cast(id as text) ilike :q or cast(descripcion as text) ilike :q or cast(nombre as text) ilike :q', q: "%#{params[:q]}%").order(id: :asc).page params[:page]
      end
    else
      @ambientes = Ambiente.all.order(id: :asc).page params[:page]
    end
    respond_html_and_csv
  end

  def respond_html_and_csv
    respond_to do |format|
      format.html
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="ambientes.xlsx"'
      end
    end
  end

  def show
    @anotaciones = @ambiente.anotaciones
  end

  def edit; end

  def new
    @ambiente = Ambiente.new
  end

  def create
    @ambiente = Ambiente.new(ambiente_params)
    if @ambiente.save
      redirect_to ambiente_path(@ambiente), notice: 'Se ha creado el ambiente'
    else
      render 'new'
    end
  end

  def update
    if @ambiente.update_attributes(ambiente_params)
      redirect_to ambiente_path(@ambiente), notice: 'Se ha Midificado el ambiente'
    else
      render 'edit'
    end
  end

  def ver_ambiente
    render template: 'ambientes/show'
  end

  private

  def ambiente_params
    params.require(:ambiente).permit(:nombre, :descripcion)
  end

  def set_ambiente
    @ambiente = Ambiente.find(params[:id])
  end
end
