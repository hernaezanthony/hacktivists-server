class AddMoreFieldToEnrollment < ActiveRecord::Migration[5.0]
  def change
  		add_column :enrollments, :is_canceled, :boolean
  end
end
