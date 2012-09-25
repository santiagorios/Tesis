json.timeline do |json|
  json.headline "Escuela Politécnica del Ejército"
  json.type 'default'
  json.text "Constituye uno de los institutos de educación superior más prestigiosos del Ecuador, el Consejo Nacional de Evaluación y Acreditación de la Educación Superior del Ecuador (CONEA), en el 2009 la ubicó en la categoría 'A', la máxima calificación otorgada a 11 instituciones en el país y sólo por detrás de dos escuelas politécnicas."
  json.startDate l(@entries.last.date, :format => :timeline)
  json.asset do |json|
    json.media  "http://www.ipgh.gob.ec/imagenes/logos/ESPE.gif"
    json.thumbnail "http://www.ipgh.gob.ec/imagenes/logos/ESPE.gif"
  end
  json.date @entries do |json, entry|
    json.partial! "entry", entry: entry
  end
end