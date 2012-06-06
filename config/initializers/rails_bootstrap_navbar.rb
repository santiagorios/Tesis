RailsBootstrapNavbar::ViewHelpers.module_eval do
	def nav_bar_div(fixed, &block)
		content_tag :div, :class => nav_bar_css_class(fixed) do
			yield + content_tag(:div, "" ,:class => "footer-accent")
		end
  	end
end