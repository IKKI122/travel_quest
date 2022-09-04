class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.string :prefectures

      t.timestamps
    end
  end
end
