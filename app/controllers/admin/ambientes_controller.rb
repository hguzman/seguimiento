module Admin
  class AmbientesController < ApplicationController
    respond_to :html

    def index
      @ambientes = Ambiente.all
    end

    def new
      @ambiente = Ambiente.new
    end

    def edit
    end

    def show
    end

    def create
      @ambiente = Ambiente.new(ambiente_params)
      if @ambiente.save
        flash[:success] = t('.success')
        respond_with :admin, @ambiente
      else
        flash[:alert] = t('.alert')
        render 'new'
      end
    end

    private

    def ambiente_params
      params.require(:ambiente).permit(:nombre, :descripcion)
    end
  end
end

