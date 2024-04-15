class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    feature = Feature.find_by(id: params[:feature_id])
      unless feature
        render json: { error: 'Feature no encontrado' }, status: :not_found
        return
      end

      comment = feature.comments.build(body: params[:body])
      if comment.save
        render json: { message: 'Comentario creado con exito!' }, status: :created
      else
        render json: { error: 'Error al crear el comentario', errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
