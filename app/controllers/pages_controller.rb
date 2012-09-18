class PagesController < ApplicationController
  def home
    @entries_carousel = Entry.order("random()").where(:published => true).joins(:images).all(:limit => 3, :group => :id)
    @users = User.order("random()").joins(:entries).all(:limit => 3, :group => :id)
    @departments = Department.order("random()").joins(:entries).all(:limit => 3, :group => :id)
    if @entries_carousel.empty? && @users.empty? && @departments.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    end
    #@entries_list =
  end

  def about
  end

  def help
  end

end
