# frozen_string_literal: true

module Admin
  class TipoDocumentosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tipodocumento, only: %I[show edit update destroy]
    respond_to :html

    def index
      if params[:q].present?
        if params[:q].include? ':'
          @tipodocumentos = Tipodocumento.where('cast(id as text) ilike :q', q: "%#{params[:q].gsub(":","").to_i}%").order(id: :asc).page params[:page]
        else
          @tipodocumentos = Tipodocumento.where('cast(id as text) ilike :q or cast(created_at as text) ilike :q or cast(nombre as text) ilike :q', q: "%#{params[:q]}%").order(id: :asc).page params[:page]
        end
      else
        @tipodocumentos =  Tipodocumento.page params[:page]
      end
      respond_html_and_csv
    end

  def respond_html_and_csv
    respond_to do |format|
      format.html
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="tipodocumentos.xlsx"'
      end
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