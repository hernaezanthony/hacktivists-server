class RemoveQuestionMark < ActiveRecord::Migration[5.0]
  def change
  	rename_column :petitions, :is_posted?, :is_posted
  	rename_column :petitions, :has_tutor?, :has_tutor
  end
end
