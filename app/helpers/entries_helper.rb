module EntriesHelper
  def just_created_or_updated
    if URI(request.referer).path == '/entries/new' || URI(request.referer).path.match(/\/entries\/[0-9]+\/edit/i)
      true
    else
      false
    end
  end
end
