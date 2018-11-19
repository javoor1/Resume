module SetTitleConcern
	extend ActiveSupport::Concern

	included do
		before_filter :set_title
	end

	def set_title
		@page_title = "Javier Ortiz Arellano"
		@seo_keywords = "Javier Ortiz Arellano"
	end

end