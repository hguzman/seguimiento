# frozen_string_literal: true

module Admin
  class EspecialidadesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_especialidad, only: %i[show edit update destroy]
    respond_to :html
    respond_to :js

    def index
      # authorize Especialidad
      if params[:q].present?
        if params[:q].include? ':'
          @especialidades = Especialidad.where('cast(id as text) ilike :q', q: "%#{params[:q].gsub(":","").to_i}%").order(id: :asc).page params[:page]
        else
          @especialidades = Especialidad.where('cast(id as text) ilike :q or cast(created_at as text) ilike :q or nombre ilike :q', q: "%#{params[:q]}%").order(id: :asc).page params[:page]
        end
      else
        @especialidades = Especialidad.all.page params[:page]
      end
      respond_html_and_csv
    end

    def respond_html_and_csv
      respond_to do |format|
        format.html
        format.xlsx do
          response.headers['Content-Disposition'] = 'attachment; filename="especialidades.xlsx"'
        end
      end
    end

    def show; end

    def new
      @especialidad = Especialidad.new
    end

    def create
      @especialidad = Especialidad.new(especialidad_params)
      if @especialidad.save
        flash[:success] = t('.success')
        respond_with :admin, @especialidad
      else
        flash[:alert] = t('alert')
        respond_with :admin, :especialidades
      end
    end

    def edit; end

    def update
      @especialidad = Especialidad.find(params[:id])
      if @especialidad.update(especialidad_params)
        flash[:success] = t('.success')
        respond_with :admin, @especialidad
      else
        flash[:alert] = t('alert')
        render 'edit'
      end
    end

    def destroy
      @especialidad.destroy
      flash[:success] = t('.success')
      respond_with :admin, :especialidades
    end

    private

    def set_especialidad
      @especialidad = Especialidad.find(params[:id])
    end

    def especialidad_params
      params.require(:especialidad).permit(:nombre)
    end
  end
end
