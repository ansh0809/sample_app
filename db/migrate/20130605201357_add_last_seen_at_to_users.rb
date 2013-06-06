class AddLastSeenAtToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :last_seen, :timestamp
  end
end
