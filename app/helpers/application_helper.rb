module ApplicationHelper
	
	def icon(path)
		File.open("app/assets/icons/#{path}", "rb") do |file|
			raw file.read
		end
	end

end
