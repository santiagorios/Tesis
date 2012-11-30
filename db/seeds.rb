# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create!(:email => 'admin@espe.edu.ec', :password => 'password', :password_confirmation => 'password')

program_types = ProgramType.create([
                                       { name: "Investigación"},
                                       { name: "Vinculación con la colectividad" },
                                       { name: "Iniciación Científica" }
                                   ])

result_types = ResultType.create([
                                       { name: "Paper científico"},
                                       { name: "Póster" },
                                       { name: "Capítulo de Libro" }
                                   ])

users = User.create!([
                         { :email => "srrios@espe.edu.ec", :password => 'password', :password_confirmation => 'password' }
                     ])


departments = Department.create([
                                    { name: 'Ciencias de la Computación' },
                                    { name: 'Eléctrica y Electrónica' },
                                    { name: 'Lenguas'},
                                    { name: 'Seguridad'},
                                    { name: 'Ciencias de la Vida' },
                                    { name: 'Ciencias Exactas' },
                                    { name: 'Ciencias de la Tierra y Construcción' },
                                    { name: 'Ciencias de la Energía y Mecánica' },
                                    { name: 'Ciencias Económicas, Administrativas y de Comercio' },
                                    { name: 'Ciencias Humanas y Sociales' }
                                ])

knowledge_areas = KnowledgeArea.create([
                                           { name: 'Sistemas Eléctricos', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Sistemas Electrónicos', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Sistemas Digitales', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Procesamiento Digital de Señales', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Electromagnetismo y Óptica Aplicada', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Telecomunicaciones', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Automática y Robótica', department: Department.find_by_name('Eléctrica y Electrónica') },
                                           { name: 'Redes de Información', department: Department.find_by_name('Eléctrica y Electrónica') },

                                           { name: 'Ambiental', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },
                                           { name: 'Geoespacial', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },
                                           { name: 'Recursos Naturales', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },
                                           { name: 'Territorial', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },
                                           { name: 'Estructural y construcciones civiles', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },
                                           { name: 'Hidrosanitaria y planificación', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },
                                           { name: 'Vialidad y campo', department: Department.find_by_name('Ciencias de la Tierra y Construcción') },

                                      ])

research_lines = ResearchLine.create([
                                         { name: "Sistemas Agroproductivos Y Biotecnológicos Sostenibles" },
                                         { name: "Nanotecnología" },
                                         { name: "Materiales Y Tecnologías De Producción" },
                                         { name: "Energía" },
                                         { name: "Ambiente" },
                                         { name: "Estructuras y Construcciones" },
                                         { name: "Estudios Geoespaciales" },
                                         { name: "Automática y Control" },
                                         { name: "Tecnologías de la Información y Comunicación" },
                                         { name: "Sistemas Eléctricos, Electrónicos Y Computacionales" },
                                         { name: "Seguridad Informática" },
                                         { name: "Software Aplicado" },
                                         { name: "Seguridad y Defensa" },
                                         { name: "Emprendedorismo Y Estrategia Organizacional" },
                                         { name: "Tiempo Libre, Deporte Y, Calidad De Vida" },
                                         { name: "Curriculum" },
                                         { name: "Modelamiento Matemático" },
                                     ])

research_sublines = ResearchSubline.create([
                                               { name: "Sanidad e Inocuidad", research_line: ResearchLine.find_by_name("Sistemas Agroproductivos Y Biotecnológicos Sostenibles") },
                                               { name: "Mejoramiento Genético", research_line: ResearchLine.find_by_name("Sistemas Agroproductivos Y Biotecnológicos Sostenibles") },
                                               { name: "Nutrición", research_line: ResearchLine.find_by_name("Sistemas Agroproductivos Y Biotecnológicos Sostenibles") },
                                               { name: "Industria", research_line: ResearchLine.find_by_name("Sistemas Agroproductivos Y Biotecnológicos Sostenibles") },

                                               { name: "Nanomateriales en medicina", research_line: ResearchLine.find_by_name("Nanotecnología") },
                                               { name: "Nanomateriales aplicados a la remediación ambiental", research_line: ResearchLine.find_by_name("Nanotecnología") },
                                               { name: "Nanomateriales aplicados a sistemas energéticos", research_line: ResearchLine.find_by_name("Nanotecnología") },
                                               { name: "Transporte y evolución de los nanomateriales en sistemas biológicos", research_line: ResearchLine.find_by_name("Nanotecnología") },

                                               { name: "Procesos tecnológicos", research_line: ResearchLine.find_by_name("Materiales Y Tecnologías De Producción") },
                                               { name: "Protección de materiales", research_line: ResearchLine.find_by_name("Materiales Y Tecnologías De Producción") },
                                               { name: "Comportamiento de materiales", research_line: ResearchLine.find_by_name("Materiales Y Tecnologías De Producción") },
                                               { name: "Pruebas de materiales", research_line: ResearchLine.find_by_name("Materiales Y Tecnologías De Producción") },

                                               { name: "Energías renobables", research_line: ResearchLine.find_by_name("Energía") },
                                               { name: "Energías no renobables", research_line: ResearchLine.find_by_name("Energía") },

                                               { name: "Contaminación Ambiental : Aire , Agua y Suelo", research_line: ResearchLine.find_by_name("Ambiente") },

                                               { name: "Materiales de construcción alternativos", research_line: ResearchLine.find_by_name("Estructuras y Construcciones") },
                                               { name: "Aisladores de Base y Disipadores de Energía", research_line: ResearchLine.find_by_name("Estructuras y Construcciones") },
                                               { name: "Análisis Sísmico de estructuras especiales", research_line: ResearchLine.find_by_name("Estructuras y Construcciones") },
                                               { name: "Peligrosidad , Vunerabilidad y Reforzamiento Sísmico", research_line: ResearchLine.find_by_name("Estructuras y Construcciones") },
                                           ])