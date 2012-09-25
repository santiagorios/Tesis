json.startDate l(entry.date, :format => :timeline)
author = content_tag :h5 do
               link_to entry.author, url_for(entry.user)
            end
json.headline entry.title
json.tag link_to entry.user.department.name, url_for(entry.user.department) unless entry.user.department.nil? or entry.user.department.name.nil? or entry.user.department.name.empty?
json.text author + truncate_html(sanitize(entry.body.html_safe), :length => 450) + link_to(t('entry.read_more') ,url_for(entry))
if entry.images.count>0
  json.asset do |json|
    json.partial! "users/asset", asset: entry.images.first
  end
end