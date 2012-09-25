# -*- coding: utf-8 -*-
# Configures your navigation

SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.item :users, t('application.sidebar_title_users'), users_path, :class => 'nav-sub-header' do |sub_nav|
      users = User.order('random()').joins(:profile).where('profiles.name IS NOT NULL').all(:limit => 5, :group => :email)
      if !users.empty?
        for user in users do
          sub_nav.item :user, user.profile.try(:name), url_for(user)
        end
        sub_nav.dom_class = 'nav nav-list'
      end
    end
    primary.dom_class = 'nav nav-list'
  end
end
