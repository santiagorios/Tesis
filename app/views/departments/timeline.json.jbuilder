json.timeline do |json|
  json.headline @department.name
  json.type 'default'
  #json.text @user.department.name + "<br>" + @user.knowledge_area.name + "<br>" + @user.profile.about_me
  json.startDate l(@entries.last.date, :format => :timeline)
  json.date @entries do |json, entry|
    json.partial! "users/entry", entry: entry
  end
end