module Admin
  module Programas
    class FichasController < ApplicationController
      respond_to :html
      before_action :set_programa
      before_action :set_ficha, only: [:show, :edit, :update, :destroy]

      def index
        @fichas = @programa.fichas
      end

      def new
        @ficha = @programa.fichas.new
      end

      def show
      end

      def create
        @ficha = @programa.fichas.new(ficha_params)
        if @ficha.save
          flash[:success] = t('success')
          respond_with :admin, @programa, @ficha
        else
          flash[:alert] = t('.alert')
          render :new
        end
      end

      private

      def set_programa
        @programa = Programa.find(params[:programa_id])
      end

      def set_ficha
        @ficha = @programa.fichas.find(params[:id])
      end

      def ficha_params
        params.require(:ficha).permit(:numero)
      end

    end
  end
end

