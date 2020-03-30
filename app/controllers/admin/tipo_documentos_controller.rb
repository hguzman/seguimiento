# frozen_string_literal: true

module Admin
  class TipoDocumentosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tipodocumento, only: %I[show edit update destroy]
    respond_to :html

    def index
      @tipodocumentos = if params[:q].present?
                          Tipodocumento.where('nombre ilike :q', q:
                            "%#{params[:q]}%").page params[:page]
                        else
                          Tipodocumento.all.page params[:page]
                        end
    end

    def show; end

    def new
      @tipodocumento = Tipodocumento.new
    end

    def create
      @tipodocumento = Tipodocumento.new(tipodocumento_params)
      if @tipodocumento.save
        flash[:success] = t('.success')
        redirect_to admin_tipo_documento_path(@tipodocumento)
      else
        flash[:error] = t('.alert')
        render 'new'
      end
    end

    def edit; end

    def update
      if @tipodocumento.update_attributes(tipodocumento_params)
        flash[:success] = t('.success')
        # redirect_to admin_tipo_documento_path(@tipodocumento)
        respond_with :admin, :tipo_documentos
      else
        flash[:error] = t('.alert')
        render 'edit'
      end
    end

    def destroy
      @tipodocumento.destroy
      flash[:success] = t('.success')
      respond_with :admin, :tipo_documentos
    end

    private

    def set_tipodocumento
      @tipodocumento = Tipodocumento.find(params[:id])
    end

    def tipodocumento_params
      params.require(:tipodocumento).permit(:nombre)
    end
  end
end
