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

# rubocop:disable Rails/RedundantPresenceValidationOnBelongsTo
class Issue < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  validates :title, :content, presence: true
  validates :author, presence: true

  before_validation :set_default, on: :create

  enum status: { opened: 0, closed: 1 }

  has_rich_text :content

  acts_as_votable
  acts_as_taggable_on :labels

  private

  def set_default
    self.status = 'opened'
  end

end

# rubocop:enable Rails/RedundantPresenceValidationOnBelongsTo
