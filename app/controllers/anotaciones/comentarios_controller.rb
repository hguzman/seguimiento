module Anotaciones
  class ComentariosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_anotacion
    before_action :set_comentario, only: %i[show edit update destroy]
    respond_to :html

    def index
      @comentarios = @anotacion.comentarios.page params[:page]
    end

    def show; end

    def edit; end

    def update
      if @comentario.update(comentario_params)
        flash[:success] = 'Anotacion Registrada'
        respond_with @anotacion, @comentario
      else
        flash[:alert] = t('.alert')
        render 'edit'
      end
    end

    def new
      @comentario = @anotacion.comentarios.new
    end

    def create
      @comentario = @anotacion.comentarios.new(comentario_params)
      if @comentario.save
        flash[:success] = t('success')
        respond_with @anotacion, @comentario
      else
        flash[:alert] = t('.alert')
        render :new
      end
    end

    private

    def set_anotacion
      @anotacion = Anotacion.find(params[:anotacion_id])
    end

    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    def comentario_params
      params.require(:comentario).permit(:comentario)
    end
  end
end
