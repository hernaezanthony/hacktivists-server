class AddFieldsToPetition < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :petitions, :subject, :string
  	  	add_column :petitions, :level, :string
  	  	add_column :petitions, :location, :string
  	  	add_column :petitions, :enrolled_students, :integer
  end
end
