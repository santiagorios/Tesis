# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'

  navigation.items do |primary|

    primary.item :title, t('application.type_sidebar_title'), :class => 'nav-header'

    types = ProgramType.all
    unless types.empty?
      unless @object.nil?
        for type in types do
          primary.item :types, type.name, url_for(:object_id => @object.id, :type_id => type.id, :action => "program_type"), :class => "nav nav-list"
        end
      else
        for type in types do
          primary.item :types, type.name, url_for(:id => type.id, :action => "program_type", :controller => "programs"), :class => "nav nav-list"
        end
      end

    end
    primary.dom_class = 'nav nav-list'

  end

end
