class AddMoreFieldsToPetition < ActiveRecord::Migration[5.0]
  def change
  	  	  	add_column :petitions, :description, :string
  end
end
