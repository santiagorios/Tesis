module EntriesHelper
  def just_created
    if URI(request.referer).path == '/entries/new'
      true
    else
      false
    end
  end
end
