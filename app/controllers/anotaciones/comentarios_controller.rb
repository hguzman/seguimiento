# frozen_string_literal: true

  module Anotaciones
    class ComentariosController < ApplicationController
      respond_to :html
      before_action :set_anotacion
      # before_action :set_user
      before_action :set_comentario, only: %i[show edit update destroy]

      def index
        @comentarios = @anotacion.comentarios
      end

      def new
        @comentario = @anotacion.comentarios.new
      end

      def show; end

      def create
        @comentario = @anotacion.comentarios.new(comentario_params)
          if @comentario.save
            flash[:success] = t('success')
            redirect_to anotacion_comentarios_path(@anotacion)
          else
            flash[:alert] = t('.alert')
            render :new
          end
        end

        def edit; end

        def update
          if @comentario.update(comentario_params)
            flash[:success] = t('.success')
            redirect_to anotacion_comentarios_path(@anotacion)
          else
            flash[:alert] = t('.alert')
            render :edit
          end
        end

        def destroy
          @comentario.destroy
          flash[:success] = t('.success')
          redirect_to anotacion_comentarios_path(@anotacion)
        end

        private

        def set_anotacion
          @anotacion = Anotacion.find(params[:anotacion_id])
        end

        def set_comentario
        @comentario = @anotacion.comentarios.find(params[:id])
      end

      # def set_user
      #   @user = current_user
      # end

      def comentario_params
        params.require(:comentario).permit(:comentario, :id)
      end
    end
end
