json.timeline do |json|
  json.headline @research_line.name
  json.type 'default'
  #json.text "REEMPLAZAR ESTO!"
  json.startDate l(@entries.last.date, :format => :timeline)
  json.date @entries do |json, entry|
    json.partial! "users/entry", entry: entry
  end
end