module ApplicationHelper
	
	def icon(path)
		File.open("app/assets/icons/#{path}", "rb") do |file|
			raw file.read
		end
	end
	
	def working_url?(url)
		uri = URI.parse(url)
		uri.is_a?(URI::HTTP) && !uri.host.nil?
		rescue URI::InvalidURIError
		false
	end

end
