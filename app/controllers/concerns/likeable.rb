module Likeable
  extend ActiveSupport::Concern

  included do
    attr_reader :resource

    before_action :set_resource, only: %i[like unlike]

    def like
      resource.liked_by current_user
      render json: { message: :success }, status: :ok
    end

    def unlike
      resource.unliked_by current_user
      render json: { message: :success }, status: :no_content
    end
  end

  def set_resource
    @resource = controller_name.classify.constantize.find(params[:id])
  end
end
