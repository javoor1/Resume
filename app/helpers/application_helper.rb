module ApplicationHelper

	def login_helper(style = "")
		if current_user.is_a?(GuestUser)
			#IMPORTANTE!!! para que el método regrese dos cosas concatenamos los links_to de register y login
		  (link_to "Register", new_user_registration_path, class: style) + " ".html_safe + 
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

	def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  # Nav helper toma dos argumentos, uno es la clase del estilo y el otro el tag de html.
  # iteramos sobre nav_items y llenamos el string nav_links, luego se le hace un html_safe para "traducirlo"
  def nav_helper(style, tag_type)
    nav_links = ""

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    p "Valor nav_links #{nav_links}" 
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end


end
