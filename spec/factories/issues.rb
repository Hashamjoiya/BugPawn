# == Schema Information
#
# Table name: issues
#
#  id          :bigint           not null, primary key
#  description :text
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
FactoryBot.define do
  factory :issue do
    title { 'MyString' }
    description { 'MyText' }
    association :author, factory: :user
    association :assignee, factory: :user
  end
end
