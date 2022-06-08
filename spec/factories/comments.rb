# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null, indexed
#  issue_id   :bigint           not null, indexed
#
# Indexes
#
#  index_comments_on_author_id  (author_id)
#  index_comments_on_issue_id   (issue_id)
#
FactoryBot.define do
  factory :comment do
    author { nil }
    content {'<b> some comment </b>'}
  end
end
