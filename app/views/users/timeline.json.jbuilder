json.timeline do |json|
  json.headline @user.header_name
  json.type 'default'
  unless @user.department.nil? or @user.department.name.nil?
    department_name = @user.department.name
  else
    department_name = ""
  end

  unless @user.knowledge_area.nil? or @user.knowledge_area.name.nil?
    knowledge_area_name = @user.knowledge_area.name
  else
    knowledge_area_name = ""
  end

  unless @user.profile.about_me.nil?
    about_me = @user.profile.about_me
  else
    about_me = ""
  end

  json.text department_name + "<br>" + knowledge_area_name + "<br>" + about_me
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