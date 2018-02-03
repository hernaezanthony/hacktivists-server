class AddFieldToEnrollment < ActiveRecord::Migration[5.0]
  def change
	add_column :enrollments, :user_id, :integer
	add_column :enrollments, :petition_id, :integer
  end

end
