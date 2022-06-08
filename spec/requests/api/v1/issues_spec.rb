require 'rails_helper'

RSpec.describe '/issues', type: :request, skip_request: true do
  let!(:user) { create(:user) }
  let(:valid_attributes) do
    { title: 'first bug', description: 'first description', author_id: user.id }
  end

  let(:invalid_attributes) do
    { author_id: 123 }
  end

  let(:valid_headers) { auth_headers }

  describe 'GET /index' do
    it 'renders a successful response' do
      Issue.create! valid_attributes
      get api_v1_issues_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response', :aggregate_failures do
      issue = Issue.create! valid_attributes
      get api_v1_issue_url(issue), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Issue' do
        expect {
          post api_v1_issues_url,
               params: { issue: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Issue, :count).by(1)
      end

      it 'renders a JSON response with the new issue', :aggregate_failures do
        post api_v1_issues_url,
             params: { issue: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Issue' do
        expect {
          post api_v1_issues_url,
               params: { issue: invalid_attributes }, as: :json
        }.not_to change(Issue, :count)
      end

      it 'renders a JSON response with errors for the new issue', :aggregate_failures do
        post api_v1_issues_url,
             params: { issue: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { title: 'new title' }
      end

      it 'updates the requested issue' do
        issue = Issue.create! valid_attributes
        patch api_v1_issue_url(issue),
              params: { issue: new_attributes }, headers: valid_headers, as: :json
        issue.reload
        expect(issue.title).to eq 'new title'
      end

      it 'renders a JSON response with the issue', :aggregate_failures do
        issue = Issue.create! valid_attributes
        patch api_v1_issue_url(issue),
              params: { issue: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested issue' do
      issue = Issue.create! valid_attributes
      expect {
        delete api_v1_issue_url(issue), headers: valid_headers, as: :json
      }.to change(Issue, :count).by(-1)
    end
  end
end
