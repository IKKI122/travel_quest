class ChangeRequestLikeToRequestLikes < ActiveRecord::Migration[6.1]
  def change
    rename_table :request_like, :request_likes
  end
end
