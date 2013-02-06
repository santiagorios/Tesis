# encoding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        small "Bienvenido a la Administración" 
        span "Sistema de Difusión de la gestión del conocimiento de la ESPE."
        
      end
    end
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
        br
    end
    # Here is an example of a simple dashboard with columns and panels.
    #

    columns do
      column do
        panel "Roles" do
          ul do
            Role.order("rand()").all(:limit => 5).map do |department|
              li link_to(department.name, admin_department_path(department))
            end
          end
        end
      end
      column do
        panel "Líneas de Investigación" do
          ul do
            ResearchLine.order("rand()").all(:limit => 5).map do |department|
              li link_to(department.name, admin_department_path(department))
            end
          end
        end
      end
      column do
        panel "Sub-líneas de Investigación" do
          ul do
            ResearchSubline.order("rand()").all(:limit => 5).map do |department|
              li link_to(department.name, admin_department_path(department))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Usuarios" do
          link_to("Usuarios", admin_users_path)
        end
      end
      

      column do
        panel "Departamentos" do
          ul do
            Department.order("rand()").all(:limit => 5).map do |department|
              li link_to(department.name, admin_department_path(department))
            end
          end
        end
      end
    #end

    #columns do
      column do
        panel "Areas de Conocimiento" do
          ul do
            KnowledgeArea.order("rand()").all(:limit => 5).map do |department|
              li link_to(department.name, admin_department_path(department))
            end
          end
        end
      end
    end
  end # content
end
