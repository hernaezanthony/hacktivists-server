class AddMoreMoreFieldToEnrollment < ActiveRecord::Migration[5.0]

	def up
  		change_column :enrollments, :is_canceled, :boolean ,default: true
	end

	def down
		change_column :enrollments, :is_canceled, :boolean ,default: nil
	end
end
