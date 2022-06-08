# == Schema Information
#
# Table name: issues
#
#  id          :bigint           not null, primary key
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  assignee_id :bigint           indexed
#  author_id   :bigint           not null, indexed
#
# Indexes
#
#  index_issues_on_assignee_id  (assignee_id)
#  index_issues_on_author_id    (author_id)
#
require 'rails_helper'

RSpec.describe Issue, type: :model do
  let(:issue) { build(:issue) }

  describe 'associations', :aggregate_failures do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:assignee).optional }
  end


  describe 'validations', :aggregate_failures do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  describe 'callbacks' do
    before do
      allow(issue).to receive(:set_default).and_call_original
    end

    context 'when creating a new issue' do
        it 'calls set_status callback and set the status to update', :aggregate_failures do
          issue.save!
          expect(issue).to have_received(:set_default)
          expect(issue.status).to eq 'opened'
        end
      end
  end
end
