json.timeline do |json|
  json.headline @user.header_name
  json.type 'default'
  json.text @user.department.name + "<br>" + @user.knowledge_area.name + "<br>" + @user.profile.about_me
  json.startDate l(@entries.last.date, :format => :timeline)
  if !@user.profile.image.url.nil? and !@user.profile.image.url.empty?
    json.asset do |json|
      json.partial! "asset", asset: @user.profile
    end
  end
  json.date @entries do |json, entry|
    json.partial! "entry", entry: entry
  end
end