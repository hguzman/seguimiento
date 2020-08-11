# frozen_string_literal: true

module Admin
  module Especialidades
    # Clase programa del modulo especialidad en modulo admin
    class ProgramasController < ApplicationController
      before_action :authenticate_user!
      respond_to :html
      before_action :set_especialidad
      before_action :set_programa, only: %i[show edit update destroy]

      def index
        if params[:q].present?
          if params[:q].include? ':'
          @programas = @especialidad.programas.where('cast(id as text) ilike :q', q: "%#{params[:q].gsub(":","").to_i}%").order(id: :asc).page params[:page]
          else
          @programas = @especialidad.programas.where('cast(id as text) ilike :q or cast(created_at as text) ilike :q or nombre ilike :q', q: "%#{params[:q]}%").order(id: :asc).page params[:page]
          end
        else
          @programas = @especialidad.programas.order(id: :asc).page params[:page]
        end
        respond_html_and_csv
      end

      def respond_html_and_csv
        respond_to do |format|
          format.html
          format.xlsx do
            response.headers['Content-Disposition'] = 'attachment; filename="Programas.xlsx"'
          end
        end
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
          respond_with :admin, @especialidad, :programas
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
