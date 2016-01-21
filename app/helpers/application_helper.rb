module ApplicationHelper
    def gravatar_for(user, options = { size: 70 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
	
	def link_to_in_li(body, url)
    active = "active" if current_page?(url)
    content_tag :li, class: active do
      link_to body, url
    end
  end

end
