class PagesController < ApplicationController
  def home
    @entries_carousel = Entry.order("random()").where(:published => true).joins(:images).all(:limit => 3, :group => :id)
    @users = User.order("random()").joins(:entries).all(:limit => 3, :group => :id)
    @departments = Department.order("random()").joins(:entries).all(:limit => 3, :group => :id)
    #@entries_list =
  end

  def about
  end

  def help
  end

end
