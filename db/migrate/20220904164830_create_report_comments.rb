class CreateReportComments < ActiveRecord::Migration[6.1]
  def change
    create_table :report_comments do |t|
      t.integer :user_id
      t.integer :report_id
      t.text :comment

      t.timestamps
    end
  end
end
