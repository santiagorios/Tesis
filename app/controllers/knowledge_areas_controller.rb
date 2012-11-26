class KnowledgeAreasController < ApplicationController
  def show
    @knowledge_area = KnowledgeArea.find(params[:id])
    @entries = @knowledge_area.entries.where(:published => true).all(:order => 'date DESC')
    @programs = @knowledge_area.programs.where(:published => true).all(:order => 'id DESC', :group => :id)
    @projects = @knowledge_area.projects.where(:published => true).all(:order => 'start_date DESC', :group => :id)
    if @entries.count == 0 && @programs.count == 0 && @projects.count == 0
      respond_to do |format|
        format.html { render :template => 'pages/empty_section', :locals => { :model => @knowledge_area } }
      end
    end
  end

  def index
    @knowledge_areas = KnowledgeArea.paginate(:page => params[:page])
  end

  def timeline
    @knowledge_area = KnowledgeArea.find(params[:id])
    @entries = @knowledge_area.entries.where(:published => true).all(:order => 'date DESC')
    respond_to do |format|
      format.json
    end
  end

  def programs
    @object = KnowledgeArea.find(params[:id])
    @programs = @object.programs.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/programs' }
    end
  end

  def projects
    @object = KnowledgeArea.find(params[:id])
    @projects = @object.projects.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/projects' }
    end
  end

  def results
    @object = KnowledgeArea.find(params[:id])
    @results = @object.results.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/results' }
    end
  end

  def entries
    @object = KnowledgeArea.find(params[:id])
    @entries = @object.entries.where(:published => true).all(:order => 'id DESC', :group => :id).paginate(:page => params[:page])
    respond_to do |format|
      format.html { render :template => 'pages/entries' }
    end
  end

  def search
    @knowledge_areas = KnowledgeArea.search(params[:search]).paginate(:page => params[:page])
    @collection = @knowledge_areas
    respond_to do |format|
      format.html { render :template => 'pages/search' }
      format.js { render :template => 'pages/search' }
    end
  end
end
