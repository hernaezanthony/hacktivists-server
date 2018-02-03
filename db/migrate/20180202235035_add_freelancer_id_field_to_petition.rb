class AddFreelancerIdFieldToPetition < ActiveRecord::Migration[5.0]
  def change
  	  add_column :petitions, :freelancer_id, :string
  end
end
