# -*- coding: utf-8 -*-
# Configures your navigation

SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.item :users, t('application.sidebar_title_users'), :class => 'nav-sub-header' do |sub_nav|
      sub_nav.item :user, t('user.groups_programs'), url_for(:controller => "users", :action => "groups_programs", :id => @user.id)
      sub_nav.item :user, t('user.groups_projects'), url_for(:controller => "users", :action => "groups_projects", :id => @user.id)
      sub_nav.dom_class = 'nav nav-list'
    end
    primary.dom_class = 'nav nav-list'
  end
end
