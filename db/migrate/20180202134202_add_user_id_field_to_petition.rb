class AddUserIdFieldToPetition < ActiveRecord::Migration[5.0]
  def change
  	  	  	add_column :petitions, :user_id, :integer
  end
end
