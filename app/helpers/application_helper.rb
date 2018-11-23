module ApplicationHelper

	def login_helper
		if current_user.is_a?(User)
		  return link_to "Logout", destroy_user_session_path, method: :delete
		else
		  (link_to "Register", new_user_registration_path) + #para que el método regrese dos cosas concatenamos los links_to de register y login
		  "<br>".html_safe + 
		  (link_to "Login", new_user_session_path)
		end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]}, and you are in the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
	end

end
