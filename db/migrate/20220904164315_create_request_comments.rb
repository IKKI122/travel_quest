class CreateRequestComments < ActiveRecord::Migration[6.1]
  def change
    create_table :request_comments do |t|
      t.integer :user_id
      t.integer :request_id
      t.text :comment

      t.timestamps
    end
  end
end
