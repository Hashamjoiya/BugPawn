class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :author, null: false
      t.belongs_to :issue, null: false

      t.timestamps
    end
  end
end
