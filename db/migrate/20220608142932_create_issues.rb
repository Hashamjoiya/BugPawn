class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.belongs_to :author, null: false
      t.belongs_to :assignee

      t.timestamps
    end
  end
end
