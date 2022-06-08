module Api
  module V1
    class CommentsController < ApplicationController
      include Likeable

      before_action :set_comment, only: %i[ update destroy]

      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @comment.destroy
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:author_id, :content, :issue_id)
      end
    end
  end
end
