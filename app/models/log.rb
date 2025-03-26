class Log < ApplicationRecord
  
	# Relationships
	belongs_to :category
	
	# Activestorage
	has_one_attached :cover
	
end
