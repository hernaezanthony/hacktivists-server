class Petition < ApplicationRecord

		belongs_to :user
		has_many :enrollment

	def display_name
  		return self.subject
    end
end

