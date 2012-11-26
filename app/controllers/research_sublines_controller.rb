class ResearchSublinesController < ApplicationController
  def index
    @research_sublines= ResearchSubline.paginate(:page => params[:page], :order => 'research_line_id')
  end

  def show
    @research_subline = ResearchSubline.find(params[:id])
    @entries = @research_subline.entries.where(:published => true).all(:order => 'date DESC', :limit => 5)
    @programs = @research_subline.programs.where(:published => true).all(:order => 'id DESC', :group => :id, :limit => 5)
    @projects = @research_subline.projects.where(:published => true).all(:order => 'start_date DESC', :group => :id, :limit => 5)
    if @entries.count == 0 && @programs.count == 0 && @projects.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @research_subline } }
      end
    end
  end

  def timeline
  end

  def programs
    @object = ResearchSubline.find(params[:id])
    @programs = @object.programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def projects
    @object = ResearchSubline.find(params[:id])
    @projects = @object.projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def results
    @object = ResearchSubline.find(params[:id])
    @results = @object.results.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/results' }
    end
  end

  def entries
    @object = ResearchSubline.find(params[:id])
    @entries = @object.entries.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/entries' }
    end
  end

  def search
    @research_sublines = ResearchSubline.search(params[:search]).paginate(:page => params[:page])
    @collection = @research_sublines
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end
end
