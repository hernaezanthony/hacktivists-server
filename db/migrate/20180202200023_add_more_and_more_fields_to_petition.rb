class AddMoreAndMoreFieldsToPetition < ActiveRecord::Migration[5.0]
  def change
  	add_column :petitions, :has_tutor?, :boolean ,:default => false
  	add_column :petitions, :tutor_fullname, :string
  	add_column :petitions, :is_posted?, :boolean ,:default => false
  end
end
