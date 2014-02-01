class AddAuthTokenAndScoreToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :auth_token, :string
  	add_column :users, :score, :integer
  end
end
