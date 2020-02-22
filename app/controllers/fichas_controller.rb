class FichasController < ApplicationController
  before_action :authenticate_user!
  def index
    @fichas = Ficha.all
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
    redirect_to fichas_path, notice => "Se ha creado la ficha"
    else
    render "new"
    end
  end

  def edit
    @ficha = Ficha.find(params[:id])
  end

def update
  @ficha = Ficha.find(params[:id])
    if @ficha.update_attributes(ficha_params)

      redirect_to ficha_path(@ficha), notice => "Se ha actualizado la ficha"
    else

      render "edit"
    end
  end
  private

  def ficha_params
  params.require(:ficha).permit(:numero, :naprendices, :especialidad_id, :fechafin)
  end

end
