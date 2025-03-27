module Sluggable
	extend ActiveSupport::Concern
	
	included do
		before_create :build_slug
	end
	
	private
	
		def build_slug
			begin
				self.slug = SecureRandom.hex(6)
			end while self.class.exists?(:slug => slug)
		end
		
end