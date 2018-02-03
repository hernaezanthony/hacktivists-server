class AddMoreMoreMoreFieldToPetition < ActiveRecord::Migration[5.0]
  def change
  	  	  add_column :petitions, :minimum_price, :string
  	  	  add_column :petitions, :maximum_price, :string
  end
end
