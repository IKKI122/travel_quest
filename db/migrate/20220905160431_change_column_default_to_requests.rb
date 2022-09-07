class ChangeColumnDefaultToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :requests, :is_active, from: nil, to: false
  end
end
