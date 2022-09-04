class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :area_id
      t.string :title
      t.text :request_sentence
      t.boolean :is_active

      t.timestamps
    end
  end
end
