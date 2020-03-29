# frozen_string_literal: true

module Admin
  module Especialidades
    # Clase programa del modulo especialidad en modulo admin
    class ProgramasController < ApplicationController
      respond_to :html
      before_action :set_especialidad
      before_action :set_programa, only: %i[show edit update destroy]

      def index
        @programas = @especialidad.programas
      end

      def new
        @programa = @especialidad.programas.new
      end

      def show; end

      def edit; end

      def create
        @programa = @especialidad.programas.new(programa_params)
        if @programa.save
          flash[:success] = t('.success')
          respond_with :admin, @especialidad, @programa
        else
          flash[:alert] = t('.alert')
          render :new
        end
      end

      def update
        if @programa.update(programa_params)
          flash[:success] = t('.success')
          respond_with :admin, @especialidad, @programa
        else
          flash[:alert] = t('.alert')
          render :edit
        end
      end

      def destroy
        @programa.destroy
        flash[:success] = t('.success')
        respond_with :admin, @especialidad, :programas
      end

      private

      def set_especialidad
        @especialidad = Especialidad.find(params[:especialidad_id])
      end

      def set_programa
        @programa = @especialidad.programas.find(params[:id])
      end

      def programa_params
        params.require(:programa).permit(:nombre)
      end
    end
  end
end
