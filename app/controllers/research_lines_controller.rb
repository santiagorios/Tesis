class ResearchLinesController < ApplicationController
  def show
    @research_line = ResearchLine.find(params[:id])
    @entries = @research_line.entries.where(:published => true).all(:order => 'date DESC', :limit => 5)
    @programs = @research_line.programs.where(:published => true).all(:order => 'id DESC', :group => :id, :limit => 5)
    @projects = @research_line.projects.where(:published => true).all(:order => 'start_date DESC', :group => :id, :limit => 5)
    @research_sublines = @research_line.research_sublines
    if @entries.count == 0 && @programs.count == 0 && @projects.count == 0 && @research_sublines.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @research_line } }
      end
    end
  end

  def index
    @research_lines= ResearchLine.paginate(:page => params[:page])
  end

  def timeline
    @research_line = ResearchLine.find(params[:id])
    @entries = @research_line.entries.where(:published => true).all(:order => 'date DESC')
    respond_to do |format|
      format.json
    end
  end

  def programs
    @object = ResearchLine.find(params[:id])
    @programs = @object.programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def projects
    @object = ResearchLine.find(params[:id])
    @projects = @object.projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def results
    @object = ResearchLine.find(params[:id])
    @results = @object.results.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/results' }
    end
  end

  def entries
    @object = ResearchLine.find(params[:id])
    @entries = @object.entries.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/entries' }
    end
  end

  def research_sublines
    @object = ResearchLine.find(params[:id])
    @research_sublines = @object.research_sublines.paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/research_sublines' }
    end
  end

  def search
    @research_lines = ResearchLine.search(params[:search]).paginate(:page => params[:page])
    @collection = @research_lines
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end

end
