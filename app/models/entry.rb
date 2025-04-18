class Entry < ApplicationRecord
	
	# Pre-flight
	include Sluggable
	
	# Relationships
	belongs_to :site
	belongs_to :category
	
	# Activestorage
	has_one_attached :cover
	
	# Pretty URL's
	extend FriendlyId
	friendly_id :slug, use: :slugged
	
	# Scopes
	scope :published, -> { where(is_published: true) }
	scope :drafts, -> { where(is_published: false) }
	
end
