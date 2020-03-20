# frozen_string_literal: true

# Controlador de Comentarios
class ComentariosController < ApplicationController
  # frozen_string_literal: true

  def index; end

  def show; end

  def new; end

  def create
    # @comment = Comment.new(comment_params)
    # if @comment.save
    #   redirect_to [@comment.commentable], notice: 'Comment created'
    # else
    #   render :new
    # end
  end

  # def comment_params
  #   params.require(:comment).permit(:username, :message, :commentable_id, :commentable_type)
  # end

end



