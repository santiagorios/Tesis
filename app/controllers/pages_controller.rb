class PagesController < ApplicationController
  def home
    @entries_carousel = Entry.order("date desc").where(:published => true).joins(:images).all(:limit => 5, :group => :id)
    @entries = Entry.order("rand()").where(:published => true).all(:limit => 5, :group => :id)
    @programs = Program.order("rand()").where(:published => true).all(:limit => 5, :group => :id)
    @projects = Project.order("rand()").where(:published => true).all(:limit => 5, :group => :id)
    @users = User.order("rand()").joins(:entries).all(:limit => 3, :group => :id)
    @groups = ResearchGroup.all(:limit => 5)

    @departments = Department.order("rand()").all(:limit => 5)
    @research_lines = ResearchLine.order("rand()").all(:limit => 10)

    @items = 5
    if @entries.empty? && @users.empty? && @departments.empty?
      respond_to do |format|
        format.html { render :template => 'pages/empty' }
      end
    end
  end

  def about
  end

  def help
  end

  def explore
    @entries = Entry.order("rand()").where(:published => true).joins(:images).all(:limit => 5, :group => :id)
    @programs = Program.order("rand()").where(:published => true).all(:limit => 5, :group => :id)
    @projects = Project.order("rand()").where(:published => true).all(:limit => 5, :group => :id)
    @departments = Department.order("rand()").joins(:entries).all(:limit => 5, :group => :id)
    @knowledge_areas = KnowledgeArea.order("rand()").joins(:entries).all(:limit => 5, :group => :id)
    @research_lines = ResearchLine.order("rand()").joins(:entries).all(:limit => 5, :group => :id)
    if @entries.empty? and @projects.empty? and @programs.empty?
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

  def search
    @entries = Entry.search(params[:search]).paginate(:page => params[:page])
    @programs = Program.search(params[:search]).paginate(:page => params[:page])
    @projects = Project.search(params[:search]).paginate(:page => params[:page])
    @results = Result.search(params[:search]).paginate(:page => params[:page])

    @departments = Department.search(params[:search]).paginate(:page => params[:page])
    @knowledge_areas = KnowledgeArea.search(params[:search]).paginate(:page => params[:page])

    @research_lines = ResearchLine.search(params[:search]).paginate(:page => params[:page])
    @research_sublines = ResearchSubline.search(params[:search]).paginate(:page => params[:page])

    @users = User.search(params[:search]).paginate(:page => params[:page])

  end

  def bydepartment

    @entries_carousel = Entry.order("date desc").where(:published => true).joins(:images).all(:limit => 5, :group => :id)
    @entries = Entry.order("rand()").where(:published => true).all(:limit => 3, :group => :id)
    @programs = Program.order("rand()").where(:published => true).all(:limit => 3, :group => :id)
    @projects = Project.order("rand()").where(:published => true).all(:limit => 3, :group => :id)
    @users = User.order("rand()").joins(:entries).all(:limit => 3, :group => :id)
    @groups = ResearchGroup.all(:limit => 3)

    @departments = Department.order("rand()").all
    @research_lines = ResearchLine.order("rand()").all(:limit => 10)
  end

end
