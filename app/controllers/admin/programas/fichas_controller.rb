# frozen_string_literal: true

module Admin
  module Programas
    class FichasController < ApplicationController
      respond_to :html
      before_action :set_programa
      before_action :set_ficha, only: %i[show edit update destroy]

      def index
        @fichas = if params[:q].present?
                    @programa.fichas.where('cast(fichas.numero as text) ilike
                    :q', q: "%#{params[:q]}%").page params[:page]
                  else
                    @programa.fichas.page params[:page]
                  end
      end

      def new
        @ficha = @programa.fichas.new
      end

      def show; end

      def create
        @ficha = @programa.fichas.new(ficha_params)
        if @ficha.save
          flash[:success] = t('.success')
          respond_with :admin, @programa, @ficha
        else
          flash[:alert] = t('.alert')
          render :new
        end
      end

      def edit; end

      def update
        if @ficha.update(ficha_params)
          flash[:success] = t('.success')
          respond_with :admin, @programa, @ficha
        else
          flash[:alert] = t('.alert')
          render :edit
        end
      end

      def destroy
        @ficha.destroy
        flash[:success] = t('.success')
        respond_with :admin, @programa, :fichas
      end

      private

      def set_programa
        @programa = Programa.find(params[:programa_id])
      end

      def set_ficha
        @ficha = @programa.fichas.find(params[:id])
      end

      def ficha_params
        params.require(:ficha).permit(:numero, :numero_aprendices,
                                      :fecha_fin_at)
      end
    end
  end
end
