class UpdateFollowToHaveFollowedId < ActiveRecord::Migration
  def change
    remove_column :follows, :follower_id, :integer
    add_column :follows, :followed_id, :integer
  end
end
