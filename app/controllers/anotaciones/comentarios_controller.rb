module Anotaciones
  class ComentariosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_anotacion, :set_operator, :set_anotacion_creator
    before_action :set_comentario, only: %i[show edit update destroy]
    after_action  :notificar, only: %i[create update]
    before_action :set_propietario, unless: :propietario_is_user?
    respond_to :html

    def index
      if params[:q].present?
        if params[:q].include? ':'
          @comentarios = @anotacion.comentarios.where('cast(id as text) ilike :q', q: "%#{params[:q].gsub(":","").to_i}%").order(id: :asc).page params[:page]
        else
          @comentarios = @anotacion.comentarios.where('cast(id as text) ilike :q or cast(created_at as text) ilike :q', q: "%#{params[:q]}%").or(@anotacion.comentarios.where('cast(created_by as text) ilike any (array[?])', User.where('nombres ilike :q or apellidos ilike :q', q:"%#{params[:q]}%").ids.map {|val| val.to_s})).order(id: :asc).page params[:page]
        end
      elsif current_user.has_role? :instructor
        @comentarios = @anotacion.comentarios.page params[:page]
      elsif current_user.has_role? :aprendiz
        @comentarios = @anotacion.comentarios.page params[:page]
      end
      respond_html_and_csv
    end

    def respond_html_and_csv
      respond_to do |format|
        format.html
        format.xlsx do
          response.headers['Content-Disposition'] = 'attachment; filename="omentariosAnotaciones.xlsx"'
        end
      end
    end

    def show; end

    def edit; end

    def update
      if @comentario.update(comentario_params)
        flash[:success] = t('.success')
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
        flash[:success] = t('.success')
        respond_with @anotacion, @comentario
      else
        flash[:alert] = t('.alert')
        render :new
      end
    end

    def notificar
      # validar si la solicitud de notificacion viene de un ambiente o de un user con anotable_type=2
      if @anotacion.anotable_type == "User"
        # se notifica al creador de la anotacion, que el aprendiz creo un comentario.
        if @user.has_role? :aprendiz
          UserMailer.comentario_mailer(@user, @anotacion, @comentario).deliver_now
        # se notifica al aprendiz y al creador de la anotacion
        # que se creo un comentario
        elsif  @user.id != current_user.id
          @list = [@user, @user_propietario]
          @list.each do |user|
            UserMailer.comentario_mailer(@user, @anotacion, @comentario).deliver_now
          end
        # notifica al aprendiz que se creo un comentario
        elsif  @user.id == current_user.id
          UserMailer.comentario_mailer(@user_propietario, @anotacion, @comentario).deliver_now
        end
      end
    end

    def destroy
      @comentario.destroy
      flash[:success] = t('.success')
      respond_with @anotacion, :comentarios
    end

    private

    def set_anotacion
      @anotacion = Anotacion.find(params[:anotacion_id])
    end

    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # quien crea la anotacion
    def set_anotacion_creator
      @user = Anotacion.find(params[:anotacion_id]).creator
    end

    # Tipo de anotacion realizada
    def propietario_is_user?
      @anotacion.anotable_type == "Ambiente"
    end

    # a quien se le asigna la anotacion
    def set_propietario
      @user_propietario = User.find(Anotacion.find(params[:anotacion_id]).anotable_id)
    end

    # quien crea el comentario
    def set_operator
      OperatorRecordable.operator = current_user
    end

    def comentario_params
      params.require(:comentario).permit(:comentario, :file)
    end
  end
end
