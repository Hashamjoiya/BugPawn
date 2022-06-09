module Api
  module V1
    class IssuesController < Api::V1::ApiController
      include Likeable

      before_action :set_issue, only: %i[show update destroy]

      def index
        @query = Issue.includes([:rich_text_content]).ransack(params[:q])
        @pagy, @issues = pagy(@query.result)

        render :index
      end

      def show
        render :show
      end

      def create
        @issue = Issue.new(issue_params)

        if @issue.save
          render json: @issue, status: :created
        else
          render json: @issue.errors, status: :unprocessable_entity
        end
      end

      def update
        if @issue.update(issue_params)
          render json: @issue
        else
          render json: @issue.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @issue.destroy
      end

      private

      def set_issue
        @issue = Issue.includes([:rich_text_content]).find(params[:id])
      end

      def issue_params
        params.require(:issue).permit(:title, :content, :status, :assignee_id, :author_id, :label_list)
      end
    end
  end
end
