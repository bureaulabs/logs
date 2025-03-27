class Category < ApplicationRecord
	
	# Relationships
	has_many :entries
	
end
