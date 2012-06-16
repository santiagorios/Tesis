module EntriesHelper
  def just_created_or_updated
  	if uri?(request.referer)
	    if URI(request.referer).path == '/entries/new' || URI(request.referer).path.match(/\/entries\/[0-9]+\/edit/i)
	      true
	    else
	      false
	    end
    end
  end

  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

end
