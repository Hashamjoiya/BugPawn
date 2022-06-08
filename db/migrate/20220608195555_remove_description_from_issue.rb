class RemoveDescriptionFromIssue < ActiveRecord::Migration[6.1]
  def change
    safety_assured { remove_column :issues, :description}
  end
end
