class CreateRequestLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :request_like do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
