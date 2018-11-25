class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_copyright

  include DeviseWhitelistConcern
  include SetSourceConcern
  include	CurrentUserConcern
  include SetTitleConcern

  def set_copyright
		@copyright = JavierOrtizTool::Renderer.copyright("Javier Ortiz Arellano", "Programado en Ruby on Rails" )
	end

end

module JavierOrtizTool
	class Renderer
		def self.copyright(name, msg)
			"<b>#{name}</b> | &copy; #{Time.now.year} <br> #{msg} ".html_safe
		end
	end	
end