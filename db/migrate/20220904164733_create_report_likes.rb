class CreateReportLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :report_likes do |t|
      t.integer :user_id
      t.integer :report_id

      t.timestamps
    end
  end
end
