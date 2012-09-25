class PagesController < ApplicationController
  def home
    @entries = Entry.order("rand()").where(:published => true).joins(:images).all(:limit => 3, :group => :id)
    @users = User.order("rand()").joins(:entries).all(:limit => 3, :group => :id)
    @departments = Department.order("rand()").joins(:entries).all(:limit => 3, :group => :id)
    if @entries.empty? && @users.empty? && @departments.empty?
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

  def explore
    @entries = Entry.order("rand()").where(:published => true).joins(:images).all(:limit => 5, :group => :id)
    @departments = Department.order("rand()").joins(:entries).all(:limit => 5, :group => :id)
    @knowledge_areas = KnowledgeArea.order("rand()").joins(:entries).all(:limit => 5, :group => :id)
    @research_lines = ResearchLine.order("rand()").joins(:entries).all(:limit => 5, :group => :id)
    if @entries.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    end
  end

  def timeline
    @entries = Entry.order("date DESC").where(:published => true)
    respond_to do |format|
      format.json
    end
  end

end
