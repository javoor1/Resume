module ApplicationHelper

	def login_helper(style)
		if current_user.is_a?(GuestUser)
		  (link_to "Register", new_user_registration_path, class: style) + " ".html_safe + #para que el método regrese dos cosas concatenamos los links_to de register y login
		  
		  (link_to "Login", new_user_session_path, class: style)
		else
		  link_to("Logout", destroy_user_session_path, method: :delete, class: style)
		end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]}, and you are in the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
	end

  def set_copyright
		@copyright = JavierOa::Renderer.copyright("Javier Ortiz Arellano", "Programado en Ruby on Rails" )
	end


end
